package com.fashionstore.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.fashionstore.dao.CategoryDAO;
import com.fashionstore.dao.impl.CategoryDAOImpl;
import com.fashionstore.model.Category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/add-category")
public class AdminAddCategoryServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {

        try {
            categoryDAO = new CategoryDAOImpl();
        } catch (SQLException e) {
            throw new ServletException(e);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
                "/WEB-INF/views/admin/add-category.jsp")
                .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Category category = new Category();

        category.setCategoryName(
                request.getParameter("name"));

        category.setDescription(
                request.getParameter("description"));

        categoryDAO.addCategory(category);

        response.sendRedirect(
                request.getContextPath() + "/admin/categories");

    }
}