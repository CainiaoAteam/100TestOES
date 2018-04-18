package com.oes.dao.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.oes.bean.Teacher;
import com.oes.dao.TeacherDao;

public class TeacherDaoImpl extends HibernateDaoSupport implements TeacherDao {

	public boolean checkTeacherNo(String tno) {
		// TODO Auto-generated method stub
		return tno.equals("abc123");
	}

	public boolean checkPassword4Teacher(String tno, String password) {
		// TODO Auto-generated method stub
		return tno.equals("abc123")&&password.equals("abc123");
	}

	public Teacher getTeacher4NoPassword(String tno, String password) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
