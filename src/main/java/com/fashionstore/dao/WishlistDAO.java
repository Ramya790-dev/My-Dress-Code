package com.fashionstore.dao;

import java.util.List;
import com.fashionstore.model.Product;

public interface WishlistDAO {

    
    void addToWishlist(
            int userId,
            int productId);

    
    List<Product> getWishlistByUserId(
            int userId);

    
    void removeFromWishlist(
            int userId,
            int productId);
}