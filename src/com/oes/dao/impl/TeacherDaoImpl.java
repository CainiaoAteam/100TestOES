package com.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.Student;
import com.oes.bean.Teacher;
import com.oes.dao.TeacherDao;

public class TeacherDaoImpl extends JdbcDaoSupport implements TeacherDao {

	public boolean checkTeacherNo(String tno) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from teacher where tno = ?"; 
		 
		 JdbcTemplate jdbcTemplate = getJdbcTemplate();
			 
	     Object args[] = new Object[]{tno};  
	     
	     int count = jdbcTemplate.queryForObject(sql, args,Integer.class);
		if(count>0) {
			return true;
		}
		return false;
	}
	
	public boolean checkPassword4Teacher(String tno, String password) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from teacher where tno = ? and password=?"; 
		 
		 JdbcTemplate jdbcTemplate = getJdbcTemplate();
			 
	     Object args[] = new Object[]{tno,password};  
	     
	     int count = jdbcTemplate.queryForObject(sql, args,Integer.class);
		if(count>0) {
			return true;
		}
		return false;
		
	}

	public Teacher getTeacher4NoPassword(String tno, String password) {
		
		String sql = "select * from teacher where tno = ? and password=?"; 
		 
		 JdbcTemplate jdbcTemplate = getJdbcTemplate();
			 
		 final Teacher t = new Teacher();
	     final Object args[] = new Object[]{tno,password};  
	      
	     jdbcTemplate.query(sql,args,new RowCallbackHandler() {
	    	 public void processRow(ResultSet rs) throws SQLException {
	    		 
	    		 t.setTno(rs.getString("tno"));
	    		 t.setPassword(rs.getString("password"));
	    		 t.setTname(rs.getString("tname"));
	    		 t.setGender(rs.getString("gender"));
	    		 t.setIdcardnum(rs.getString("idcardnum"));
	    		 t.setPhone(rs.getString("phone"));	 
	    	 }
	     });
	     
		return t;
	}
	
}
