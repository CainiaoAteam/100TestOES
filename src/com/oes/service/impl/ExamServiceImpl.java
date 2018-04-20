package com.oes.service.impl;

import java.util.Date;
import java.util.List;

import com.oes.bean.Exam;
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
		Integer tpid = exam.getTestpaper().getTpid();
		
		//第二步 根据试卷id获取试卷对象
		TestPaper paper = paperDao.getPaperByPid(tpid);
		
		//第三步、封装好exam对象
		exam.setTestpaper(paper);
		
		return exam;
	}

	
	
	
}
