package com.oes.service;

import java.util.Date;
import java.util.List;

import com.oes.bean.Exam;
import com.oes.dao.ExamDao;

public interface ExamService {
	
	/**
	 * 根据时间获取可以进行的考试
	 * 
	 * @param date 当前的时间
	 * @return
	 */
	List<Exam> getExamItemByDate(Date date);
	
	/**
	 * 获取考试对象
	 * @param examid 
	 * @return
	 */
	Exam getExamById(int examid);
	
	
	
	
}
