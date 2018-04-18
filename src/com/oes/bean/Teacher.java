package com.oes.bean;

public class Teacher extends Role {
	/**
	 * `tid` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `tno` varchar(12) NOT NULL,
  `tname` varchar(10) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `idcardnum` varchar(18) DEFAULT NULL,
  `password` varchar(12) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
	 */
	private Integer tid;
	private String tname;
	private String gender;
	private String idcardnum;
	private String password;
	private String phone;
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIdcardnum() {
		return idcardnum;
	}
	public void setIdcardnum(String idcardnum) {
		this.idcardnum = idcardnum;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
