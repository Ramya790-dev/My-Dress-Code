package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.model.Product;
import com.fashionstore.util.DBConnection;

public class ProductDAOImpl implements ProductDAO {

    public ProductDAOImpl() {
    }

    // Add Product
    @Override
    public void addProduct(Product product) {

        String query = """
            INSERT INTO products
            (category_id,
             product_name,
             brand,
             description,
             price,
             image_url,
             rating,
             review_count,
             discount_percent,
             active)
            VALUES (?,?,?,?,?,?,?,?,?,?)
            """;
        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        connection.prepareStatement(query)
        ) {

        	ps.setInt(1, product.getCategoryId());
        	ps.setString(2, product.getProductName());
        	ps.setString(3, product.getBrand());
        	ps.setString(4, product.getDescription());
        	ps.setDouble(5, product.getPrice());
        	ps.setString(6, product.getImageUrl());
        	ps.setDouble(7, product.getRating());
        	ps.setInt(8, product.getReviewCount());
        	ps.setDouble(9, product.getDiscountPercent());
        	ps.setBoolean(10, product.isActive());
            ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    // Get Product By ID
    @Override
    public Product getProductById(int productId) {

        Product product = null;

        String query =
                "SELECT * FROM products WHERE product_id = ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        connection.prepareStatement(query)
        ) {

            ps.setInt(1, productId);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                product = new Product();

                product.setProductId(
                        rs.getInt("product_id"));

                product.setProductName(
                        rs.getString("product_name"));

                product.setDescription(
                        rs.getString("description"));

                product.setPrice(
                        rs.getDouble("price"));

                product.setCategoryId(
                        rs.getInt("category_id"));

                product.setImageUrl(
                        rs.getString("image_url"));
                product.setBrand(rs.getString("brand"));
                product.setRating(rs.getDouble("rating"));
                product.setReviewCount(rs.getInt("review_count"));
                product.setDiscountPercent(rs.getDouble("discount_percent"));
                product.setActive(rs.getBoolean("active"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return product;
    }

    // Get All Products
    @Override
    public List<Product> getAllProducts() {

        List<Product> products =
                new ArrayList<>();

        String query =
                "SELECT * FROM products";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        connection.prepareStatement(query);

                ResultSet rs =
                        ps.executeQuery()
        ) {

            while (rs.next()) {

                Product product =
                        new Product();

                product.setProductId(
                        rs.getInt("product_id"));

                product.setProductName(
                        rs.getString("product_name"));

                product.setDescription(
                        rs.getString("description"));

                product.setPrice(
                        rs.getDouble("price"));

                product.setCategoryId(
                        rs.getInt("category_id"));

                product.setImageUrl(
                        rs.getString("image_url"));
                product.setBrand(rs.getString("brand"));
                product.setRating(rs.getDouble("rating"));
                product.setReviewCount(rs.getInt("review_count"));
                product.setDiscountPercent(rs.getDouble("discount_percent"));
                product.setActive(rs.getBoolean("active"));

                products.add(product);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return products;
    }

    // Get Products By Category
    @Override
    public List<Product> getProductsByCategory(int categoryId) {

        List<Product> products =
                new ArrayList<>();

        String query =
                "SELECT * FROM products WHERE category_id=?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        connection.prepareStatement(query)
        ) {

            ps.setInt(1, categoryId);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Product product =
                        new Product();

                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setImageUrl(rs.getString("image_url"));
                product.setBrand(rs.getString("brand"));
                product.setRating(rs.getDouble("rating"));
                product.setReviewCount(rs.getInt("review_count"));
                product.setDiscountPercent(rs.getDouble("discount_percent"));
                product.setActive(rs.getBoolean("active"));

                products.add(product);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return products;
    }

    // Get Latest Products
    @Override
    public List<Product> getLatestProducts(int limit) {

        List<Product> products =
                new ArrayList<>();

        String query =
                "SELECT * FROM products ORDER BY product_id DESC LIMIT ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        connection.prepareStatement(query)
        ) {

            ps.setInt(1, limit);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Product product =
                        new Product();

                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setImageUrl(rs.getString("image_url"));
                product.setBrand(rs.getString("brand"));
                product.setRating(rs.getDouble("rating"));
                product.setReviewCount(rs.getInt("review_count"));
                product.setDiscountPercent(rs.getDouble("discount_percent"));
                product.setActive(rs.getBoolean("active"));

                products.add(product);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return products;
    }

    // Search Products
    @Override
    public List<Product> searchProducts(String keyword) {

        List<Product> products =
                new ArrayList<>();

        String query =
                "SELECT * FROM products WHERE product_name LIKE ? OR description LIKE ?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        connection.prepareStatement(query)
        ) {

            ps.setString(1,
                    "%" + keyword + "%");

            ps.setString(2,
                    "%" + keyword + "%");

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Product product =
                        new Product();

                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setImageUrl(rs.getString("image_url"));
                product.setBrand(rs.getString("brand"));

                products.add(product);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return products;
    }

    // Update Product
    @Override
    public void updateProduct(Product product) {

    	String query = """
    			UPDATE products
    			SET category_id=?,
    			product_name=?,
    			brand=?,
    			description=?,
    			price=?,
    			image_url=?,
    			rating=?,
    			review_count=?,
    			discount_percent=?,
    			active=?
    			WHERE product_id=?
    			""";
        try (Connection connection = DBConnection.getConnection();
                PreparedStatement ps = connection.prepareStatement(query)) {

        	ps.setInt(1, product.getCategoryId());
        	ps.setString(2, product.getProductName());
        	ps.setString(3, product.getBrand());
        	ps.setString(4, product.getDescription());
        	ps.setDouble(5, product.getPrice());
        	ps.setString(6, product.getImageUrl());
        	ps.setDouble(7, product.getRating());
        	ps.setInt(8, product.getReviewCount());
        	ps.setDouble(9, product.getDiscountPercent());
        	ps.setBoolean(10, product.isActive());
        	ps.setInt(11, product.getProductId());
               ps.executeUpdate();

           } catch (Exception e) {
               e.printStackTrace();
           }
       }

    // Delete Product
    @Override
    public void deleteProduct(int productId) {

        String query =
                "DELETE FROM products WHERE product_id=?";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        connection.prepareStatement(query)
        ) {

            ps.setInt(1, productId);

            ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}