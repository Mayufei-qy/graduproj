package com.mashirong.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mashirong.IDao.VerifyCodeMapper;
import com.mashirong.domain.VerifyCode;
import com.mashirong.service.VerifyCodeService;

@Service
public class VerifyCodeServiceImpl implements VerifyCodeService {

	@Autowired
	private VerifyCodeMapper vcm;
	
	@Override
	public void insert(VerifyCode vc) {
		// TODO Auto-generated method stub
		vcm.insert(vc);
	}

	@Override
	public boolean check(VerifyCode vc) {
		// TODO Auto-generated method stub
		VerifyCode existvc = vcm.selectByEmail(vc.getEmail());
		if(existvc != null){
			if(existvc.getCode().equals(vc.getCode())){
				return true;
			}else{
				return false;
			}
		}else {
			return false;
		}
	}

}
