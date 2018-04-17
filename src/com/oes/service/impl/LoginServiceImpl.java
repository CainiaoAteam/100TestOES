package com.oes.service.impl;

import com.oes.bean.Role;
import com.oes.dao.LoginDao;
import com.oes.service.LoginService;

public class LoginServiceImpl implements LoginService {
	private LoginDao loginDao;
	
	
	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}


	public Role checkRoleByName(String role, String username) {
		// TODO Auto-generated method stub
		return null;
	}


	public void checkNameById(String type, String username) {
		// TODO Auto-generated method stub
		
	}

}
