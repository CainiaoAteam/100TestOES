package com.oes.service.impl;

import com.oes.bean.Role;
import com.oes.bean.Teacher;
import com.oes.dao.TeacherDao;
import com.oes.service.RoleService;

public class TeacherServiceImpl implements RoleService {
	private TeacherDao teacherDao;
	
	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	public boolean checkRoleExitByNo(String tno) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean checkPassword(String tno, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	

}
