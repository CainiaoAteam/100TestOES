package com.oes.dao.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.oes.bean.Role;
import com.oes.dao.LoginDao;

public class LoginDaoImpl extends HibernateDaoSupport implements LoginDao {
	
	/**
	 * 根据role的类型查询不同的数据库，最后根据username返回相应的Role对象
	 * 
	 */
	public Role getRoleByName(String role, String username) {
		// TODO Auto-generated method stub
//		role是学生
		if(role.equals("student")) {
			
			
		}else if(role.equals("teacher")){
			
		}else if(role.equals("admin")) {
			
		}
		
		return null;
	}

}
