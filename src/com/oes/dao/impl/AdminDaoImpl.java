package com.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

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
		String sql = "select count(*) from admin where adminno = ? and adminpwd=?"; 
		 
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
	    		 admin.setAdminno(rs.getString("adminno"));
	    		 admin.setAdminname(rs.getString("adminname"));
	    		 admin.setAdminpwd(rs.getString("adminpwd"));
	    	 }
	     });
		
		return admin;
	}

	public boolean updatePassword(String adminno, String newPassword) {
		// TODO Auto-generated method stub
		String sql = "update admin set adminpwd=? where adminno=?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();

		// final Student s = new Student();
		final Object args[] = new Object[] { newPassword, adminno };
		jdbcTemplate.update(sql, args);
		return true;
	}

}
