package com.desmond_david.SpringPaste.dao;

import java.util.List;

import com.desmond_david.SpringPaste.entities.User;

public interface UsersDAO {
	// Read
	public List<User> getUsers();
	public User getUserByName(String username);
	
	// Create/Update
	public void saveUser(User user);
	
	// Delete
	public void deleteUser(User user);
	public void deleteUserById(String username);
	
	// Revoke
	public void revokeAdmin(User user);
}
