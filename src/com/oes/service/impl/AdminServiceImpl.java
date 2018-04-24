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
	/**
	 * 检查管理输入的编号是否正确
	 */
	public boolean checkRoleExitByNo(String adminNo) {
		return adminDao.checkAdminNo(adminNo);
	}
	/**
	 * 检查管理员输入密码是否正确
	 */
	public boolean checkPassword(String adminNo, String password) {
		return adminDao.checkAdminPassword(adminNo,password);
	}
	/**
	 * 获取管理员对象
	 */
	public Admin getRoleByNoPsw(String adminNo, String password) {
		return adminDao.getAdmin4NoPassword(adminNo,password);
	}
	public Admin getRoleById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	public boolean modifyPassword(String adminNo, String newPassword) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
	
}
