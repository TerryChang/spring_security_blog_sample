package com.terry.springsecurity.common.security;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.FactoryBean;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.util.matcher.RequestMatcher;

import com.terry.springsecurity.common.security.service.SecuredObjectService;

public class UrlResourcesMapFactoryBean implements
		FactoryBean<LinkedHashMap<RequestMatcher, List<ConfigAttribute>>> {

	private SecuredObjectService securedObjectService;
	
	private LinkedHashMap<RequestMatcher, List<ConfigAttribute>> requestMap;
	
	public void setSecuredObjectService(SecuredObjectService securedObjectService) {
		this.securedObjectService = securedObjectService;
	}

	public void init() throws Exception {
		requestMap = securedObjectService.getRolesAndUrl();
	}
	
	@Override
	public LinkedHashMap<RequestMatcher, List<ConfigAttribute>> getObject() throws Exception {
		// TODO Auto-generated method stub
		if(requestMap == null){
			requestMap = securedObjectService.getRolesAndUrl();
		}
		return requestMap;
	}

	@Override
	public Class<?> getObjectType() {
		// TODO Auto-generated method stub
		return LinkedHashMap.class;
	}

	@Override
	public boolean isSingleton() {
		// TODO Auto-generated method stub
		return true;
	}
}
