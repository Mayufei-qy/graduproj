package com.mashirong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.mashirong.domain.Dish;
import com.mashirong.service.DishService;

@Controller
public class SearchController {
	
	@Autowired
	private DishService ds;
	
	@RequestMapping("/tomainshowpage")
	public String toMainShowPage(String searchcontent,Model model){
		/*List<Dish> list = ds.searchForResult(searchcontent);
		model.addAttribute("searchresult", list);*/
		model.addAttribute("keyword", searchcontent);
		return "/mainshow.jsp";
	}
	
	@RequestMapping("/searchResult")
	@ResponseBody
	public List<Dish> searchResult(String keyWordStr,int pageSize, int page){
		PageHelper.startPage(page, pageSize);
		List<Dish> list = ds.searchForResult(keyWordStr);
		return list;
	}
	
	
}
