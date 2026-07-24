package com.fashionstore.controller;

import java.io.IOException;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin/edit-product")
public class AdminEditProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Product product = productDAO.getProductById(id);

        request.setAttribute("product", product);

        request.getRequestDispatcher("/WEB-INF/views/admin/edit-product.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Product product = new Product();

        product.setProductId(
                Integer.parseInt(request.getParameter("id")));

        product.setCategoryId(
                Integer.parseInt(request.getParameter("category")));

        product.setProductName(
                request.getParameter("name"));

        product.setBrand(
                request.getParameter("brand"));

        product.setDescription(
                request.getParameter("description"));

        product.setPrice(
                Double.parseDouble(request.getParameter("price")));

        product.setImageUrl(
                request.getParameter("image"));

        product.setRating(
                Double.parseDouble(request.getParameter("rating")));

        product.setReviewCount(
                Integer.parseInt(request.getParameter("reviews")));

        product.setDiscountPercent(
                Double.parseDouble(request.getParameter("discount")));

        product.setActive(
                Boolean.parseBoolean(request.getParameter("active")));

        productDAO.updateProduct(product);

        response.sendRedirect(request.getContextPath()+"/admin/products");
    }
}