package com.oes.bean;

public class SingleQuestion extends Question {
	/**
	 * `sqid` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `sqno` varchar(36) NOT NULL,
  `squestion` varchar(300) NOT NULL,
  `schoiceA` varchar(100) DEFAULT NULL,
  `schoiceB` varchar(100) DEFAULT NULL,
  `schoiceC` varchar(100) DEFAULT NULL,
  `schoiceD` varchar(100) DEFAULT NULL,
  `sanswer` varchar(10) DEFAULT NULL,
  `sexplanation` varchar(500) DEFAULT NULL,
  `difficulty` varchar(20) DEFAULT NULL,
	 */
	
	private Integer sqid;
	private String sqno;
	private String squestion;	//题目描述
	private String schoiceA;
	private String schoiceB;
	private String schoiceC;
	private String schoiceD;
	private String sanswer;			//题目答案
	private String sexplanation;	//题目解析
	private String difficulty;		//题目难度
	
	private String answer;	//我的答案
	
	private int istrue;	//判断答案是否正确 1代表正确0代表打错
	
	private int tid;	//出题老师的id要保存到数据库
	
	private final int type=1;		//标记一下题目类型，不用存到数据库
	
	public int getType() {
		return type;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getIstrue() {
		return istrue;
	}
	public void setIstrue(int istrue) {
		this.istrue = istrue;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Integer getSqid() {
		return sqid;
	}
	public void setSqid(Integer sqid) {
		this.sqid = sqid;
	}
	public String getSqno() {
		return sqno;
	}
	public void setSqno(String sqno) {
		this.sqno = sqno;
	}
	public String getSquestion() {
		return squestion;
	}
	public void setSquestion(String squestion) {
		this.squestion = squestion;
	}
	public String getSchoiceA() {
		return schoiceA;
	}
	public void setSchoiceA(String schoiceA) {
		this.schoiceA = schoiceA;
	}
	public String getSchoiceB() {
		return schoiceB;
	}
	public void setSchoiceB(String schoiceB) {
		this.schoiceB = schoiceB;
	}
	public String getSchoiceC() {
		return schoiceC;
	}
	public void setSchoiceC(String schoiceC) {
		this.schoiceC = schoiceC;
	}
	public String getSchoiceD() {
		return schoiceD;
	}
	public void setSchoiceD(String schoiceD) {
		this.schoiceD = schoiceD;
	}
	public String getSanswer() {
		return sanswer;
	}
	public void setSanswer(String sanswer) {
		this.sanswer = sanswer;
	}
	public String getSexplanation() {
		return sexplanation;
	}
	public void setSexplanation(String sexplanation) {
		this.sexplanation = sexplanation;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	@Override
	public String toString() {
		return "SingleQuestion [sqid=" + sqid + ", sqno=" + sqno + ", squestion=" + squestion + ", schoiceA=" + schoiceA
				+ ", schoiceB=" + schoiceB + ", schoiceC=" + schoiceC + ", schoiceD=" + schoiceD + ", sanswer="
				+ sanswer + ", sexplanation=" + sexplanation + ", difficulty=" + difficulty + ", answer=" + answer
				+ ", istrue=" + istrue + ", tid=" + tid + "]";
	}
	
}
