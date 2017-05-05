package com.mashirong.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@RequestMapping("/toUserAccount")
	public String toUserAccount(){
		
		return "/useraccount.jsp";
	}
	
	@RequestMapping("/toSellerDishPage")
	public String toSellerDishPage(HttpSession hSession){
		if(hSession.getAttribute("user") == null){
			return "redirect:/";
		}else{
			return "/sellerdishpage.jsp";
		}
	}
}
