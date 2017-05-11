package com.mashirong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mashirong.IDao.ShopMapper;
import com.mashirong.domain.Comment;
import com.mashirong.domain.CommentVo;
import com.mashirong.domain.Shop;
import com.mashirong.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService cs;
	
	@Autowired
	private ShopMapper sm;

	@RequestMapping("/getComment")
	public String getCommentsOfShop(int shopid,Model model){
		Shop shop = sm.selectByPrimaryKey(shopid);
		model.addAttribute("shopinfo", shop);
		List<CommentVo> listCv = cs.getAllCommentOfShop(shopid);
		model.addAttribute("commentList", listCv);
		return "/commentpage.jsp";
	}
	
	@RequestMapping("/getCountOfComment")
	@ResponseBody
	public Map getCountOfComment(int shopid){
		Map<String,Object> map = new HashMap<>();
		int result = cs.getCountOfComment(shopid);
		map.put("resultTag", result);
		return map;
	}
	
	@RequestMapping("/submitComment")
	@ResponseBody
	public Map<String, Object> submitComment(Comment comment){
		System.out.println(comment);
		int resultFlag = cs.insertComment(comment);
		System.out.println(resultFlag);
		Map<String, Object> map = new HashMap<>();
		map.put("resultFlag", resultFlag);
		return map;
	}
}
