package com.oes.dao.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.oes.bean.Student;
import com.oes.dao.StudentDao;

public class StudentDaoImpl extends HibernateDaoSupport implements StudentDao {
	
	/**
	 * 这里只要使用学号获取用户即可，因为学号是唯一的
	 * 
	 */
	public boolean isExitBySno(String sno) {
		if(sno.equals("123456")) {
			
			return true;
		}
		return false;
	}
	/**
	 * 获取用户
	 * 
	 */
	public Student getStudentBySnoPsw(String sno, String password) {
		// TODO Auto-generated method stub
		if(sno.equals("123456") && password.equals("123456")) {
			Student s = new Student();
			s.setSno(sno);
			s.setSname("帅仔");
			s.setPassword(password);
			
			return s;
		}
		return null;
	}
	

}
