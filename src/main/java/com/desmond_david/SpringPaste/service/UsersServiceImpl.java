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
	@Transactional
	public User getUserByName(String username) {		
		return dao.getUserByName(username);
	}

	@Override
	@Transactional
	public void saveUser(User user) {
		dao.saveUser(user);
	}

	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	@Transactional
	public void deleteUserById(String username) {
		dao.deleteUserById(username);
	}

	@Override
	public void revokeAdmin(User user) {
		// TODO Auto-generated method stub

	}

}
