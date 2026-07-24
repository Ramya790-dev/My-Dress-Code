package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.fashionstore.dao.UserDAO;
import com.fashionstore.model.User;
import com.fashionstore.util.DBConnection;

public class UserDAOImpl implements UserDAO {

    // LOGIN USER

    @Override
    public User loginUser(String email,
                          String password) {

        User user = null;

        try {

            Connection conn =
                DBConnection.getConnection();

            String sql =
                "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setString(1, email);

            ps.setString(2, password);

            ResultSet rs =
                ps.executeQuery();

            if(rs.next()) {

                user = new User();

                user.setUserId(
                    rs.getInt("user_id"));

                user.setFullName(
                    rs.getString("full_name"));

                user.setEmail(
                    rs.getString("email"));

                user.setPhone(
                    rs.getString("phone"));

                user.setPassword(
                    rs.getString("password"));

                user.setAddressLine1(
                    rs.getString("address_line1"));

                user.setAddressLine2(
                    rs.getString("address_line2"));

                user.setCity(
                    rs.getString("city"));

                user.setState(
                    rs.getString("state"));

                user.setPincode(
                    rs.getString("pincode"));

                user.setCountry(
                    rs.getString("country"));

                user.setCreatedAt(
                    rs.getTimestamp("created_at"));
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return user;
    }

    // REGISTER USER

    @Override
    public boolean registerUser(User user) {

        try {

            Connection conn =
                DBConnection.getConnection();

            String sql =
                "INSERT INTO users(full_name,email,phone,password,address_line1,address_line2,city,state,pincode,country) VALUES(?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setString(1,
                user.getFullName());

            ps.setString(2,
                user.getEmail());

            ps.setString(3,
                user.getPhone());

            ps.setString(4,
                user.getPassword());

            ps.setString(5,
                user.getAddressLine1());

            ps.setString(6,
                user.getAddressLine2());

            ps.setString(7,
                user.getCity());

            ps.setString(8,
                user.getState());

            ps.setString(9,
                user.getPincode());

            ps.setString(10,
                user.getCountry());

            ps.executeUpdate();

        } catch(Exception e) {

            e.printStackTrace();
        }
		return false;
    }

    // =========================
    // UNUSED METHODS
    // =========================

    @Override
    public User getUserById(int userId) {

        User user = null;

        try {

            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM users WHERE user_id = ?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setPassword(rs.getString("password"));
                user.setAddressLine1(rs.getString("address_line1"));
                user.setAddressLine2(rs.getString("address_line2"));
                user.setCity(rs.getString("city"));
                user.setState(rs.getString("state"));
                user.setPincode(rs.getString("pincode"));
                user.setCountry(rs.getString("country"));
                user.setCreatedAt(rs.getTimestamp("created_at"));

            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return user;
    }
    @Override
    public User getUserByEmail(String email) {

        return null;
    }

    @Override
    public boolean validateUser(
            String email,
            String password) {

        return false;
    }

    @Override
    public void updateUser(User user) {

    }

    @Override
    public void deleteUser(int userId) {

    }

    @Override
    public java.util.List<User> getAllUsers() {

        java.util.List<User> users = new java.util.ArrayList<>();

        try {

            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM users ORDER BY user_id DESC";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddressLine1(rs.getString("address_line1"));
                user.setAddressLine2(rs.getString("address_line2"));
                user.setCity(rs.getString("city"));
                user.setState(rs.getString("state"));
                user.setPincode(rs.getString("pincode"));
                user.setCountry(rs.getString("country"));
                user.setCreatedAt(rs.getTimestamp("created_at"));

                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    @Override
    public boolean emailExists(String email) {

        return false;
    }

    @Override
    public boolean registerUser1(User user) {

        return false;
    }

    @Override
    public boolean updateUser1(User user) {

        return false;
    }

    @Override
    public boolean updatePassword(
            int userId,
            String password) {

        return false;
    }
}