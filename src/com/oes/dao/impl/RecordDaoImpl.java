package com.oes.dao.impl;

import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.Record;
import com.oes.dao.RecordDao;

public class RecordDaoImpl extends JdbcDaoSupport implements RecordDao {

	public boolean saveRecord(Integer examid, Integer sid, String myanswer, double score) {
		// TODO Auto-generated method stub
		return true;
	}

	public Record getRecordById(Integer rid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 返回对应的学生的考试记录列表
	 */
	public List<Record> getRecordBySid(Integer sid) {
		// TODO Auto-generated method stub
		return null;
	}

}
