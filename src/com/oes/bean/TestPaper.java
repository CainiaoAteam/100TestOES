package com.oes.bean;

import java.util.List;

public class TestPaper {
	/**
	 * CREATE TABLE `testpaper` (
  `tpid` int(10) NOT NULL AUTO_INCREMENT,
  `tpno` varchar(10) NOT NULL,
  `tpname` varchar(50) DEFAULT NULL,
  `squestion` varchar(300) DEFAULT NULL,
  `mquestion` varchar(300) DEFAULT NULL,
  `fquestion` varchar(300) DEFAULT NULL,
  `squestionscore` int(10) DEFAULT NULL,
  `mquestionscore` int(10) DEFAULT NULL,
  `fquestionscore` int(10) DEFAULT NULL,
  `totalscore` int(10) DEFAULT NULL,
  `state` int(2) DEFAULT NULL,
	 */
	private Integer tpid;
	private String tpno;
	private String tpname;
	
	private List<SingleQuestion> squestions;
	private List<MutipleQuestion> mquestions;
	private List<FillQuestion> fquestions;
	
	private int squestionscore;
	private int mquestionscore;
	private int fquestionscore;
	private int totalscore;
	
	/**
	 * 封装用于页面显示的数据，不用配置
	 */
	private int squestionSize;
	private int mquestionSize;
	private int fquestionSize;
	
	private int sTotal;
	private int mTotal;
	private int fTotal;
	
	
	
	/**************用于显示数据的getter setter**************/
	public int getSquestionSize() {
		return squestionSize;
	}

	public void setSquestionSize(int squestionSize) {
		this.squestionSize = squestionSize;
	}

	public int getMquestionSize() {
		return mquestionSize;
	}

	public void setMquestionSize(int mquestionSize) {
		this.mquestionSize = mquestionSize;
	}

	public int getFquestionSize() {
		return fquestionSize;
	}

	public void setFquestionSize(int fquestionSize) {
		this.fquestionSize = fquestionSize;
	}

	public int getsTotal() {
		return sTotal;
	}

	public void setsTotal(int sTotal) {
		this.sTotal = sTotal;
	}

	public int getmTotal() {
		return mTotal;
	}

	public void setmTotal(int mTotal) {
		this.mTotal = mTotal;
	}

	public int getfTotal() {
		return fTotal;
	}

	public void setfTotal(int fTotal) {
		this.fTotal = fTotal;
	}
	/**************用于显示数据的getter setter**************/

	//0代表未考的试卷  1代表考过的试卷  -1审核未通过的试卷
	//2代表制定中的试卷
	private int state;

	public Integer getTpid() {
		return tpid;
	}

	public void setTpid(Integer tpid) {
		this.tpid = tpid;
	}

	public String getTpno() {
		return tpno;
	}

	public void setTpno(String tpno) {
		this.tpno = tpno;
	}

	public String getTpname() {
		return tpname;
	}

	public void setTpname(String tpname) {
		this.tpname = tpname;
	}

	public List<SingleQuestion> getSquestions() {
		return squestions;
	}

	public void setSquestions(List<SingleQuestion> squestions) {
		this.squestions = squestions;
	}

	public List<MutipleQuestion> getMquestions() {
		return mquestions;
	}

	public void setMquestions(List<MutipleQuestion> mquestions) {
		this.mquestions = mquestions;
	}

	public List<FillQuestion> getFquestions() {
		return fquestions;
	}

	public void setFquestions(List<FillQuestion> fquestions) {
		this.fquestions = fquestions;
	}

	public int getSquestionscore() {
		return squestionscore;
	}

	public void setSquestionscore(int squestionscore) {
		this.squestionscore = squestionscore;
	}

	public int getMquestionscore() {
		return mquestionscore;
	}

	public void setMquestionscore(int mquestionscore) {
		this.mquestionscore = mquestionscore;
	}

	public int getFquestionscore() {
		return fquestionscore;
	}

	public void setFquestionscore(int fquestionscore) {
		this.fquestionscore = fquestionscore;
	}

	public int getTotalscore() {
		return totalscore;
	}

	public void setTotalscore(int totalscore) {
		this.totalscore = totalscore;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	
	
}
