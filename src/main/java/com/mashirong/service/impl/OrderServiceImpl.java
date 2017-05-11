package com.mashirong.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mashirong.IDao.OrderMapper;
import com.mashirong.domain.Order;
import com.mashirong.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired(required=true)
	private OrderMapper om;

	@Override
	public void GenerateOrder(Order order) {
		// TODO Auto-generated method stub
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String flowNum = "" + "F" + order.getShopid() + "-" + order.getUserid() + "-" + df.format(new Date());
		order.setFlownum(flowNum);
		order.setOrdertime(new Date());
		System.out.println(order);
		int orderReturnCode = om.insert(order);
		System.out.println("order_ReturnCode : " + orderReturnCode);
	}

	@Override
	public List<Order> getOrdersOfUser(int userid) {
		// TODO Auto-generated method stub
		return om.getOrderByUserId(userid);
	}

	@Override
	public List<Order> getOrdersOfSeller(int shopid) {
		// TODO Auto-generated method stub
		return om.getOrderByShopId(shopid);
	}

	@Override
	public int getCountOfNewOrder(int shopid) {
		// TODO Auto-generated method stub
		return om.countOfNewOrder(shopid);
	}

	@Override
	public int changeOrderToOld(int orderid) {
		// TODO Auto-generated method stub
		return om.changeOrderToOld(orderid);
	}

}
