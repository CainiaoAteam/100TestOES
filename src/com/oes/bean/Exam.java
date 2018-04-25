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
	private Teacher teacher;
	private String examno;
	private String examname;
	private Date examday;
	private int examtime; 
	private int examstate; //考试状态，1代表已考，0代表未考
	
	public int getExamstate() {
		return examstate;
	}
	public void setExamstate(int examstate) {
		this.examstate = examstate;
	}

	private TestPaper testpaper;
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;}
	private int state;	//考试状态，新增ggz
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getExamname() {
		return examname;            
	}
	public void setExamname(String examname) {
		this.examname = examname;
	}
	public TestPaper getTestpaper() {
		return testpaper;
	}
	public void setTestpaper(TestPaper testpaper) {
		this.testpaper = testpaper;
	}
	
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
	
	public Date getExamday() {
		return examday;
	}
	public void setExamday(Date examday) {
		this.examday = examday;
	}
	public double getExamtime() {
		return examtime;
	}
	public void setExamtime(int examtime) {
		this.examtime = examtime;
	}
	@Override
	public String toString() {
		return "Exam [teacher=" + teacher + ", examno=" + examno + ", examname=" + examname + ", examday=" + examday
				+ ", examtime=" + examtime + ", examstate=" + examstate + ", startTime=" + startTime + "]";
	}
	
}
