package com.mashirong.IDao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mashirong.domain.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer orderid);

    int insert(Order record);

    int insertSelective(Order record);
    
    int countOfNewOrder(@Param("shopid") Integer shopid);
    
    List<Order> getOrderByUserId(@Param("userid") Integer userid);
    
    List<Order> getOrderByShopId(@Param("shopid") Integer shopid);

    Order selectByPrimaryKey(Integer orderid);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    int changeOrderToOld(@Param("orderid") Integer orderid);
}