package com.oes.web.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.oes.bean.Student;
import com.oes.service.impl.StudentServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 学生动作处理
 * 
 * @author Hking
 *
 */
public class StudentAction extends ActionSupport {
	private String sno;
	private String newPassword;
	
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	private StudentServiceImpl studentService;
	
	public void setStudentService(StudentServiceImpl studentService) {
		this.studentService = studentService;
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	public String modifyPsw() {
		//1对比旧密码输入是否正确
		//2对比两个新密码是否正确
		//3恢复修改按钮、提示修改成功。。跳转到重新登录页面
//		System.out.println(newPassword);
		HttpSession session = ServletActionContext.getRequest().getSession();
		Student student = (Student) session.getAttribute("user");
		
		//调用修改密码,业务层事务处理
		boolean res = studentService.modifyPassword(student.getSno(),newPassword);
		
		//修改成功
		if(res) {
			//清除session
			session.removeAttribute("role");
			//重定向到login.jsp
			return "index";
		}
		
		return null;
	}
}