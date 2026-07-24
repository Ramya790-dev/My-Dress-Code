package com.fashionstore.controller;

import java.io.IOException;

import com.fashionstore.dao.impl.UserDAOImpl;
import com.fashionstore.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /* =========================
       OPEN REGISTER PAGE
    ========================= */

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        request.getRequestDispatcher(
                "/WEB-INF/views/register.jsp")
                .forward(request, response);
    }

    /* =========================
       REGISTER USER
    ========================= */

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException, IOException {

        String fullName =
                request.getParameter("fullName");

        String email =
                request.getParameter("email");

        String phone =
                request.getParameter("phone");

        String password =
                request.getParameter("password");

        String addressLine1 =
                request.getParameter("addressLine1");

        String addressLine2 =
                request.getParameter("addressLine2");

        String city =
                request.getParameter("city");

        String state =
                request.getParameter("state");

        String pincode =
                request.getParameter("pincode");

        String country =
                request.getParameter("country");

        User user = new User();

        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);
        user.setAddressLine1(addressLine1);
        user.setAddressLine2(addressLine2);
        user.setCity(city);
        user.setState(state);
        user.setPincode(pincode);
        user.setCountry(country);

        UserDAOImpl dao =
                new UserDAOImpl();

        dao.registerUser(user);

        response.sendRedirect(
                request.getContextPath()
                + "/login");
    }
}