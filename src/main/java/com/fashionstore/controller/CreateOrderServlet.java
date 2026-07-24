package com.fashionstore.controller;

import java.io.IOException;

import org.json.JSONObject;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/create-order")
public class CreateOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Replace with your Test Key ID and Secret
    private static final String KEY_ID = "rzp_test_TGXbMmfJTUd9d3";
    private static final String KEY_SECRET = "9TLfWY8QGWhRWKTUCLHDvMQ8";
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            RazorpayClient client =
                    new RazorpayClient(KEY_ID, KEY_SECRET);

            JSONObject orderRequest = new JSONObject();

            // ₹999 = 99900 paise
            orderRequest.put("amount", 99900);

            orderRequest.put("currency", "INR");

            orderRequest.put("receipt", "receipt_001");

            Order order = client.orders.create(orderRequest);

            request.setAttribute("orderId", order.get("id"));
            request.setAttribute("keyId", KEY_ID);

            request.getRequestDispatcher(
                    "/WEB-INF/views/razorpay.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            throw new ServletException(e);

        }
    }
}