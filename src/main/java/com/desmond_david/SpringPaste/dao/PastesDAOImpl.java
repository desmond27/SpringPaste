package com.desmond_david.SpringPaste.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.desmond_david.SpringPaste.entities.Paste;

@Repository
public class PastesDAOImpl implements PastesDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Paste> getAllPastes() {
		Session session = sessionFactory.getCurrentSession();
		Query<Paste> pasteQuery = session.createQuery("from Paste", Paste.class);
		return pasteQuery.getResultList();
	}

	@Override
	public List<Paste> getPastesByUser(String userId) {
		Session session = sessionFactory.getCurrentSession();
		Query<Paste> pasteQuery = session.createQuery("from Paste where username=?1", Paste.class);
		pasteQuery.setParameter(1, userId);
		return pasteQuery.getResultList();
	}

	@Override
	public Paste getPasteById(int pasteId) {
		Paste p = new Paste();
		Session session = sessionFactory.getCurrentSession();
		p = session.get(Paste.class, pasteId);
		return p;
	}

	@Override
	public void savePaste(Paste paste) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(paste);
	}

	@Override
	public void deletePaste(int pasteId) {
		Session session = sessionFactory.getCurrentSession();
		Paste p = session.get(Paste.class, pasteId);
		session.delete(p);
	}
}
