package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import com.fashionstore.dao.OrderDAO;
import com.fashionstore.dao.impl.OrderDAOImpl;
import com.fashionstore.model.Order;
import com.fashionstore.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/my-orders")
public class MyOrdersServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAOImpl();
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
        
            if (user == null) {
        	
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        System.out.println("Logged In User ID = " + user.getUserId());
        System.out.println("Logged In User = " + user.getFullName());

        

        List<Order> orders = orderDAO.getOrdersByUserId(user.getUserId());
        
        System.out.println("Logged In User ID = " + user.getUserId());
        System.out.println("Orders Count = " + orders.size());

        for (Order o : orders) {
            System.out.println("Order ID = " + o.getOrderId());
        }

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/WEB-INF/views/my-orders.jsp")
               .forward(request, response);
    }
}