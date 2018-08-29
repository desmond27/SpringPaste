package com.desmond_david.SpringPaste.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.desmond_david.SpringPaste.entities.User;

@Repository
public class UsersDAOImpl implements UsersDAO {
	
	@Autowired
	private SessionFactory factory;

	@Override
	public List<User> getUsers() {
		Session session = factory.getCurrentSession();
		Query<User> query = session.createQuery("from User", User.class);
		return query.getResultList();
	}

	@Override
	public User getUserByName(String username) {
		Session session = factory.getCurrentSession();
		return session.get(User.class, username);
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
