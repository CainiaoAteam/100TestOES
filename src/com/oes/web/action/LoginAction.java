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
	 * ��ȡ��¼��ݵĲ���
	 * 
	 * @return
	 */
	public String dump() {
		
		//��ȡ��¼��ݲ���
		String identity = ServletActionContext.getRequest().getParameter("role");
		//����ݲ������浽session��
//		System.out.println(identity);
		ServletActionContext.getRequest().getSession().setAttribute("role", identity);
		
		
		return LOGIN;
	}
	
	/**
	 * ���ݲ�ͬ����ݽ��п�����ת
	 * @return
	 */
	public String login() {
		
//		//��ȡ��¼��ݵĲ���
//		String identity = ServletActionContext.getRequest().getParameter("type");
//		
		//��spring�����л�ȡ��Ӧ�Ķ���
		WebApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(ServletActionContext.getServletContext());
		System.out.println("��¼��ݣ�"+type);
		System.out.println(username);
		Role role = (Role) ac.getBean(type);
		role.login(username, password);
		
		return NONE;
	}
	
	

}
