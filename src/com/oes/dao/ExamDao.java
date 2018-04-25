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
	
	List<Exam> getExamByDate(int sid, Date date);
	
	/**
	 * 根据id获取考试对象
	 * 
	 * @param examid
	 * @return
	 */
	Exam getExamById(int examid);
	public List<Exam> getExamsByTidAndState(int tid, int state);
	public List<Exam> getExamsByTid(int tid);
	public List<Exam> getExamsByState(int state);
	public List<Exam> getAllExams();
	public boolean saveExam(Exam exam);
	
	
	boolean addExam(Exam exam);
}
