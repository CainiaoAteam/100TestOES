package com.oes.service.impl;

import com.oes.bean.Admin;
import com.oes.bean.Role;
import com.oes.dao.AdminDao;
import com.oes.service.RoleService;

public class AdminServiceImpl implements RoleService {
	private AdminDao adminDao;
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	public boolean checkRoleExitByNo(String aDminNo) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean checkPassword(String aDminNo, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	/**
	 * 在管理员登录的时候先判断该管理员输入的用户名是否存在
	 * 存在的话 将该管理员的信息全部封装好
	 * 
	 * 然后返回
	 */
	
	
}
