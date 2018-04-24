package com.oes.dao.impl;

import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.FillQuestion;
import com.oes.dao.FillDao;

public class FillDaoImpl extends JdbcDaoSupport implements FillDao {
	/**
	 * 保存填空题
	 */
	public boolean save(FillQuestion fillQuestion) {
		// TODO Auto-generated method stub
		return true;
	}
	/**
	 * 根据老师id获取填空题
	 * 
	 */
	public List<FillQuestion> getFillsByTid(int tid) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 获取双选题目数量
	 */
	public int getFillsCountByTid(int tid) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
