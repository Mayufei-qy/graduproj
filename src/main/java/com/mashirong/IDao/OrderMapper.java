package com.mashirong.IDao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mashirong.domain.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer orderid);

    int insert(Order record);

    int insertSelective(Order record);
    
    List<Order> getOrderByUserId(@Param("userid") Integer userid);

    Order selectByPrimaryKey(Integer orderid);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}