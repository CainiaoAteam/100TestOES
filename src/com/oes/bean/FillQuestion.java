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

}
