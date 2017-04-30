package com.mashirong.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mashirong.domain.User;
import com.mashirong.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired(required=true)
	private UserService us;
	
	@RequestMapping("/dologin")
	@ResponseBody
	public Map dologin(User user, HttpSession httpSession){
		System.out.println(user.getEmail() + " : " + user.getPassword());
		String dologinType = us.doUserLogin(user,httpSession);
		Map<String, String> map = new HashMap<>();
		if( dologinType != null){
			if("seller".equals(dologinType)){
				map.put("url", "login/toSellerPage");
			}
			map.put("loginmsg", "true");
			return map;
		}else{
			map.put("loginmsg", "false");
			return map;
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession httpSession){
		httpSession.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/toSellerPage")
	public String rediectToSellerPage(HttpSession hSession){
		User user = (User) hSession.getAttribute("user");
		if(user != null && user.getIsseller()){
			return "/sellermainpage.jsp";
		}else{
			return "/index.jsp";
		}
	}
}
