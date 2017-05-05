package com.mashirong.service;

import java.util.List;

import com.mashirong.domain.Dish;

public interface DishService {
	List<Dish> searchForResult(String searchcontent);
	List<Dish> getAllDishes(int shopid);
	int addNewDish(Dish dish);
	int deleteDishById(int dishid);
}
