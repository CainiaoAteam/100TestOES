package com.oes.dao;

import com.oes.bean.Teacher;

public interface TeacherDao {

	/**
	 * 检查教师的编号是否存在
	 * @param tno
	 * @return
	 */
	boolean checkTeacherNo(String tno);
	/**
	 * 检查老师的密码输入是否正确
	 * @param tno
	 * @param password
	 * @return
	 */
	boolean checkPassword4Teacher(String tno, String password);
	/**
	 * 通过教师编号和密码获取教师对象
	 * @param tno
	 * @param password
	 * @return
	 */
	Teacher getTeacher4NoPassword(String tno, String password);
	/**
	 * 修改教师密码
	 * @param tno
	 * @param newPassword
	 * @return
	 */
	boolean updatePassword(String tno, String newPassword);

}
