package com.mashirong.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mashirong.domain.Shop;
import com.mashirong.domain.User;
import com.mashirong.service.ShopService;


@Controller
public class ApplyToAdmin {
	
	@Autowired
	private ShopService ss;
	
	@RequestMapping("/submitShopInfo")
	public String submitShopInfo(){
		return "/shopinfosubmit.jsp";
	}
	@RequestMapping("/insertNewShop")
	@ResponseBody
	public Map insertNewShop(Shop shop, HttpSession hSession){
		User user = (User) hSession.getAttribute("user");
		shop.setUserid(user.getUserid());
		Map<String, Object> map = new HashMap<>();
		String result = "false";
		if(ss.insertNewShop(shop) == 1){
			result = "true";
		}
		map.put("result", result);
		return map;
	}
}
