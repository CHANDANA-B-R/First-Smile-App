package com.firstsmile.dao;

import java.util.List;

import com.firstsmile.dto.User;

public interface UserDAO {
   void addUser(User user);
   User getUserById(Integer uid);
   List<User> getAllUsers();
   void updateUser(User user);
   User getUserByMail(String email);
   void deleteUser(Integer uid);
   User getUserByMailAndPassword(String email,String password);
}
