package com.oes.bean;

public class MutipleQuestion extends Question {
	/**
	 * `mqid` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `mqno` varchar(36) NOT NULL,
  `mquestion` varchar(300) NOT NULL,
  `mchoiceA` varchar(100) DEFAULT NULL,
  `mchoiceB` varchar(100) DEFAULT NULL,
  `mchoiceC` varchar(100) DEFAULT NULL,
  `mchoiceD` varchar(100) DEFAULT NULL,
  `manswer` varchar(10) DEFAULT NULL,
  `mexplanation` varchar(500) DEFAULT NULL,
  `difficulty` varchar(20) DEFAULT NULL,
	 */
	private Integer mqid;
	private String mqno;
	private String mquestion;
	private String mchoiceA;
	private String mchoiceB;
	private String mchoiceC;
	private String mchoiceD;
	private String manswer;
	private String mexplanation;
	private String difficulty;
	public Integer getMqid() {
		return mqid;
	}
	public void setMqid(Integer mqid) {
		this.mqid = mqid;
	}
	public String getMqno() {
		return mqno;
	}
	public void setMqno(String mqno) {
		this.mqno = mqno;
	}
	public String getMquestion() {
		return mquestion;
	}
	public void setMquestion(String mquestion) {
		this.mquestion = mquestion;
	}
	public String getMchoiceA() {
		return mchoiceA;
	}
	public void setMchoiceA(String mchoiceA) {
		this.mchoiceA = mchoiceA;
	}
	public String getMchoiceB() {
		return mchoiceB;
	}
	public void setMchoiceB(String mchoiceB) {
		this.mchoiceB = mchoiceB;
	}
	public String getMchoiceC() {
		return mchoiceC;
	}
	public void setMchoiceC(String mchoiceC) {
		this.mchoiceC = mchoiceC;
	}
	public String getMchoiceD() {
		return mchoiceD;
	}
	public void setMchoiceD(String mchoiceD) {
		this.mchoiceD = mchoiceD;
	}
	public String getManswer() {
		return manswer;
	}
	public void setManswer(String manswer) {
		this.manswer = manswer;
	}
	public String getMexplanation() {
		return mexplanation;
	}
	public void setMexplanation(String mexplanation) {
		this.mexplanation = mexplanation;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	
}
