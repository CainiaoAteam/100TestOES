package com.oes.web.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.oes.bean.Admin;
import com.oes.bean.Student;
import com.oes.bean.Teacher;
import com.oes.service.RoleService;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{

	private RoleService roleService;
	 
	private String username;
	private RoleService studentService;
	private RoleService teacherService;
	private RoleService adminService;
	
	private String userno;
	private String password;
	private String type;
	
	public void setUserno(String userno) {
		this.userno = userno;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public void setStudentService(RoleService studentService) {
		this.studentService = studentService;
	}

	public void setTeacherService(RoleService teacherService) {
		this.teacherService = teacherService;
	}

	public void setAdminService(RoleService adminService) {
		this.adminService = adminService;
	}

	/**
	 * 控制跳转
	 * 
	 * @return
	 */
	public String dump() {
		
		//获取登陆的身份参数
		String identity = ServletActionContext.getRequest().getParameter("role");
		System.out.println(identity);
		ServletActionContext.getRequest().getSession().setAttribute("role", identity);
		
		return LOGIN;
	}
	
	/**
	 * 根据不同的身份参数控制登录
	 * 
	 * @return
	 */
	public String login() {
		
		//获取session；
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		//学生登录
		if(type.equals("student")) {
			Student s = (Student) studentService.getRoleByNoPsw(userno,password);
			if(s != null) {
				//将数据保存到session中
				session.setAttribute("user", s);
				return "student";
			}
			//教师登录
		}
		if(type.equals("teacher")) {
			
			Teacher t = (Teacher) teacherService.getRoleByNoPsw(userno, password);
			if(t != null) {
				session.setAttribute("user", t);
				return "teacher";
			}
		}
		if(type.equals("admin")){
			//管理员登录
			Admin admin = (Admin) adminService.getRoleByNoPsw(userno, password);
			if(admin != null) {
				session.setAttribute("user", admin);
				return "admin";
			}
		}
		return NONE;
	}
	public String logout(){
		//获取session；
		HttpSession session = ServletActionContext.getRequest().getSession();
		//清除user数据域
		session.removeAttribute("user");
		session.removeAttribute("role");
		
		return "index";
	}
	
	/**
	 * 处理ajax请求 判断用户名是否在  注：管理员还没检测
	 * @return
	 */
	public String checkNameIsExit(){
		//接收ajax 的post请求发送过来的数据
//		System.out.println("失去焦点"+username+":"+type);
		String json = "";
		PrintWriter writer;
		try {
			writer = ServletActionContext.getResponse().getWriter();
			if(type.equals("student")) {
				boolean res = studentService.checkRoleExitByNo(userno);
				if(!res) {
					//该学生不存在
					json = "{\"msg\":\"no\"}";
				}else {
					//学生存在
					json = "{\"msg\":\"yes\"}";
//					json = JSON.toJSONString(s);
				}
			}
			if(type.equals("teacher")) {
				boolean res = teacherService.checkRoleExitByNo(userno);
				if(!res) {
					//该学生不存在
					json = "{\"msg\":\"no\"}";
				}else {
					//学生存在
					json = "{\"msg\":\"yes\"}";
//					json = JSON.toJSONString(s);
				}
			}
			if(type.equals("admin")) {
				boolean res = adminService.checkRoleExitByNo(userno);
				if(!res) {
					//该学生不存在
					json = "{\"msg\":\"no\"}";
				}else {
					//学生存在
					json = "{\"msg\":\"yes\"}";
//					json = JSON.toJSONString(s);
				}
			}
			writer.print(json);
			
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return NONE;
	}
	/**
	 * 检查密码是否正确 注：管理员还没检测
	 * 
	 * @return
	 */
	public String checkPassword() {
		String json = "";
		PrintWriter writer;
		try {
			writer = ServletActionContext.getResponse().getWriter();
			if(type.equals("student")) {
				boolean res = studentService.checkPassword(userno,password);
				if(!res) {
					//该学生不存在
					json = "{\"msg\":\"no\"}";
				}else {
					//学生存在
					json = "{\"msg\":\"yes\"}";
//					json = JSON.toJSONString(s);
				}
			}
			if(type.equals("teacher")) {
				boolean res = teacherService.checkPassword(userno, password);
				if(!res) {
					//该学生不存在
					json = "{\"msg\":\"no\"}";
				}else {
					//学生存在
					json = "{\"msg\":\"yes\"}";
//					json = JSON.toJSONString(s);
				}
			}
			writer.print(json);
			writer.flush();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return null;
		
	}

}
