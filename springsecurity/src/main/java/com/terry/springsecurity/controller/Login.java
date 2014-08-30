package com.terry.springsecurity.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("login")
public class Login {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MessageSource messageSource;
	
	@RequestMapping(value="login")
	public String login() throws Exception{
		Locale locale = LocaleContextHolder.getLocale();
		String testmsg1 = messageSource.getMessage("AbstractLdapAuthenticationProvider.badCredentials", null, "시큐리티 디폴트 메시지", Locale.KOREA);
		String testmsg2 = messageSource.getMessage("TestKey.testParam", null, "디폴트 메시지", Locale.KOREA);
		
		logger.debug("testmsg1 : {}", testmsg1);
		logger.debug("testmsg2 : {}", testmsg2);
		return "/login/login";
	}
	
	@RequestMapping(value="notlogin")
	public String notlogin() throws Exception{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String testmsg1 = messageSource.getMessage("AbstractLdapAuthenticationProvider.badCredentials", null, "시큐리티 디폴트 메시지", Locale.KOREA);
		String testmsg2 = messageSource.getMessage("TestKey.testParam", null, "디폴트 메시지", Locale.KOREA);
		
		logger.debug("testmsg1 : {}", testmsg1);
		logger.debug("testmsg2 : {}", testmsg2);
		return "/login/notlogin";
	}
}
