package com.desmond_david.SpringPaste.dao;

import java.util.List;
import java.util.logging.Logger;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.desmond_david.SpringPaste.entities.User;

@Repository
public class UsersDAOImpl implements UsersDAO {
	
	@Autowired
	private SessionFactory factory;
	Logger logger = Logger.getLogger(this.getClass().getName());
	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

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
		// Encode the text password
		String ePassword = passwordEncoder.encode(user.getPassword());
		ePassword = "{bcrypt}"+ePassword;
		user.setPassword(ePassword);
		logger.info(">>>>>New User to save: " + user.toString() + " / " + user.getAuthority().toString());
		Session session = factory.getCurrentSession();
		session.save(user);
	}

	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteUserById(String username) {
		Session session = factory.getCurrentSession();
		//Delete all pastes by this user first
		Query query = session.createQuery("delete from Paste where username=?1");
		query.setParameter(1, username);
		query.executeUpdate();
		//Now delete the user
		User user = session.get(User.class, username);
		session.delete(user);
	}

	@Override
	public void revokeAdmin(User user) {
		// TODO Auto-generated method stub

	}

}
