package com.mashirong.service;

import javax.servlet.http.HttpSession;

import com.mashirong.domain.Admin;

public interface AdminService {
	public boolean doAdminLogin(Admin admin, HttpSession hSession);
}
