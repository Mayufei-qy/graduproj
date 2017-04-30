package com.mashirong.service;

import java.util.List;

import com.mashirong.domain.OrderCon;

public interface OrderConService {
	public void GenerateOrderCon(OrderCon orderCon);
	public List<OrderCon> getOrderConsOfOrder(int orderid);
}
