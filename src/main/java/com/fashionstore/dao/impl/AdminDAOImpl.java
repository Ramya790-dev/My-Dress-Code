package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.fashionstore.dao.AdminDAO;
import com.fashionstore.model.Admin;
import com.fashionstore.util.DBConnection;

public class AdminDAOImpl implements AdminDAO {

    // ===========================
    // Admin Login
    // ===========================

    @Override
    public Admin login(String email, String password) {

        Admin admin = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM admins WHERE email=? AND password=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                admin = new Admin();

                admin.setAdminId(rs.getInt("admin_id"));
                admin.setName(rs.getString("name"));
                admin.setEmail(rs.getString("email"));
                admin.setPassword(rs.getString("password"));
                admin.setRole(rs.getString("role"));
                admin.setCreatedAt(rs.getTimestamp("created_at"));
            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return admin;
    }

    // ===========================
    // Dashboard Statistics
    // ===========================

    @Override
    public int getTotalProducts() {

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM products");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                return rs.getInt(1);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return 0;
    }

    @Override
    public int getTotalUsers() {

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM users");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                return rs.getInt(1);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return 0;
    }

    @Override
    public int getTotalOrders() {

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM orders");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                return rs.getInt(1);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return 0;
    }

    @Override
    public double getTotalRevenue() {

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                            "SELECT IFNULL(SUM(total_amount),0) FROM orders");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                return rs.getDouble(1);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return 0;
    }
}