package com.mashirong.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mashirong.IDao.ShopMapper;
import com.mashirong.IDao.UserMapper;
import com.mashirong.domain.Shop;
import com.mashirong.domain.User;
import com.mashirong.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired(required=true)
	private UserMapper um;
	
	@Autowired(required=true)
	private ShopMapper sm;

	@Override
	public String doUserLogin(User user,HttpSession httpSession) {
		// TODO Auto-generated method stub
		User userexist = um.selectByEmail(user.getEmail());
		if(userexist != null){
			if(userexist.getPassword().equals(user.getPassword())){
				httpSession.setAttribute("user", userexist);
				if((userexist.getIsseller())){
					Shop shop = sm.selectByUserId(userexist.getUserid());
					httpSession.setAttribute("shop", shop);
					return "seller";
				}else{
					return "common";
				}
			}else{
				return null;
			}
		}
		return null;
	}

	@Override
	public void doUserRegister(User user) {
		// TODO Auto-generated method stub
		um.insert(user);
	}

	@Override
	public User getUserInfo(int userid) {
		// TODO Auto-generated method stub
		return um.selectByPrimaryKey(userid);
	}

	@Override
	public int changeUserNameByUserId(String username, int userid) {
		// TODO Auto-generated method stub
		return um.changeUserNameByUserId(username, userid);
	}

}
