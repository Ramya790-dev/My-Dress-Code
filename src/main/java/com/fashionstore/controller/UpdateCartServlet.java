package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import com.fashionstore.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update-cart")
public class UpdateCartServlet
        extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        int productId =
            Integer.parseInt(
                request.getParameter("productId"));

        String action =
            request.getParameter("action");

        HttpSession session =
            request.getSession();

        List<CartItem> cart =
            (List<CartItem>)
            session.getAttribute("cart");

        if(cart != null) {

            for(CartItem item : cart) {

                if(item.getProduct()
                       .getProductId() == productId) {

                    if(action.equals("increase")) {

                        item.setQuantity(
                            item.getQuantity() + 1);
                    }

                    else if(action.equals("decrease")) {

                        item.setQuantity(
                            item.getQuantity() - 1);

                        if(item.getQuantity() <= 0) {

                            cart.remove(item);

                            break;
                        }
                    }
                }
            }
        }

        session.setAttribute("cart", cart);

        request.getRequestDispatcher(
            "/WEB-INF/views/cart.jsp")
            .forward(request, response);
    }
}