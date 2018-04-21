package com.oes.dao;

import java.util.Date;
import java.util.List;

import com.oes.bean.Exam;
import com.oes.bean.Record;

public interface ExamDao {

	/**
	 * 查询在当前时间下可以进行的考试
	 * @param date
	 * @return
	 */
	List<Exam> getExamByDate(Date date);
	
	/**
	 * 根据id获取考试对象
	 * 
	 * @param examid
	 * @return
	 */
	Exam getExamById(int examid);
	
	/**
	 * 根据学生id获取该学生的考试记录
	 * 
	 * @param sid
	 * @return
	 */
	List<Record> getRecordBySid(Integer sid);

}
