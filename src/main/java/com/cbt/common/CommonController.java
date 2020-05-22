package com.cbt.common;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	@RequestMapping("commonLogin.do")
	public String commonLogin() {
		return "common/commonLogin";
	}
	
	@RequestMapping("commonSignUp.do")
	public String companySignUp() {
		return "common/commonSignUp";
	}
	
	@RequestMapping("commonDetailRequestList.do")
	public String commonDetailRequestList() {
		return "common/commonDetailRequestList";
	}
	
	@RequestMapping("main.do")
	public String main(Authentication authentication) {
		CustomerUser candivo = (CustomerUser)authentication.getPrincipal();
		if(candivo.getRoleName().equals("ROLE_MANAGER"))
			return "redirect:managerMain.do";
		else if(candivo.getRoleName().equals("ROLE_COMPANY"))
			return "redirect:companyMain.do";
		else
			return "redirect:candidateMain.do";
	}

}
