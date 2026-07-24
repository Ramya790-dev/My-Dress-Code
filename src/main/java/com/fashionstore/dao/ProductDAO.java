package com.fashionstore.dao;

import java.util.List;
import com.fashionstore.model.Product;

public interface ProductDAO {

    // Add new product
    void addProduct(Product product);

    // Get product by ID
    Product getProductById(int productId);

    // Get all products
    List<Product> getAllProducts();

    // Get products by category
    List<Product> getProductsByCategory(int categoryId);

    // Get latest products
    List<Product> getLatestProducts(int limit);

    // Search products
    List<Product> searchProducts(String keyword);

    // Update product
    void updateProduct(Product product);

    // Delete product
    void deleteProduct(int productId);
    
    
}