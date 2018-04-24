package com.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.oes.bean.Admin;
import com.oes.bean.Student;
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
		String sql = "select * from admin where adminno = ? and adminpwd = ? "; 
		 
		 JdbcTemplate jdbcTemplate = getJdbcTemplate();
			 
		 final Admin admin = new Admin();
	     final Object args[] = new Object[]{adminNo,password};  
	     
	     jdbcTemplate.query(sql,args,new RowCallbackHandler() {
	    	 public void processRow(ResultSet rs) throws SQLException {
	    		 
	    		 admin.setAdminid(rs.getInt("adminid"));
	    		 admin.setAdminname(rs.getString("sname"));
	    		 admin.setAdminpwd(rs.getString("password"));
	    	 }
	     });
		
		return admin;
	}

}
