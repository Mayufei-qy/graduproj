package com.mashirong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mashirong.domain.Dish;
import com.mashirong.service.DishService;

@Controller
@RequestMapping("/dishmanager")
public class DishController {
	
	@Autowired(required=true)
	private DishService ds;
	
	@RequestMapping("/dishadd")
	public String dishAdd(Dish dish,Model model){
		int result = ds.addNewDish(dish);
		if(result==1)
			return "/sellermaininfo.jsp";
		else{
			model.addAttribute("errmsg", "增加菜品失败");
			return "error.jsp";
		}
			
	}
}
