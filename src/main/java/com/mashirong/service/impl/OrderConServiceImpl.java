package com.mashirong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mashirong.IDao.OrderConMapper;
import com.mashirong.domain.OrderCon;
import com.mashirong.service.OrderConService;

@Service
public class OrderConServiceImpl implements OrderConService {

	@Autowired(required=true)
	private OrderConMapper ocm;
	
	@Override
	public void GenerateOrderCon(OrderCon orderCon) {
		// TODO Auto-generated method stub
		int orderConReturnCode = ocm.insert(orderCon);
		System.out.println("order_Con_ReturnCode : " + orderConReturnCode);
	}

	@Override
	public List<OrderCon> getOrderConsOfOrder(int orderid) {
		// TODO Auto-generated method stub
		return ocm.getOrderConByOrderId(orderid);
	}

}
