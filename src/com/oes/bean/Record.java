package com.oes.bean;

/**
 * 考试记录表
 * 
 * @author Hking
 *
 */
public class Record {
	
	/**
	 * `rid` int(10) NOT NULL AUTO_INCREMENT,
  `sid` int(10) DEFAULT NULL,
  `tpid` int(10) DEFAULT NULL,
  `myanswer` varchar(300) DEFAULT NULL,
  `score` int(10) DEFAULT NULL,
  PRIMARY KEY (`rid`)
	 */
	
	private Integer rid;
	private Student student;
	private String myanswer;
	private double score;		//这里修改数据类型为double 《郭冠志
	
	private Exam exam;			//增加字段 examid； 删除了tpid 
	
	
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
//	public TestPaper getPaper() {
//		return paper;
//	}
//	public void setPaper(TestPaper paper) {
//		this.paper = paper;
//	}
	public String getMyanswer() {
		return myanswer;
	}
	public void setMyanswer(String myanswer) {
		this.myanswer = myanswer;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	
	@Override
	public String toString() {
		return "Record [rid=" + rid + ", student=" + student + ", myanswer=" + myanswer + ", score=" + score + ", exam="
				+ exam + "]";
	}
	
	
}
