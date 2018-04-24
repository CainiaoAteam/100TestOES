package com.oes.bean;

import java.util.Arrays;
import java.util.List;

public class TestPaper {
	
	private Integer tpid;
	private String tpno;
	private String tpname;
	
	private Teacher teacher;	//新增 郭冠志 用于记录老师出的试卷
	
	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	private List<SingleQuestion> squestions;
	private List<MutipleQuestion> mquestions;
	private List<FillQuestion> fquestions;
	
	private int tpstate;
	
	public int getTpstate() {
		return tpstate;
	}

	public void setTpstate(int tpstate) {
		this.tpstate = tpstate;
	}
	
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
	
	
//	封装题目标号
	private String squestion;
	private String mquestion;
	private String fquestion;
	
	
	//增加3个字段方便接收表单数据
	private int[] sqid;
	private int[] mqid;
	private int[] fqid;

	
	public int[] getSqid() {
		return sqid;
	}

	public void setSqid(int[] sqid) {
		this.sqid = sqid;
	}

	public int[] getMqid() {
		return mqid;
	}

	public void setMqid(int[] mqid) {
		this.mqid = mqid;
	}

	public int[] getFqid() {
		return fqid;
	}

	public void setFqid(int[] fqid) {
		this.fqid = fqid;
	}

	public String getSquestion() {
		return squestion;
	}

	public void setSquestion(String squestion) {
		this.squestion = squestion;
	}

	public String getMquestion() {
		return mquestion;
	}

	public void setMquestion(String mquestion) {
		this.mquestion = mquestion;
	}

	public String getFquestion() {
		return fquestion;
	}

	public void setFquestion(String fquestion) {
		this.fquestion = fquestion;
	}

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

	//0代表待审核的试卷、1代表通过审核的试卷、2代表审核没通过的试卷
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

	@Override
	public String toString() {
		return "TestPaper [tpid=" + tpid + ", tpno=" + tpno + ", tpname=" + tpname + ", teacher=" + teacher
				+ ", tpstate=" + tpstate + ", squestionscore=" + squestionscore + ", mquestionscore=" + mquestionscore
				+ ", fquestionscore=" + fquestionscore + ", totalscore=" + totalscore + ", squestionSize="
				+ squestionSize + ", mquestionSize=" + mquestionSize + ", fquestionSize=" + fquestionSize + ", sqid="
				+ Arrays.toString(sqid) + ", mqid=" + Arrays.toString(mqid) + ", fqid=" + Arrays.toString(fqid)
				+ ", state=" + state + "]";
	}

}
