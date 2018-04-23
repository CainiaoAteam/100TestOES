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
	 * 检查密码是否输入正确
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	boolean checkPasswordBySnoPsw(String sno, String password);
	/**
	 * 获取学生对象
	 * @param sno
	 * @param password
	 * @return
	 */
	Student getStudent(String sno, String password);
	/**
	 * 更新密码到数据库
	 * @param sno
	 * @param newPassword
	 * @return 成功返回true 
	 */
	boolean updatePassword(String sno, String newPassword);
	/**
	 * 根据id获取学生
	 * 
	 * @param sid
	 * @return
	 */
	Student getStudentById(Integer sid);
	
	

}
