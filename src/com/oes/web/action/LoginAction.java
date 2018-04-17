package com.oes.web.action;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;
import com.oes.service.RoleService;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	private RoleService studentService;
	private RoleService teacherService;
	private RoleService adminService;
	
	private String sno;
	private String password;
	private String type;
	
	
	public void setSno(String sno) {
		this.sno = sno;
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
		
		
		

		return NONE;
	}
	/**
	 * 处理ajax请求 判断用户名是否在
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
				boolean res = studentService.checkRoleExitByNo(sno);
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
	 * 检查密码是否正确
	 * 
	 * @return
	 */
	public String checkPassword() {
		String json = "";
		PrintWriter writer;
		try {
			writer = ServletActionContext.getResponse().getWriter();
			if(type.equals("student")) {
				boolean res = studentService.checkPassword(sno,password);
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
		return null;
		
	}

}
