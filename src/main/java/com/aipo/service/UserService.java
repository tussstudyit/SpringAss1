package com.aipo.service;

import com.aipo.entity.User;
import com.aipo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public void createUser(User user) {
        userRepository.save(user);
    }

    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }

    public void enableUser(int id) {
        userRepository.enableUser(id);
    }

    public void disableUser(int id) {
        userRepository.disableUser(id);
    }
}