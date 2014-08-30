package com.terry.springsecurity.common.security.service.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

import com.terry.springsecurity.common.security.dao.SecuredObjectDao;
import com.terry.springsecurity.common.security.service.SecuredObjectService;

public class SecuredObjectServiceImpl implements SecuredObjectService {

private SecuredObjectDao securedObjectDao;
	
	public SecuredObjectDao getSecuredObjectDao() {
		return securedObjectDao;
	}

	public void setSecureObjectDao(SecuredObjectDao secureObjectDao) {
		this.securedObjectDao = secureObjectDao;
	}

	@Override
	public LinkedHashMap<RequestMatcher, List<ConfigAttribute>> getRolesAndUrl() throws Exception {
		// TODO Auto-generated method stub
		LinkedHashMap<RequestMatcher, List<ConfigAttribute>> ret = new LinkedHashMap<RequestMatcher, List<ConfigAttribute>>();
		LinkedHashMap<Object, List<ConfigAttribute>> data = securedObjectDao.getRolesAndUrl();
		Set<Object> keys = data.keySet();
		for(Object key : keys){
			ret.put((AntPathRequestMatcher)key, data.get(key));
		}
		return ret;
	}

	@Override
	public LinkedHashMap<String, List<ConfigAttribute>> getRolesAndMethod()
			throws Exception {
		// TODO Auto-generated method stub
		LinkedHashMap<String, List<ConfigAttribute>> ret = new LinkedHashMap<String, List<ConfigAttribute>>();
		LinkedHashMap<Object, List<ConfigAttribute>> data = securedObjectDao.getRolesAndMethod();
		Set<Object> keys = data.keySet();
		for(Object key : keys){
			ret.put((String)key, data.get(key));
		}
		return ret;
	}

	@Override
	public LinkedHashMap<String, List<ConfigAttribute>> getRolesAndPointcut()
			throws Exception {
		// TODO Auto-generated method stub
		LinkedHashMap<String, List<ConfigAttribute>> ret = new LinkedHashMap<String, List<ConfigAttribute>>();
		LinkedHashMap<Object, List<ConfigAttribute>> data = securedObjectDao.getRolesAndPointcut();
		Set<Object> keys = data.keySet();
		for(Object key : keys){
			ret.put((String)key, data.get(key));
		}
		return ret;
	}

	@Override
	public List<ConfigAttribute> getMatchedRequestMapping(String url) throws Exception {
		// TODO Auto-generated method stub
		return securedObjectDao.getRegexMatchedRequestMapping(url);
	}

	@Override
	public String getHierarchicalRoles() throws Exception {
		// TODO Auto-generated method stub
		return securedObjectDao.getHierarchicalRoles();
	}

}
