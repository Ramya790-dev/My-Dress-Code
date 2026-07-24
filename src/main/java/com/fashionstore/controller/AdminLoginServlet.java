package com.fashionstore.controller;

import java.io.IOException;

import com.fashionstore.dao.AdminDAO;
import com.fashionstore.dao.impl.AdminDAOImpl;
import com.fashionstore.model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AdminDAO adminDAO;

    @Override
    public void init() throws ServletException {

        adminDAO = new AdminDAOImpl();

    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/views/admin/login.jsp")
                .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin admin = adminDAO.login(email, password);

        if (admin != null) {

            HttpSession session = request.getSession();

            session.setAttribute("admin", admin);

            response.sendRedirect(request.getContextPath() + "/admin/dashboard");

        } else {

            request.setAttribute("error", "Invalid Email or Password");

            request.getRequestDispatcher("/WEB-INF/views/admin/login.jsp")
                    .forward(request, response);

        }

    }

}