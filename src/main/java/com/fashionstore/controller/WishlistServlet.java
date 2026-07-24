package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import com.fashionstore.dao.WishlistDAO;
import com.fashionstore.dao.impl.WishlistDAOImpl;
import com.fashionstore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private WishlistDAO wishlistDAO;

    @Override
    public void init() {

        wishlistDAO = new WishlistDAOImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = 1; // Temporary user
        String action = request.getParameter("action");
        String id = request.getParameter("id");

        /* =========================
           ADD TO WISHLIST
        ========================= */
        if ("add".equals(action) && id != null) {
            int productId = Integer.parseInt(id);
            wishlistDAO.addToWishlist(userId, productId);

            // FIX: Redirect back to the page the user was just on
            String referer = request.getHeader("Referer");
            if (referer != null && !referer.isEmpty()) {
                response.sendRedirect(referer);
            } else {
                // Fallback to home if no referer is found
                response.sendRedirect(request.getContextPath() + "/home");
            }
            return;
        }

        /* =========================
           REMOVE FROM WISHLIST
        ========================= */

        if ("remove".equals(action) &&
                id != null) {

            int productId =
                    Integer.parseInt(id);

            wishlistDAO.removeFromWishlist(
                    userId,
                    productId);

            response.sendRedirect(
                    request.getContextPath()
                    + "/wishlist");

            return;
        }

        /* =========================
           SHOW WISHLIST PAGE
        ========================= */

        List<Product> wishlistProducts =
                wishlistDAO.getWishlistByUserId(
                        userId);

        request.setAttribute(
                "wishlistProducts",
                wishlistProducts);

        request.getRequestDispatcher(
                "/WEB-INF/views/wishlist.jsp")
                .forward(request, response);
    }
}