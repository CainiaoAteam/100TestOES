package com.oes.dao;

import java.util.List;

import com.oes.bean.Record;

public interface RecordDao {
	/**
	 * 将考试记录保存到数据库
	 * 
	 * @param examid 对应考试的id
	 * @param sid	对应的学生id
	 * @param myanswer 对应的考试的答案
	 * @param score	对应考试的分数
	 * 
	 * @return
	 */
	boolean saveRecord(Integer examid, Integer sid, String myanswer, double score);
	
	/**
	 * 根据考试记录获取考试记录对象
	 * @param rid
	 * @return
	 */
	Record getRecordById(Integer rid);
	
	/**
	 * 返回学生sid的考试记录列表
	 * 
	 * @param sid
	 * @return
	 */
	List<Record> getRecordBySid(Integer sid);
	

}
