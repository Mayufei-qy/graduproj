package com.mashirong.service;

import javax.servlet.http.HttpSession;

import com.mashirong.domain.User;

public interface UserService {
	String doUserLogin(User user,HttpSession httpSession);
	void doUserRegister(User user);
	User getUserInfo(int userid);
	int changeUserNameByUserId(String username, int userid);
}
