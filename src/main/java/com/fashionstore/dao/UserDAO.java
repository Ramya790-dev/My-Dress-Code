package com.fashionstore.dao;

import java.util.List;

import com.fashionstore.model.User;

public interface UserDAO {

    // Register / Create
    boolean registerUser(User user);

    // Read
    User getUserById(int userId);
    User getUserByEmail(String email);

    // Login validation
    boolean validateUser(String email, String password);

    // Update
    void updateUser(User user);

    // Delete (optional but good to have)
    void deleteUser(int userId);

	User loginUser(String email, String password);

	List<User> getAllUsers();

	boolean emailExists(String email);

	boolean registerUser1(User user);

	boolean updateUser1(User user);

	boolean updatePassword(int userId, String password);
}
