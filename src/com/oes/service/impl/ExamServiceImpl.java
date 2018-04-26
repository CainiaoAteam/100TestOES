package com.oes.service.impl;

import java.util.Date;
import java.util.List;

import com.oes.bean.Exam;
import com.oes.bean.TestPaper;
import com.oes.dao.ExamDao;

import com.oes.service.ExamService;
import com.oes.service.PaperService;
import com.oes.utils.BasicUtil;

public class ExamServiceImpl implements ExamService {
	private ExamDao examDao;
	private PaperService paperService;
	
	
	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}

	
	public void setExamDao(ExamDao examDao) {
		this.examDao = examDao;
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
		TestPaper paper = paperService.getPaperByPid(tpid);
		
		
		//第三步、封装好exam对象
		exam.setTestpaper(paper);
		
		return exam;
	}


	public List<Exam> getExamTid(int tid) {
		// TODO Auto-generated method stub
		return examDao.getExamsByTid(tid);
	}


	public void saveExam(Exam exam) {
		exam.setExamno(BasicUtil.getUUID());
		examDao.saveExam(exam);
	}


	public List<Exam> getExamByTidAndState(int tid, int i) {
		// TODO Auto-generated method stub
		return examDao.getExamsByTidAndState(tid, i);
	}


	public void setExamState(Integer examid) {
		examDao.updateExamState(examid);
		
	}

	
	
	
}
