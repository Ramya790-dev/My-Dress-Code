package com.fashionstore.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.fashionstore.dao.CategoryDAO;
import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.CategoryDAOImpl;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.Category;
import com.fashionstore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CategoryDAO categoryDAO;   // Use interface
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {

        try {
			categoryDAO = new CategoryDAOImpl();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        productDAO = new ProductDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Fetch categories
            List<Category> categories = categoryDAO.getAllCategories();

            // Fetch latest products
            List<Product> latestProducts = productDAO.getLatestProducts(8);
            System.out.println( "Latest Products = "+ latestProducts.size());
                    

            // Send data to JSP
            request.setAttribute("categories", categories);
            request.setAttribute("latestProducts", latestProducts);

            // Forward to home.jsp
            request.getRequestDispatcher("/WEB-INF/views/home.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                "<h2>Error Loading Home Page</h2>" +
                "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}