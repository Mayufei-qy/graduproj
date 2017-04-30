package com.mashirong.IDao;

import com.mashirong.domain.VerifyCode;

public interface VerifyCodeMapper {
    int deleteByPrimaryKey(Integer codeid);

    int insert(VerifyCode record);

    int insertSelective(VerifyCode record);

    VerifyCode selectByPrimaryKey(Integer codeid);
    
    VerifyCode selectByEmail(String email);

    int updateByPrimaryKeySelective(VerifyCode record);

    int updateByPrimaryKey(VerifyCode record);
}