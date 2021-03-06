package com.oes.bean;

public class FillQuestion extends Question {
	/**
	 * `fqid` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `fqno` varchar(20) NOT NULL,
  `fquestion` varchar(500) NOT NULL,
  `fanswer` varchar(20) DEFAULT NULL,
  `fexplanation` varchar(500) DEFAULT NULL,
  `difficulty` varchar(20) DEFAULT NULL,
	 */
	
	private Integer fqid;
	private String fqno;
	private String fquestion;
	private String fanswer;
	private String fexplanation;
	private String difficulty;
	
	
	private String answer;	//我的答案
	
	private int istrue;	//判断答案是否正确 1代表正确0代表打错
	
	private int tid;	//出题老师的id要保存到数据库
	
	private final int type=3;		//标记一下题目类型，不用存到数据库
	
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
	public Integer getFqid() {
		return fqid;
	}
	public void setFqid(Integer fqid) {
		this.fqid = fqid;
	}
	public String getFqno() {
		return fqno;
	}
	public void setFqno(String fqno) {
		this.fqno = fqno;
	}
	public String getFquestion() {
		return fquestion;
	}
	public void setFquestion(String fquestion) {
		this.fquestion = fquestion;
	}
	public String getFanswer() {
		return fanswer;
	}
	public void setFanswer(String fanswer) {
		this.fanswer = fanswer;
	}
	public String getFexplanation() {
		return fexplanation;
	}
	public void setFexplanation(String fexplanation) {
		this.fexplanation = fexplanation;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	@Override
	public String toString() {
		return "FillQuestion [fqid=" + fqid + ", fqno=" + fqno + ", fquestion=" + fquestion + ", fanswer=" + fanswer
				+ ", fexplanation=" + fexplanation + ", difficulty=" + difficulty + ", answer=" + answer + ", istrue="
				+ istrue + ", tid=" + tid + "]";
	}
	
}
