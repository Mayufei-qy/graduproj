package com.mashirong.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mashirong.IDao.ShopMapper;
import com.mashirong.domain.Shop;
import com.mashirong.service.ShopService;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	private ShopMapper sm;
	
	@Override
	public Shop getShopByUserId(int userid) {
		// TODO Auto-generated method stub
		return sm.selectByUserId(userid);
	}
	
}
