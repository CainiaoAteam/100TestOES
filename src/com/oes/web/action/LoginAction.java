package com.oes.web.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.oes.bean.Role;
import com.oes.service.RoleService;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	private RoleService roleService;
	 
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
	
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
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
		//获取spring容器
		WebApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(ServletActionContext.getServletContext());
		System.out.println("登录身份："+type);
		System.out.println(username);
		Role role = (Role) ac.getBean(type);
		
		
		return NONE;
	}
	
	

}
