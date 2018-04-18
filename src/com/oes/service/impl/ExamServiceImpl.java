package com.oes.service.impl;

import com.oes.dao.ExamDao;
import com.oes.service.ExamService;

public class ExamServiceImpl implements ExamService {
	private ExamDao examDao;

	public void setExamDao(ExamDao examDao) {
		this.examDao = examDao;
	}
	
	
}
