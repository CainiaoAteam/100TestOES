package com.oes.service.impl;

import com.oes.bean.Student;
import com.oes.dao.StudentDao;
import com.oes.service.RoleService;

public class StudentServiceImpl implements RoleService {
	private StudentDao studentDao;
	
	
	
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}



	/**
	 * 检查输入的学生学号是否存在
	 */
	public boolean checkRoleExitByNo(String sno) {
		
		return studentDao.isExitBySno(sno);
	}


	/**
	 * 检查输入密码是否正确
	 */
	public boolean checkPassword(String sno, String password) {
			
		return studentDao.checkPasswordBySnoPsw(sno,password);
		
	}


	/**
	 * 获取学生角色的信息
	 */
	public Student getRoleByNoPsw(String sno, String password) {
		
		return studentDao.getStudent(sno,password);
	}


	/**
	 * 修改密码 添加业务AOP
	 * @param sno
	 * @param newPassword
	 */
	public boolean modifyPassword(String sno, String newPassword) {
		return studentDao.updatePassword(sno,newPassword);
		
	}


	
	
}
