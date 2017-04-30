package com.mashirong.service;

import com.mashirong.domain.VerifyCode;

public interface VerifyCodeService {
	public void insert(VerifyCode vc);
	public boolean check(VerifyCode vc);
}
