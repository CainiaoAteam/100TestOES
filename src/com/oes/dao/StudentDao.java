package com.oes.dao;

import com.oes.bean.Student;

public interface StudentDao {
	
	/**
	 * 根据学生的学号获取学生
	 * 
	 * @param sno
	 * @return
	 */
	boolean isExitBySno(String sno);
	/**
	 * 获取学生信息
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	boolean checkPasswordBySnoPsw(String sno, String password);
	Student getStudent(String sno, String password);

}
