package com.oes.dao.impl;

import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.MutipleQuestion;
import com.oes.dao.MutipleDao;

/**
 * 注意：在这个dao当中，封装答案，或者获取答案的话都是用到字段manswer,不要用manswers数组那个字段
 * 
 * @author Hking
 *
 */
public class MutipleDaoImpl extends JdbcDaoSupport implements MutipleDao {
	
	/**
	 * 保存双选题
	 */
	public boolean save(MutipleQuestion mutipleQuestion) {
		// TODO Auto-generated method stub
		return true;
	}
	/**
	 * 根据老师id获取双选题
	 */
	public List<MutipleQuestion> getMutiplesByTid(int tid) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 获取双选题目数量
	 */
	public int getMutiplesCountByTid(int tid) {
		// TODO Auto-generated method stub
		return 0;
	}

}
