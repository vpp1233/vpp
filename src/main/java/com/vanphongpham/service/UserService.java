package com.vanphongpham.service;

import java.sql.SQLException;
import java.util.List;

import com.vanphongpham.model.User;
import com.vanphongpham.repository.UserRepository;

public class UserService {
    private UserRepository userRepository = new UserRepository();

    public void addUser(User user) {
        try {
            userRepository.insertUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserById(int userId) {
        return userRepository.getById(userId);
    }
    
    public User getUserbyUsernameAndPassword(String userName, String password) {
    	return userRepository.getUserbyUsernameAndPassword(userName, password);
	}
    
    public List<User> getAllUsers() {
        return userRepository.selectAllUsers();
    }

    public boolean deleteUser(int userId) {
        try {
            return userRepository.deleteUser(userId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateUser(User user) {
        try {
            return userRepository.updateUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
