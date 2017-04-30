package com.mashirong.service;

import java.util.List;

import com.mashirong.domain.Dish;

public interface DishService {
	List<Dish> searchForResult(String searchcontent);
	int addNewDish(Dish dish);
}
