package com.terry.springsecurity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="admin")
public class Admin {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="passwordEncoder", method={RequestMethod.GET, RequestMethod.POST})
	public String passwordEncoder(@RequestParam(value="targetStr", required=false, defaultValue="") String targetStr, Model model){
		if(StringUtils.hasText(targetStr)){
			// 암호화 작업
			String bCryptString = passwordEncoder.encode(targetStr);
			model.addAttribute("targetStr", targetStr);
			model.addAttribute("bCryptString", bCryptString);
		}
		return "/common/showBCryptString";
	}
	
	@RequestMapping(value="ajaxTest", method={RequestMethod.POST})
	@ResponseBody
	public String ajaxTest(@RequestParam(value="title") String title, @RequestParam(value="content") String content){
		return "{\"result\" : \"ok\"}";
	}
}
