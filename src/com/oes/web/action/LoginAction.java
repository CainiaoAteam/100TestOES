package com.oes.web.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.oes.bean.Role;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	
	private String username;
	private String password;
	private String type;
	
	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * 获取登录身份的参数
	 * 
	 * @return
	 */
	public String dump() {
		
		//获取登录身份参数
		String identity = ServletActionContext.getRequest().getParameter("role");
		//将身份参数保存到session中
//		System.out.println(identity);
		ServletActionContext.getRequest().getSession().setAttribute("role", identity);
		
		
		return LOGIN;
	}
	
	/**
	 * 根据不同的身份进行控制跳转
	 * @return
	 */
	public String login() {
		
//		//获取登录身份的参数
//		String identity = ServletActionContext.getRequest().getParameter("type");
//		
		//从spring容器中获取相应的对象
		WebApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(ServletActionContext.getServletContext());
		System.out.println("登录身份："+type);
		System.out.println(username);
		Role role = (Role) ac.getBean(type);
		role.login(username, password);
		
		return NONE;
	}
	
	

}
