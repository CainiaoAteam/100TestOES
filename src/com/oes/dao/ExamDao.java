package com.oes.dao;

import java.util.Date;
import java.util.List;

import com.oes.bean.Exam;

public interface ExamDao {

	/**
	 * 查询在当前时间下可以进行的考试
	 * @param date
	 * @return
	 */
	List<Exam> getExamByDate(Date date);

}
