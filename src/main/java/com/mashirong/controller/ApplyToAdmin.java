package com.mashirong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ApplyToAdmin {
	
	@RequestMapping("/submitShopInfo")
	public String submitShopInfo(){
		return "/blank.jsp";
	}
}
