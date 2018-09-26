package com.desmond_david.SpringPaste.controller;

import java.security.Principal;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.desmond_david.SpringPaste.entities.Authority;
import com.desmond_david.SpringPaste.entities.User;
import com.desmond_david.SpringPaste.service.UsersService;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService usersService;
	
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	@GetMapping("/createUser")
	public String showCreateUserPage(Model model) {
		User user = new User();
		Authority authority = new Authority();
		user.setAuthority(authority);
		model.addAttribute("user", user);
		return "new-user";
	}
	
	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") User user) {
		user.getAuthority().setUsername(user.getUsername());
		logger.info(">>>>>Got user: " + user + " with authority:" +user.getAuthority());
		usersService.saveUser(user);//TODO: Change to boolean, if user creation fails because of existing username, then throw error and redirect back.
		return "redirect:/manageUsers";
	}
	
	@GetMapping("/editUser")
	public String editUser(@RequestParam("username") String username, Model model) {
		User user = usersService.getUserByName(username);
		logger.info(">>>>> Got user: "+user.toString());
		model.addAttribute("user", user);
		return "new-user";
	}
	
	@GetMapping("/deleteUser")
	public String deleteUser(@RequestParam("username") String username) {
		usersService.deleteUserById(username);//TODO: Must make sure that all pastes belonging to this user must also be deleted?
		return "redirect:/manageUsers";
	}
	
	@GetMapping("/manageUsers") 
	public String showManageUsersPage(Model model, Principal principal) {
		model.addAttribute("users", usersService.getUsers());
		model.addAttribute("principal", principal);
		return "admin-manage-users";
	}
}
