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
	private List<FullQuestion> fquestions;
	
	private int squestionscore;
	private int mquestionscore;
	private int fquestionscore;
	private int totalscore;
	
	//0代表未考的试卷  1代表考过的试卷  -1审核未通过的试卷
	//2代表制定中的试卷
	private int state;
}
