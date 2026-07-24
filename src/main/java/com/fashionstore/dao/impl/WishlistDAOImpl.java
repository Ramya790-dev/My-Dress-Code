package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.WishlistDAO;
import com.fashionstore.model.Product;
import com.fashionstore.util.DBConnection;

public class WishlistDAOImpl implements WishlistDAO {

    @Override
    public void addToWishlist(
            int userId,
            int productId) {

        String sql =
                "INSERT INTO wishlist(user_id, product_id) VALUES(?, ?)";

        try (
                Connection con =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);

            ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    @Override
    public List<Product> getWishlistByUserId(
            int userId) {

        List<Product> products =
                new ArrayList<>();

        String sql =
                "SELECT p.* " +
                "FROM wishlist w " +
                "INNER JOIN products p " +
                "ON w.product_id = p.product_id " +
                "WHERE w.user_id = ?";

        try (
                Connection con =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setInt(1, userId);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Product p =
                        new Product();

                p.setProductId(
                        rs.getInt("product_id"));

                p.setProductName(
                        rs.getString("product_name"));

                p.setPrice(
                        rs.getDouble("price"));

                p.setImageUrl(
                        rs.getString("image_url"));

                products.add(p);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return products;
    }

    @Override
    public void removeFromWishlist(
            int userId,
            int productId) {

        String sql =
                "DELETE FROM wishlist " +
                "WHERE user_id = ? " +
                "AND product_id = ?";

        try (
                Connection con =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setInt(1, userId);
            ps.setInt(2, productId);

            ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}