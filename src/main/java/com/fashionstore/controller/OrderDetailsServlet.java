package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import com.fashionstore.dao.OrderDAO;
import com.fashionstore.dao.impl.OrderDAOImpl;
import com.fashionstore.model.Order;
import com.fashionstore.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/order-details")
public class OrderDetailsServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/my-orders");
            return;
        }

        int orderId = Integer.parseInt(id);

        Order order = orderDAO.getOrderById(orderId);

        List<OrderItem> items = orderDAO.getOrderItems(orderId);

        request.setAttribute("order", order);
        request.setAttribute("items", items);

        request.getRequestDispatcher("/WEB-INF/views/order-details.jsp")
               .forward(request, response);
    }
}