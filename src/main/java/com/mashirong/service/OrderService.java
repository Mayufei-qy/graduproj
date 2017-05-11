package com.mashirong.service;

import java.util.List;

import com.mashirong.domain.Order;

public interface OrderService {
	public void GenerateOrder(Order order);
	public List<Order> getOrdersOfUser(int userid);
	public List<Order> getOrdersOfSeller(int shopid);
	public int getCountOfNewOrder(int shopid);
	public int changeOrderToOld(int orderid);
}
