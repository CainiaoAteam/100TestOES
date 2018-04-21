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
	
	/**
	 * 检查老师编号
	 */
	public boolean checkRoleExitByNo(String tno) {
		// TODO Auto-generated method stub
		return teacherDao.checkTeacherNo(tno);
	}
	/**
	 * 检查老师输入的密码
	 */
	public boolean checkPassword(String tno, String password) {
		// TODO Auto-generated method stub
		return teacherDao.checkPassword4Teacher(tno,password);
	}
	/**
	 * 通过老师编号和密码 获取教师信息
	 */
	public Teacher getRoleByNoPsw(String tno, String password) {
		// TODO Auto-generated method stub
		return teacherDao.getTeacher4NoPassword(tno,password);
	}

	

}
