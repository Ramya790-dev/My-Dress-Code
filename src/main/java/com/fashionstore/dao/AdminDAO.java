package com.fashionstore.dao;

import com.fashionstore.model.Admin;

public interface AdminDAO {

    Admin login(String email, String password);

    int getTotalProducts();

    int getTotalUsers();

    int getTotalOrders();

    double getTotalRevenue();
}