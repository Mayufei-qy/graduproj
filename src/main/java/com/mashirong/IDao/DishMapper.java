package com.mashirong.IDao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mashirong.domain.Dish;

public interface DishMapper {
    int deleteByPrimaryKey(Integer dishid);

    int insert(Dish record);

    int insertSelective(Dish record);

    Dish selectByPrimaryKey(Integer dishid);
    
    List<Dish> selectWithSearch(@Param("dishname") String dishname);
    
    List<Dish> selectAllDishInTheShop(@Param("shopid") Integer shopid);
    
    int updateByPrimaryKeySelective(Dish record);

    int updateByPrimaryKey(Dish record);
}