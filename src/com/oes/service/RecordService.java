package com.oes.service;

import java.util.List;

import com.oes.bean.Exam;
import com.oes.bean.Record;
import com.oes.bean.Student;

public interface RecordService {
	
	/**
	 * 保存考试记录
	 * @param re
	 * @return
	 */
	boolean saveRecord(Record re);
	
	/**
	 * 封装好考试记录
	 * 
	 * @param student
	 * @param exam
	 * @return
	 */
	Record packageRecord(Record re,Student student, Exam exam,String answer);
	
	/**
	 * 根据考试记录id获取考试相应的记录
	 * @param rid
	 * @return
	 */
	Record getRecordById(Integer rid);
	
	/**
	 * 获取该学的考试记录
	 * @param sid	对应的学生id
	 * @return
	 */
	List<Record> getRecordsBySid(Integer sid);

	List<Record> getRecordByExamId(int examid);
	
	
	

}
