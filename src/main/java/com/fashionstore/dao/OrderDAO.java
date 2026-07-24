package com.fashionstore.dao;

import java.util.List;

import com.fashionstore.model.Order;
import com.fashionstore.model.OrderItem;

public interface OrderDAO {

    // Create Order
    int createOrder(Order order);

    // Get One Order
    Order getOrderById(int orderId);

    // Get User Orders
    List<Order> getOrdersByUserId(int userId);

    // ⭐ Admin - Get All Orders
    List<Order> getAllOrders();

    // Update Status
    void updateOrderStatus(int orderId, String status);
     
    List<OrderItem> getOrderItems(int orderId);
}