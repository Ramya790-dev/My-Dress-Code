package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import com.fashionstore.dao.OrderDAO;
import com.fashionstore.dao.UserDAO;
import com.fashionstore.dao.impl.OrderDAOImpl;
import com.fashionstore.dao.impl.UserDAOImpl;
import com.fashionstore.model.Order;
import com.fashionstore.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/customer-details")
public class AdminCustomerDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;
    private OrderDAO orderDAO;

    @Override
    public void init() {

        userDAO = new UserDAOImpl();
        orderDAO = new OrderDAOImpl();

    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

    	String id = request.getParameter("id");

    	System.out.println("Received ID = " + id);

    	if (id == null || id.trim().isEmpty()) {

    	    response.sendRedirect(request.getContextPath() + "/admin/customers");
    	    return;

    	}

    	int userId = Integer.parseInt(id);
    	System.out.println("User ID = " + userId);
    	
    	User customer = userDAO.getUserById(userId);

    	System.out.println("Customer = " + customer);
        List<Order> orders =
                orderDAO.getOrdersByUserId(userId);

        request.setAttribute("customer", customer);
        request.setAttribute("orders", orders);

        request.getRequestDispatcher(
                "/WEB-INF/views/admin/customer-details.jsp")
                .forward(request, response);
    }
}