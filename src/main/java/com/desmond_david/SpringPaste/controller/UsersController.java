package com.desmond_david.SpringPaste.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.desmond_david.SpringPaste.entities.Authority;
import com.desmond_david.SpringPaste.entities.User;
import com.desmond_david.SpringPaste.service.UsersService;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService usersService;
	
	@GetMapping("/createUser")
	public String showCreateUserPage(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("authority", new Authority());
		return "new-user";
	}
	
	@GetMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") User user, @ModelAttribute("authority") Authority authority) {
		user.setAuthority(authority);
		usersService.saveUser(user);
		return "redirect:/manageUsers";
	}
	
	@GetMapping("/manageUsers") 
	public String showManageUsersPage(Model model) {
		model.addAttribute("users", usersService.getUsers());
		return "admin-manage-users";
	}
}
