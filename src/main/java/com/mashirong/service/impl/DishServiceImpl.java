package com.mashirong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mashirong.IDao.DishMapper;
import com.mashirong.domain.Dish;
import com.mashirong.service.DishService;

@Service
public class DishServiceImpl implements DishService{
	
	@Autowired
	private DishMapper dm;

	@Override
	public List<Dish> searchForResult(String searchcontent) {
		// TODO Auto-generated method stub
		return dm.selectWithSearch(searchcontent);
	}

	@Override
	public int addNewDish(Dish dish) {
		// TODO Auto-generated method stub
		return dm.insert(dish);
	}

	@Override
	public List<Dish> getAllDishes(int shopid) {
		// TODO Auto-generated method stub
		return dm.selectAllDishInTheShop(shopid);
	}

	@Override
	public int deleteDishById(int dishid) {
		// TODO Auto-generated method stub
		return dm.deleteByPrimaryKey(dishid);
	}

}
