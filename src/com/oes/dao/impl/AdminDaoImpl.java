package com.oes.dao.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.oes.bean.Admin;
import com.oes.dao.AdminDao;

public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao {

	public boolean checkAdminNo(String adminNo) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean checkAdminPassword(String adminNo, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	public Admin getAdmin4NoPassword(String adminNo, String password) {
		// TODO Auto-generated method stub
		return null;
	}

}
