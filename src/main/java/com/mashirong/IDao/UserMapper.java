package com.mashirong.IDao;

import org.apache.ibatis.annotations.Param;

import com.mashirong.domain.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);
    
    User selectByPhoneNum(String phonenum);
    
    User selectByEmail(String email);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    int changeUserNameByUserId(@Param("username") String username, @Param("userid") Integer userid);
}