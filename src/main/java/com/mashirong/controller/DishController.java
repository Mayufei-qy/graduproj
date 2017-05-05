package com.mashirong.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mashirong.domain.Dish;
import com.mashirong.domain.Shop;
import com.mashirong.domain.User;
import com.mashirong.service.DishService;
import com.mashirong.service.ShopService;

@Controller
@RequestMapping("/dishmanager")
public class DishController {
	
	@Autowired(required=true)
	private DishService ds;
	
	@Autowired(required=true)
	private ShopService ss;
	
	@RequestMapping("/dishadd")
	@ResponseBody
	public Map dishAdd(Dish dish,@RequestParam MultipartFile imageIptfile, HttpServletRequest request, HttpSession hSession){
//		System.out.println(dish);
		String resultmsg = null;
		Shop shop = (Shop) hSession.getAttribute("shop");
		String fileName = imageIptfile.getOriginalFilename();
//		System.out.println(fileName);
		String newFileName = UUID.randomUUID()+fileName;
		String path = request.getSession().getServletContext().getRealPath("/static/dishimg/");
		String finallyPath = "/static/dishimg/" + newFileName;
		File f = new File(path);
		String type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
		if(!f.exists())
			f.mkdirs();
		if (type!=null){
			if ("GIF".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase())){
				if(!imageIptfile.isEmpty()){
					try {
						FileUtils.copyInputStreamToFile(imageIptfile.getInputStream(), new File(path, newFileName));
						dish.setShopid(shop.getShopid());
						dish.setDishimage(finallyPath);
						int i = ds.addNewDish(dish);
						if(i==1){
							resultmsg = "true";
						}
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						resultmsg="fileUploadError";
					}
				}else{
					resultmsg="fileIsEmpty";
				}
			}
		}else{
			resultmsg="fileIsNotImage";
		}
		Map<String,Object> map = new HashMap<>();
		map.put("resultmsg", resultmsg);
		return map;	
	}
	
	@RequestMapping("/getAllDish")
	@ResponseBody
	public Map<String, List> getAllDish(HttpSession hSession){
		Map<String, List> data = new HashMap<>();
		User user = (User) hSession.getAttribute("user");
		Shop shop = ss.getShopByUserId(user.getUserid());
		data.put("data", ds.getAllDishes(shop.getShopid()));
		return data;
	}
	@RequestMapping("/deleteDish")
	@ResponseBody
	public Map<String, Object> deleteDishById(@RequestParam(value = "dishid") Integer dishid){
		int resultFlag = ds.deleteDishById(dishid);
		Map<String, Object> data = new HashMap<>();
		data.put("resultFlag", resultFlag);
		return data;
	}
}
