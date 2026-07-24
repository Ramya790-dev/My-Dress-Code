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

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        Map<Integer, Integer> cart = null;

        if (session != null) {
            cart = (Map<Integer, Integer>) session.getAttribute("cart");
        }

        Map<Product, Integer> checkoutItems = new HashMap<>();

        double grandTotal = 0;

        if (cart != null) {

            for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {

                Product product =
                        productDAO.getProductById(entry.getKey());

                if (product != null) {

                    checkoutItems.put(product, entry.getValue());

                    grandTotal +=
                            product.getPrice() * entry.getValue();
                }
            }
        }

        request.setAttribute("checkoutItems", checkoutItems);
        request.setAttribute("grandTotal", grandTotal);

        request.getRequestDispatcher(
                "/WEB-INF/views/checkout.jsp")
                .forward(request, response);
    }
}