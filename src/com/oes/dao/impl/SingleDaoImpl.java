package com.oes.dao.impl;

import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.SingleQuestion;
import com.oes.dao.SingleDao;

public class SingleDaoImpl extends JdbcDaoSupport implements SingleDao {
	
	/**
	 * 保存单选题
	 */
	public boolean saveSingleQuestion(SingleQuestion singleQuestion) {
		// TODO Auto-generated method stub
		return true;
	}
	
	/**
	 * 根据老师的id获取所有单选题
	 */
	public List<SingleQuestion> getSinglesByTid(int tid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 获取单选题目数目
	 * 
	 */
	public int getSinglesCountByTid(int tid) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public boolean updateSingleBySno(String sno) {
		return false;
	
	}
	public boolean updateSingleBySid(int sid) {
		return false;
		
	}
	
}
