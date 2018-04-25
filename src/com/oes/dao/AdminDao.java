package com.oes.dao;

import java.util.List;

import com.oes.bean.Admin;
import com.oes.bean.Student;
import com.oes.bean.Teacher;

public interface AdminDao {
	/**
	 * 检查管理员输入的编号
	 * 
	 * 
	 * @param adminNo
	 * @return
	 */
	boolean checkAdminNo(String adminNo);
	/**
	 * 检查管理员输入的密码
	 * @param adminNo
	 * @param password
	 * @return
	 */
	boolean checkAdminPassword(String adminNo, String password);
	/**
	 * 通过管理员编号和密码获取管理对象
	 * 
	 * @param adminNo
	 * @param password
	 * @return
	 */
	Admin getAdmin4NoPassword(String adminNo, String password);
	
	
	//更改密码
	boolean updatePassword(String adminno, String newPassword);
	
	//获取学生
	List<Student> getStudents();
	
	//获取学生
	List<Teacher> getTeachers();
	
	//删除学生
	boolean delStu(int sid);
	
	//删除教师
	boolean delTea(int tid);
	
	//查找学生
	List<Student> selStuByKey(String stu_key);
	
	//查找教师
	List<Teacher> selTeaByKey(String tea_key);
	
	//添加学生
	boolean insertStudent(Student student);
	
	//添加教师
	boolean insertTeacher(Teacher teacher);
	
	//通过审核
	boolean passPaper(int tpid);
	
	//不通过审核
	boolean unpassPaper(int tpid);

}
