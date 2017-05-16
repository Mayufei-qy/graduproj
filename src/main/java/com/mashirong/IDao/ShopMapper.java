package com.mashirong.IDao;

import java.util.List;

import com.mashirong.domain.Shop;

public interface ShopMapper {
    int deleteByPrimaryKey(Integer shopid);

    int insert(Shop record);

    int insertSelective(Shop record);

    Shop selectByPrimaryKey(Integer shopid);
    
    Shop selectByUserId(Integer userid);
    
    List<Shop> getAllApplyShop();

    int updateByPrimaryKeySelective(Shop record);

    int updateByPrimaryKey(Shop record);
}