package com.oes.web.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class BasicAction extends ActionSupport {
	/**
	 * 提示之后控制跳到相应的主页
	 * @return
	 */
	public String toUserIndex() {
		String role = (String) ServletActionContext.getRequest().getSession().getAttribute("role");
		if(role.equals("student")) {
			return "student";
		}else if(role.equals("teacher")) {
			return "teacher";
		}else if(role.equals("admin")){
			
			return "admin";
		}
		
		return NONE;
	}
}
