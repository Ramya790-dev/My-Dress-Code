package com.fashionstore.controller;

import java.io.IOException;

import com.fashionstore.dao.UserDAO;
import com.fashionstore.dao.impl.UserDAOImpl;
import com.fashionstore.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    @Override
    public void init() {

        userDAO = new UserDAOImpl();
    }

    
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        request.getRequestDispatcher(
                "/WEB-INF/views/login.jsp")
                .forward(request, response);
    }

  

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("===== LOGIN START =====");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("Email : " + email);
        System.out.println("Password : " + password);

        User user = userDAO.loginUser(email, password);

        System.out.println("User Object : " + user);

        if(user != null){

            System.out.println("LOGIN SUCCESS");

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            response.sendRedirect(request.getContextPath()+"/home");

        }else{

            System.out.println("LOGIN FAILED");

            request.setAttribute("error","Invalid Email or Password");

            request.getRequestDispatcher("/WEB-INF/views/login.jsp")
                   .forward(request,response);
        }
    }
}