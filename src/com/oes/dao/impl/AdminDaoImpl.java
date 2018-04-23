package com.oes.dao.impl;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.oes.bean.Admin;
import com.oes.dao.AdminDao;

public class AdminDaoImpl extends JdbcDaoSupport implements AdminDao {

	public boolean checkAdminNo(String adminNo) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from admin where adminno = ?"; 
		 
		 JdbcTemplate jdbcTemplate = getJdbcTemplate();
			 
	     Object args[] = new Object[]{adminNo};  
	     
	     int count = jdbcTemplate.queryForObject(sql, args,Integer.class);
		if(count>0) {
			return true;
		}
		return false;
	}

	public boolean checkAdminPassword(String adminNo, String password) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from admin where adminNo = ? and password=?"; 
		 
		 JdbcTemplate jdbcTemplate = getJdbcTemplate();
			 
	     Object args[] = new Object[]{adminNo,password};  
	     
	     int count = jdbcTemplate.queryForObject(sql, args,Integer.class);
		if(count>0) {
			return true;
		}
		return false;
	}

	public Admin getAdmin4NoPassword(String adminNo, String password) {
		// TODO Auto-generated method stub
		return null;
	}

}
