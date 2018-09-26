package com.desmond_david.SpringPaste.controller;

import java.security.Principal;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.desmond_david.SpringPaste.entities.Paste;
import com.desmond_david.SpringPaste.service.PastesService;

@Controller
public class PastesController {
	
	@Autowired
	private PastesService pastesService;
	Logger logger = Logger.getLogger(getClass().getName());
	
	@GetMapping("/")
	public String handleRoot() {
		return "redirect:/pastes";
	}
	
	@GetMapping("/pastes")
	public String showPastesPage(Model model, Principal principal) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		logger.info(">>>>> User role: " + auth.getAuthorities().toString());
		if(auth.getAuthorities().toString().equals("[ROLE_ADMIN]")) {
			logger.info(">>>>> User is admin");
			model.addAttribute("pastes", pastesService.getAllPastes());
		}
		else {
			logger.info(">>>>> User is NOT admin");
			model.addAttribute("pastes", pastesService.getPastesByUser(auth.getName()));
		}
		model.addAttribute("principal", principal);
		
		return "pastes";
	}
	
	@GetMapping("/getAllPastes")
	public String getAllPastes(Model model) {
		model.addAttribute("pastes", pastesService.getAllPastes());
		return "pastes";
	}
	
	@GetMapping("/paste")
	public String getPaste(@RequestParam(name="id") int id, Model model, Principal principal) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		logger.info(">>>>> Requesting paste for id: " + id);
		Paste p = pastesService.getPasteById(id);
		logger.info(">>>>>Got paste: " + p.toString());
		if(p.isPublicPaste() || auth.getAuthorities().toString().equals("[ROLE_ADMIN]")) {
			//p.setContent(p.getContent().replaceAll("\n", "<br />"));
			model.addAttribute("paste", p);
			return "view-paste";
		}
		else
			return "paste-not-public";
	}
	
	@PostMapping("/savePaste")
	public String savePaste(@ModelAttribute("paste") Paste p) {
		logger.info(">>>>>Got new paste: " + p.toString());
		pastesService.savePaste(p);
		return("redirect:/");
	}
	
	@GetMapping("/login")
	public String showLoginPage() {
		return "login";
	}
	
	@GetMapping("/newPaste")
	public String showNewPastePage(Model model, Principal principal) {
		model.addAttribute("paste", new Paste());
		model.addAttribute("principal", principal);
		return "new-paste";
	}
	
	@GetMapping("/editPaste")
	public String showEditPastePage(@RequestParam(name="id") int id, Model model, Principal principal) {
		Paste paste = pastesService.getPasteById(id);
		model.addAttribute("paste", paste);
		model.addAttribute("principal", principal);
		return "new-paste";
	}
	
	@GetMapping("/deletePaste")
	public String deletePaste(@RequestParam(name="id") int id, Model model) {
		logger.info(">>>>>Deleting paste id: "+id);
		pastesService.deletePaste(id);
		return "redirect:/";
	}
	
	@GetMapping("/togglePaste")
	public String togglePaste(@RequestParam(name="id") int id, Model model) {
		pastesService.togglePasteById(id);
		return "redirect:/";
	}
	
	@GetMapping("/users")
	public String showCreateUserPage() {
		return "users";
	}
	
	@GetMapping("/admin")
	public String showAdminPage(Model model) {
		model.addAttribute("pastes", pastesService.getAllPastes());
		return "admin-page";
	}
}
