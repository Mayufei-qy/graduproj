package com.mashirong.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mashirong.IDao.UserMapper;
import com.mashirong.domain.User;
import com.mashirong.domain.VerifyCode;
import com.mashirong.service.UserService;
import com.mashirong.service.VerifyCodeService;
import com.mashirong.util.EmailUtil;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	private VerifyCodeService vcs;
	
	@Autowired
	private UserService us;
	
	@Autowired
	private UserMapper um;

	@RequestMapping("/to_register")
	public String toRegister(HttpSession httpSession){
		/*String str = (String) httpSession.getAttribute("origin_uri");
		if(str != null){
			return "redirect:" + str;
		}*/
		return "/register.jsp";
	}
	
	@RequestMapping("/getVerificationCode")
	@ResponseBody
	public Map getVerificationCode(String email){
		
		int code = generateRdmCode();
		VerifyCode vc = new VerifyCode();
		vc.setEmail(email);
		vc.setCode(code);
		Map map = new HashMap<>();
		map.put("code", code);
		String mailContent = "您注册用验证码为：" + code;
		EmailUtil.send(email, mailContent);
		vcs.insert(vc);
//		map.put("success", );
//		String resultCode= "{\"code\":\"123456\"}";
		System.out.println(email + " : " + code);
		return map;
	}
	
	@RequestMapping("/doRegister")
	public String doRegister(User user, VerifyCode vc, Model model){
		
		System.out.println(vc.getEmail() + " : " + vc.getCode());
		
		if(vcs.check(vc)){
			User userexist = um.selectByEmail(user.getEmail());
			if(userexist != null){
				model.addAttribute("errormsg", "该邮箱已存在！");
				return "/register.jsp";
			}else{
				us.doUserRegister(user);
				model.addAttribute("registersuccessmsg", "注册成功！");
				return "/register.jsp";
			}
			
		}else {
			model.addAttribute("errormsg", "验证码已过期，请点击按钮获取新的验证码！");
			return "/register.jsp";
		}
	}
	
	public int generateRdmCode(){
		return 1 + (int)(Math.random() * 999999);
	}
}
