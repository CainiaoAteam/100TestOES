package com.oes.service.impl;

import java.util.Date;
import java.util.List;

import com.oes.bean.Exam;
import com.oes.dao.ExamDao;
import com.oes.service.ExamService;

public class ExamServiceImpl implements ExamService {
	private ExamDao examDao;

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
	
	
}
