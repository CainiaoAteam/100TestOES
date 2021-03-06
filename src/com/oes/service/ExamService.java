package com.oes.service;

import java.util.Date;
import java.util.List;

import com.oes.bean.Exam;
import com.oes.bean.Record;
import com.oes.bean.TestPaper;
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
//	
//	/**
//	 * 根据学生id获取该学生的考试记录
//	 * 
//	 * @param sid
//	 * @return
//	 */
//	List<Record> getExamRecordBySid(Integer sid);

	List<Exam> getExamTid(int tid);

	void saveExam(Exam exam);

	List<Exam> getExamByTidAndState(int tid, int i);

	void setExamState(Integer examid);
	
	
	
	
}
