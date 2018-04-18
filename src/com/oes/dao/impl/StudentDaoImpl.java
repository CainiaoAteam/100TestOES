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
	 * 判断用户密码是否正确
	 * 
	 */
	public boolean checkPasswordBySnoPsw(String sno, String password) {
		// TODO Auto-generated method stub
		if(sno.equals("123456") && password.equals("123456")) {
			return true;
		}
		return false;
	}
	/**
	 * 获取学生信息
	 */
	public Student getStudent(String sno, String password) {
		Student s = new Student();
		s.setSno(sno);
		s.setPassword(password);
		s.setSname("帅仔");
		
		return s;
	}
	

}