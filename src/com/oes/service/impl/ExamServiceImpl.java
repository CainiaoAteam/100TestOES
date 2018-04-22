package com.oes.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.oes.bean.Exam;
import com.oes.bean.Record;
import com.oes.bean.Student;
import com.oes.bean.TestPaper;
import com.oes.dao.ExamDao;
import com.oes.dao.PaperDao;
import com.oes.service.ExamService;

public class ExamServiceImpl implements ExamService {
	private ExamDao examDao;
	private PaperDao paperDao;
	
	public void setExamDao(ExamDao examDao) {
		this.examDao = examDao;
	}
	
	public void setPaperDao(PaperDao paperDao) {
		this.paperDao = paperDao;
	}
	
	/**
	 * 获取考试项
	 */
	public List<Exam> getExamItemByDate(Date date) {
		// TODO Auto-generated method stub
		return examDao.getExamByDate(date);
	}
	/**
	 * 根据考试id获取考试
	 * 
	 */
	public Exam getExamById(int examid) {
		
		//第一步获取考试对象
		Exam exam = examDao.getExamById(examid);
		//获取要考试对应的试卷
		Integer tpid = exam.getTestpaper().getTpid();
		
		//第二步 根据试卷id获取试卷对象
		TestPaper paper = paperDao.getPaperByPid(tpid);
		
		//第三步、封装好exam对象
		exam.setTestpaper(paper);
		
		return exam;
	}
	/**
	 * 获取根据学生id获取学生的考试记录
	 * 
	 * 问题：这里要不要封装学生对象 考试对象？
	 * 
	 */
	public List<Record> getExamRecordBySid(Integer sid) {
		List<Record> records = examDao.getRecordBySid(sid);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Record re = new Record();
		
//		Exam exam = examDao.getExamById(re.getExam().getExamid());
		
		Exam exam = new Exam();
		TestPaper testpaper = new TestPaper();
		testpaper.setTpid(12);
		exam.setTestpaper(testpaper);
		exam.setExamname("测试考试一");
		exam.setStartTime(sdf.format(new Date()));
		exam.setExamno("yasi-4128963");
		exam.setExamid(3);
		
		Student student = new Student();
		
		re.setStudent(student);
		re.setScore(65.5);
		
		re.setExam(exam);
		
		Record re1 = new Record();
		
//		Exam exam = examDao.getExamById(re.getExam().getExamid());
		
		Exam exam1 = new Exam();
		TestPaper testpaper1 = new TestPaper();
		testpaper1.setTpid(12);
		exam1.setTestpaper(testpaper1);
		exam1.setExamname("测试考试二");
		exam1.setStartTime(sdf.format(new Date()));
		exam1.setExamno("yasi-4128963");
		exam1.setExamid(3);
		
		Student student1 = new Student();
		
		re1.setStudent(student1);
		re1.setScore(56);
		
		re1.setExam(exam1);
		
		records.add(re);
		records.add(re1);
		
		return records;
	}

	
	
	
}
