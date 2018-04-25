package com.oes.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.oes.bean.Admin;
import com.oes.bean.Student;
import com.oes.bean.Teacher;
import com.oes.service.impl.AdminServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String adminno;
	
	private String newPassword;
	
	private int sid;
	
	private int tid;
	
	private String stu_key;
	
	private String tea_key;
	
	
	private AdminServiceImpl adminService;
	
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	
	public void setSid(int sid) {
		this.sid = sid;
	}


	public void setTid(int tid) {
		this.tid = tid;
	}


	public void setStu_key(String stu_key) {
		this.stu_key = stu_key;
	}


	public void setTea_key(String tea_key) {
		this.tea_key = tea_key;
	}


	public void setAdminService(AdminServiceImpl adminService) {
		this.adminService = adminService;
	}



	/**
	 * 修改密码
	 * @return
	 */
	public String modifyPsw() {
		//1对比旧密码输入是否正确
		//2对比两个新密码是否正确
		//3恢复修改按钮、提示修改成功。。跳转到重新登录页面
		HttpSession session = ServletActionContext.getRequest().getSession();
		Admin admin = (Admin) session.getAttribute("user");
		this.adminno = admin.getAdminno();
		//调用修改密码,业务层事务处理
		boolean res = adminService.modifyPassword(adminno,newPassword);
		
		//修改成功
		if(res) {
			//重新获取学生用户，直接将最新的角色信息放入session
			admin = adminService.getRoleByNoPsw(adminno, newPassword);
			session.setAttribute("user", admin);
			session.setAttribute("modify", "修改成功！");
			//重定向回到学生主页面
			return "index";
		}
		
		return null;
	}
	
	//获取所有学生列表
	public String getAllStudents() {
		//设置编码格式
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		List<Student> stu_list=adminService.getAllStus();
		
		String list = JSON.toJSONString(stu_list);
		
		try {
			PrintWriter writer = response.getWriter();
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
		
	}
	//查找学生列表
	public String findStuByKey() {
		//设置编码格式
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		List<Student> stu_list=adminService.selectStudentByKey(stu_key);
		
		String list = JSON.toJSONString(stu_list);
		try {
			PrintWriter writer = response.getWriter();
			System.out.println("数据已发送！");
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
	//获取所有教师列表
	public String getAllTeachers() {
		//设置编码格式
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		List<Teacher> tea_list=adminService.getAllTeas();
		
		String list = JSON.toJSONString(tea_list);
		
		try {
			PrintWriter writer = response.getWriter();
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
		
	}

	public String findTeaByKey() {
		
		//设置编码格式
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		List<Teacher> tea_list=adminService.selectTeacherByKey(tea_key);
		
		String list = JSON.toJSONString(tea_list);
		try {
			PrintWriter writer = response.getWriter();
			System.out.println("数据已发送！");
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//删除学生
	public String delStu() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		boolean res = adminService.deleteStudent(sid);
		if(res) {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("<script>alert('删除成功！');</script>");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("<script>alert('删除失败！');</script>");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "admin";
	}
	//删除学生
	public String delTea() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		boolean res = adminService.deleteTeacher(tid);
		if(res) {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("<script>alert('删除成功！');</script>");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("<script>alert('删除失败！');</script>");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "admin";
		
	}
}
