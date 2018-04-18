package com.oes.bean;

public class Admin extends Role {
	/**
	 *  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(20) DEFAULT NULL,
  `adminpwd` varchar(20) DEFAULT NULL,
	 */
	private Integer adminid;
	private String adminname;
	private String adminpwd;
	
	public Integer getAdminid() {
		return adminid;
	}
	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getAdminpwd() {
		return adminpwd;
	}
	public void setAdminpwd(String adminpwd) {
		this.adminpwd = adminpwd;
	}
	
	
	
}
