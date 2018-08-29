package com.desmond_david.SpringPaste.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.desmond_david.SpringPaste.dao.PastesDAO;
import com.desmond_david.SpringPaste.entities.Paste;

@Service
public class PastesServiceImpl implements PastesService {
	
	@Autowired
	private PastesDAO pastesDAO;

	@Override
	@Transactional
	public List<Paste> getAllPastes() {
		return pastesDAO.getAllPastes();
	}

	@Override
	@Transactional
	public List<Paste> getPastesByUser(String userId) {
		return pastesDAO.getPastesByUser(userId);
	}

	@Override
	@Transactional
	public Paste getPasteById(int pasteId) {
		return pastesDAO.getPasteById(pasteId);
	}

	@Override
	@Transactional
	public void savePaste(Paste paste) {
		pastesDAO.savePaste(paste);
	}

	@Override
	public void deletePaste(int pasteId) {
		// TODO Auto-generated method stub

	}
}
