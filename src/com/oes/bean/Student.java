package com.oes.bean;

public class Student extends Role {
	/**
	 *`sid` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `sno` varchar(12) NOT NULL,
  `sname` varchar(10) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `idcardnum` varchar(18) DEFAULT NULL,
  `password` varchar(12) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
	 */
	
	private Integer sid;
	private String sno;
	private String sname;
	private String gender;
	private String idcardnum;
	private String department;
	private String grade;
	private String phone;
	
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
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
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
