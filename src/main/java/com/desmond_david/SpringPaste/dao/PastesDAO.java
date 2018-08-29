package com.desmond_david.SpringPaste.dao;

import java.util.List;

import com.desmond_david.SpringPaste.entities.Paste;

public interface PastesDAO {
	public List<Paste> getAllPastes();
	
	public List<Paste> getPastesByUser(String userId);
	
	public Paste getPasteById(int pasteId);
	
	public void savePaste(Paste paste);
	
	public void deletePaste(int pasteId);
}
