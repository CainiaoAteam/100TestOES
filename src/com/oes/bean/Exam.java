package com.oes.bean;

import java.util.Date;

public class Exam {
	/**
	 *  `examid` int(10) NOT NULL,
  `examno` varchar(10) DEFAULT NULL,
  `examname` varchar(10) DEFAULT NULL,
  `tpid` int(10) DEFAULT NULL,
  `examday` date DEFAULT NULL,
  `examtime` int(10) DEFAULT NULL,
   PRIMARY KEY (`examid`)
	 */
	
	private Integer examid;
	private String examno;
	private String examname;
	
	public String getExamname() {
		return examname;
	}
	public void setExamname(String examname) {
		this.examname = examname;
	}
	private TestPaper testpaper;
	
	public TestPaper getTestpaper() {
		return testpaper;
	}
	public void setTestpaper(TestPaper testpaper) {
		this.testpaper = testpaper;
	}
	private Date examday;
	private double examtime;
	
	private String startTime;//装换的开始考试时间，这里不存进数据库，所以不要配置到xml文件中
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public Integer getExamid() {
		return examid;
	}
	public void setExamid(Integer examid) {
		this.examid = examid;
	}
	public String getExamno() {
		return examno;
	}
	public void setExamno(String examno) {
		this.examno = examno;
	}
	
	/*
	public Integer getTpid() {
		return tpid;
	}
	public void setTpid(Integer tpid) {
		this.tpid = tpid;
	}*/
	
	public Date getExamday() {
		return examday;
	}
	public void setExamday(Date examday) {
		this.examday = examday;
	}
	public double getExamtime() {
		return examtime;
	}
	public void setExamtime(double examtime) {
		this.examtime = examtime;
	}
	
}
