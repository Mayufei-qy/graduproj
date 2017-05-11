package com.mashirong.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mashirong.domain.User;
import com.mashirong.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService us;
	
	@RequestMapping("/toUserAccount")
	public String toUserAccount(Model model, HttpSession hSession){
		User user = (User) hSession.getAttribute("user");
		User userinfo = us.getUserInfo(user.getUserid());
		model.addAttribute("userinfo", userinfo);
		return "/useraccount.jsp";
	}
	
	@RequestMapping("/changeUserName")
	@ResponseBody
	public Map changeUserName(String username, HttpSession hSession){
		User user = (User) hSession.getAttribute("user");
		int result = us.changeUserNameByUserId(username, user.getUserid());
		String flag = "false";
		if(result == 1){
			flag = "true";
		}
		Map<String, Object> map = new HashMap<>();
		map.put("flag", flag);
		return map;
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
