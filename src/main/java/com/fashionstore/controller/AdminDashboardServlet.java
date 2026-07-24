package com.fashionstore.controller;

import java.io.IOException;

import com.fashionstore.dao.AdminDAO;
import com.fashionstore.dao.impl.AdminDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AdminDAO adminDAO;

    @Override
    public void init() {

        adminDAO = new AdminDAOImpl();

    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin")==null){

            response.sendRedirect(request.getContextPath()+"/admin/login");
            return;

        }

        request.setAttribute("products",
                adminDAO.getTotalProducts());

        request.setAttribute("users",
                adminDAO.getTotalUsers());

        request.setAttribute("orders",
                adminDAO.getTotalOrders());

        request.setAttribute("revenue",
                adminDAO.getTotalRevenue());

        request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp")
                .forward(request,response);

    }

}