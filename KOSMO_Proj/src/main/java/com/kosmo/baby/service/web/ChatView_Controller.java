package com.kosmo.baby.service.web;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatView_Controller {
	
	//채팅
	@RequestMapping("/chatView.kosmo")
	public String chatView(Authentication auth,Model model) {
		
		 UserDetails user = (UserDetails)auth.getPrincipal();
		 String id = user.getUsername();
		
		 model.addAttribute("id", id);
		 
		return "chatView.tiles";
	}
	
	

}
