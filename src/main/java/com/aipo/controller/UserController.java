package com.aipo.controller;

import com.aipo.entity.User;
import com.aipo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/user-management")
    public String userManagement(Model model) {

        model.addAttribute("users", userService.getAllUsers());

        return "user-management";
    }

    @GetMapping("/users/add")
    public String showAddUserForm(Model model) {
        model.addAttribute("user", new User());
        return "redirect:/user-management";
    }

    @PostMapping("/users/add")
    public String addUser(@ModelAttribute User user) {
        System.out.println("Add user: " + user.getLoginName());
        System.out.println("Email: " + user.getEmail());
        System.out.println("Password: " + (user.getPassword() != null ? "***" : "null"));
        userService.createUser(user);

        return "redirect:/user-management";
    }

    @GetMapping("/users/delete")
    public String deleteUser(@RequestParam("id") int id) {

        userService.deleteUser(id);

        return "redirect:/user-management";
    }

    @GetMapping("/users/enable")
    public String enableUser(@RequestParam("id") int id) {

        userService.enableUser(id);

        return "redirect:/user-management";
    }

    @GetMapping("/users/disable")
    public String disableUser(@RequestParam("id") int id) {

        userService.disableUser(id);

        return "redirect:/user-management";
    }

}