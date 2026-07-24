package com.fashionstore.dao;

import java.util.List;
import com.fashionstore.model.Category;

public interface CategoryDAO {

    void addCategory(Category category);

    Category getCategoryById(int categoryId);

    List<Category> getAllCategories();

    void updateCategory(Category category);

    void deleteCategory(int categoryId);

    List<Category> getActiveCategories();
}