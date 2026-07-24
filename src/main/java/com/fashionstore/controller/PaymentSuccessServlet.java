package com.fashionstore.controller;

import java.io.IOException;
import java.util.Map;

import com.fashionstore.dao.OrderDAO;
import com.fashionstore.dao.OrderItemDAO;
import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.OrderDAOImpl;
import com.fashionstore.dao.impl.OrderItemDAOImpl;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.Order;
import com.fashionstore.model.OrderItem;
import com.fashionstore.model.Product;
import com.fashionstore.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment-success")
public class PaymentSuccessServlet extends HttpServlet {

    private OrderDAO orderDAO;
    private ProductDAO productDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAOImpl();
        productDAO = new ProductDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");

        @SuppressWarnings("unchecked")
        Map<Integer, Integer> cart =
                (Map<Integer, Integer>) session.getAttribute("cart");

        if (user == null || cart == null || cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        double total = 0;

        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {

            Product product =
                    productDAO.getProductById(entry.getKey());

            if (product != null) {
                total += product.getPrice() * entry.getValue();
            }
        }

        Order order = new Order();

        order.setUserId(user.getUserId());
        order.setTotalAmount(total);
        order.setPaymentMethod("RAZORPAY");
        order.setOrderStatus("Pending");

        int orderId = orderDAO.createOrder(order);
        
        OrderItemDAO orderItemDAO = new OrderItemDAOImpl();

        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {

            Product product = productDAO.getProductById(entry.getKey());

            if (product != null) {

                OrderItem item = new OrderItem();

                item.setOrderId(orderId);
                item.setProductId(product.getProductId());
                item.setQuantity(entry.getValue());
                item.setUnitPrice(product.getPrice());
                item.setSubtotal(product.getPrice() * entry.getValue());

                orderItemDAO.addOrderItem(item);
            }
        }

        System.out.println("Order Created : " + orderId);

        // We'll save order items in the next step.

        session.removeAttribute("cart");

        response.sendRedirect(request.getContextPath() + "/order-success");
    }
}