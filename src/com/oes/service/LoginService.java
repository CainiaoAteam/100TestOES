package com.oes.service;

import com.oes.bean.Role;

/**
 * 登录业务
 * @author Hking
 *
 */
public interface LoginService {
	/**
	 * 登录用户名存在否检查
	 * 
	 * @param role 角色参数，根据不同的参数查找不同的数据库
	 * 
	 * @param username 角色名字
	 * @return 如果存在将整个用户数据封装成一个对象，否则返回null
	 */
	public Role checkRoleByName(String role, String username);
	/**
	 * 检查用户名是否存在
	 * 
	 * @param type
	 * @param username
	 */
	public void checkNameById(String type, String username);
}
