package com.oes.dao;

import com.oes.bean.Role;

public interface LoginDao {
	
	/**
	 * 根据role角色类型参数和role的名字获取role对象
	 * 
	 * @param role
	 * @param username
	 * @return 封装了role数据的对象，否则返回null
	 */
	public Role getRoleByName(String role, String username);
	
}
