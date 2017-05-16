package com.mashirong.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mashirong.IDao.AdminMapper;
import com.mashirong.domain.Admin;
import com.mashirong.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper am;

	@Override
	public boolean doAdminLogin(Admin admin, HttpSession hSession) {
		// TODO Auto-generated method stub
		Admin existadmin = am.selectByAdminName(admin.getAdminname());
		if(existadmin != null && existadmin.getAdminpswd().equals(admin.getAdminpswd())){
			hSession.setAttribute("admin", admin);
			return true;
		}
		return false;
	}
}
