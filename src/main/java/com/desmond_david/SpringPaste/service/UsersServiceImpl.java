package com.desmond_david.SpringPaste.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.desmond_david.SpringPaste.dao.UsersDAO;
import com.desmond_david.SpringPaste.entities.User;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersDAO dao;

	@Override
	@Transactional
	public List<User> getUsers() {
		return dao.getUsers();
	}

	@Override
	public User getUserByName(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveUser(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteUserById(String username) {
		// TODO Auto-generated method stub

	}

	@Override
	public void revokeAdmin(User user) {
		// TODO Auto-generated method stub

	}

}
