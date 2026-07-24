package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.CategoryDAO;
import com.fashionstore.model.Category;
import com.fashionstore.util.DBConnection;

public class CategoryDAOImpl implements CategoryDAO {

    private Connection connection;

    public CategoryDAOImpl() throws SQLException {
        connection = DBConnection.getConnection();
    }

    @Override
    public void addCategory(Category category) {
        try {
            String query = "INSERT INTO categories(category_name, description) VALUES (?, ?)";

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, category.getCategoryName());
            ps.setString(2, category.getDescription());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Category getCategoryById(int categoryId) {

        Category category = null;

        try {
            String query = "SELECT * FROM categories WHERE category_id=?";

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, categoryId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                category = new Category();

                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));
                category.setDescription(rs.getString("description"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return category;
    }

    @Override
    public List<Category> getAllCategories() {

        List<Category> categories = new ArrayList<>();

        try {
            String query = "SELECT * FROM categories";

            PreparedStatement ps = connection.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Category category = new Category();

                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));
                category.setDescription(rs.getString("description"));

                categories.add(category);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return categories;
    }

    @Override
    public void updateCategory(Category category) {

        try {
            String query = "UPDATE categories SET category_name=?, description=? WHERE category_id=?";

            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, category.getCategoryName());
            ps.setString(2, category.getDescription());
            ps.setInt(3, category.getCategoryId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCategory(int categoryId) {

        try {
            String query = "DELETE FROM categories WHERE category_id=?";

            PreparedStatement ps = connection.prepareStatement(query);

            ps.setInt(1, categoryId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Category> getActiveCategories() {
        return getAllCategories();
    }
}