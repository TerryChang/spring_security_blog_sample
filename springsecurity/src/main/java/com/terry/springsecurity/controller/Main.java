package com.terry.springsecurity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("main")
public class Main {

	@RequestMapping(value="main")
	public String main() throws Exception{
		return "main";
	}
	
	
}
