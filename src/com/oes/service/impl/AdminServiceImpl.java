package com.oes.service.impl;

import java.util.List;

import com.oes.bean.Admin;
import com.oes.bean.Role;
import com.oes.bean.Student;
import com.oes.bean.Teacher;
import com.oes.dao.AdminDao;
import com.oes.service.RoleService;

public class AdminServiceImpl implements RoleService {
	private AdminDao adminDao;
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	/**
	 * 检查管理输入的编号是否正确
	 */
	public boolean checkRoleExitByNo(String adminNo) {
		return adminDao.checkAdminNo(adminNo);
	}
	/**
	 * 检查管理员输入密码是否正确
	 */
	public boolean checkPassword(String adminNo, String password) {
		return adminDao.checkAdminPassword(adminNo,password);
	}
	/**
	 * 获取管理员对象
	 */
	public Admin getRoleByNoPsw(String adminNo, String password) {
		return adminDao.getAdmin4NoPassword(adminNo,password);
	}
	
	public Admin getRoleById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//更改密码
	public boolean modifyPassword(String adminno, String newPassword) {
		// TODO Auto-generated method stub
		return adminDao.updatePassword(adminno,newPassword);
		
	}
	
	//得到全部学生信息
	public List<Student> getAllStus() {
		// TODO Auto-generated method stub
		
		return adminDao.getStudents();
	}
	
	//得到全部老师信息
	public List<Teacher> getAllTeas() {
		// TODO Auto-generated method stub

		return adminDao.getTeachers();
	}
	
	//删除学生
	public boolean deleteStudent(int sid) {
		// TODO Auto-generated method stub
		return adminDao.delStu(sid);
	}
	
	//删除教师
	public boolean deleteTeacher(int tid) {
		// TODO Auto-generated method stub
		return adminDao.delTea(tid);
	}
	
	//查找学生
	public List<Student> selectStudentByKey(String stu_key) {
		// TODO Auto-generated method stub
		return adminDao.selStuByKey(stu_key);
	}
	
	//查找教师
	public List<Teacher> selectTeacherByKey(String tea_key) {
		// TODO Auto-generated method stub
		return adminDao.selTeaByKey(tea_key);
	}
	
	

	
}
