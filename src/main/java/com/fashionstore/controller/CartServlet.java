package com.fashionstore.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAOImpl();
    }

    // Handles links (GET)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // Handles forms (POST)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // 1. Get or Create Session (true ensures it creates one if it doesn't exist)
        HttpSession session = request.getSession(true);

        @SuppressWarnings("unchecked")
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        String action = request.getParameter("action");
        String idParam = request.getParameter("id");

        int productId = 0;
        if (idParam != null && !idParam.isEmpty()) {
            try {
                productId = Integer.parseInt(idParam);
            } catch (NumberFormatException e) {
                action = "view"; // Invalid ID, default to viewing the cart
            }
        }

        if (action == null) {
            action = "view";
        }

        // 2. Process Cart Actions
        switch (action) {
        case "add":
            if (productId > 0) { // Removed the DAO check temporarily
                cart.put(productId, cart.getOrDefault(productId, 0) + 1);
                session.setAttribute("successMessage", "Product added to cart!");
                System.out.println("Item added! Cart size is now: " + cart.size());
            }
            break;
            case "increase":
                if (productId > 0 && cart.containsKey(productId)) {
                    cart.put(productId, cart.get(productId) + 1);
                }
                break;
            case "decrease":
                if (productId > 0 && cart.containsKey(productId)) {
                    int qty = cart.get(productId);
                    if (qty > 1) {
                        cart.put(productId, qty - 1);
                    } else {
                        cart.remove(productId);
                    }
                }
                break;
            case "remove":
                if (productId > 0) {
                    cart.remove(productId);
                }
                break;
            case "view":
            default:
                // Do nothing, just proceed to render the view
                break;
        }

        // 3. Save Updated Cart
        session.setAttribute("cart", cart);

        // 4. Redirect Strategy (Prevents form re-submission on refresh)
        if (!"view".equals(action)) {
            if ("add".equals(action)) {
                String referer = request.getHeader("referer");
                response.sendRedirect(referer != null ? referer : request.getContextPath() + "/home");
            } else {
                response.sendRedirect(request.getContextPath() + "/cart");
            }
            return; 
        }

        // 5. Compile Data for View (Only happens if action == "view")
        Map<Product, Integer> detailedCartItems = new HashMap<>();
        double cartTotal = 0.0; // Assuming you want to display the total price

        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            Product p = productDAO.getProductById(entry.getKey());
            if (p != null) {
                detailedCartItems.put(p, entry.getValue());
                // Assuming your Product model has a getPrice() method
                cartTotal += (p.getPrice() * entry.getValue()); 
            }
        }

        request.setAttribute("cartItems", detailedCartItems);
        request.setAttribute("cartTotal", cartTotal);
        request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);
    }
}