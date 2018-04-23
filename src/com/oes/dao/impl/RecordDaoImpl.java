package com.oes.dao.impl;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.Record;
import com.oes.dao.RecordDao;

public class RecordDaoImpl extends JdbcDaoSupport implements RecordDao {

	public boolean saveRecord(Integer examid, Integer sid, String myanswer, double score) {
		// TODO Auto-generated method stub
		return true;
	}

	public Record getRrcordById(Integer rid) {
		// TODO Auto-generated method stub
		return null;
	}

}
