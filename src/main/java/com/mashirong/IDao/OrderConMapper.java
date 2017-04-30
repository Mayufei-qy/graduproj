package com.mashirong.IDao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mashirong.domain.OrderCon;

public interface OrderConMapper {
    int deleteByPrimaryKey(Integer orderconid);

    int insert(OrderCon record);

    int insertSelective(OrderCon record);
    
    List<OrderCon> getOrderConByOrderId(@Param("orderid") Integer orderid);

    OrderCon selectByPrimaryKey(Integer orderconid);

    int updateByPrimaryKeySelective(OrderCon record);

    int updateByPrimaryKey(OrderCon record);
}