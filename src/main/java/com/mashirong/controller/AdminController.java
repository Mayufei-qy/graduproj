package com.mashirong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mashirong.IDao.ShopMapper;
import com.mashirong.domain.Admin;
import com.mashirong.domain.Shop;
import com.mashirong.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService as;
	
	@Autowired
	private ShopMapper sm;

	@RequestMapping("/OnlineOrderADMlogin")
	public String toAdminPage(){
		return "/adminloginpage.jsp";
	}
	@RequestMapping("/adminLogin")
	@ResponseBody
	public Map adminLogin(Admin admin, HttpSession hSession){
		Map<String, Object> map = new HashMap<>();
		String result = "false";
		if(as.doAdminLogin(admin, hSession)){
			result = "true";
		}
		map.put("result", result);
		return map;
	}
	@RequestMapping("/toAdminMainPage")
	public String toAdminMainPage(HttpSession hSession, Model model){
		Admin admin = (Admin) hSession.getAttribute("admin");
		if(admin != null){
			List<Shop> newshoplist = sm.getAllApplyShop();
			model.addAttribute("newshoplist", newshoplist);
			return "/adminmainpage.jsp";
		}else{
			return "redirect:/";
		}
	}
}
