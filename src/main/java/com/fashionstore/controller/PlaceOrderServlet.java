package com.fashionstore.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/place-order")
public class PlaceOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String paymentMethod = request.getParameter("paymentMethod");

        if ("COD".equals(paymentMethod)) {

            // TODO:
            // Save Order
            // Save Payment (Status = PENDING or COD)

            session.removeAttribute("cart");

            response.sendRedirect(
                    request.getContextPath() + "/order-success");

        } else if ("RAZORPAY".equals(paymentMethod)) {

            // Redirect to Razorpay payment process
            response.sendRedirect(
                    request.getContextPath() + "/create-order");

        } else {

            response.sendRedirect(
                    request.getContextPath() + "/checkout");

        }
    }
}