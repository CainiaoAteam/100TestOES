package com.oes.service.impl;

import java.util.List;

import com.oes.bean.Admin;
import com.oes.bean.Role;
import com.oes.bean.Student;
import com.oes.bean.Teacher;
import com.oes.bean.TestPaper;
import com.oes.dao.AdminDao;
import com.oes.dao.PaperDao;
import com.oes.service.RoleService;
import com.opensymphony.xwork2.util.TextParser;

public class AdminServiceImpl implements RoleService {
	private AdminDao adminDao;
	private PaperDao paperDao;
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	public void setPaperDao(PaperDao paperDao) {
		this.paperDao = paperDao;
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
	
	//添加学生
	public boolean addStudent(Student student) {
		// TODO Auto-generated method stub
		return adminDao.insertStudent(student);
	}
	
	//添加教师
	public boolean addTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		return adminDao.insertTeacher(teacher);
	}
	
	//获取所有试卷
	public List<TestPaper> getAllPaper() {
		// TODO Auto-generated method stub
		return paperDao.getAllPapers();
	}
	
	//通过审核
	public boolean passThePaper(int tpid) {
		// TODO Auto-generated method stub
		return adminDao.passPaper(tpid);
	}
	
	//通过审核
	public boolean unpassThePaper(int tpid) {
		// TODO Auto-generated method stub
		return adminDao.unpassPaper(tpid);
	}

	public TestPaper getAPaper(int tpid) {
		// TODO Auto-generated method stub getPapersByTid
		return paperDao.getPaperByPid(tpid);
	}
	

	
}
