package com.oes.service;

import com.oes.bean.Role;

public interface RoleService {

	/**
	 * 根据用户名检查用户是否存在
	 * 
	 * @param no 学号或者教师号
	 * @return 如果存在返回true 否则false
	 */
	boolean checkRoleExitByNo(String no);
	/**
	 * 检查用户密码是否正确
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	boolean checkPassword(String username, String password);
	
}
