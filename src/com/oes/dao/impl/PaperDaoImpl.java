package com.oes.dao.impl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.oes.bean.TestPaper;
import com.oes.dao.PaperDao;

public class PaperDaoImpl extends HibernateDaoSupport implements PaperDao {
	/**
	 * 根据试卷的id获取试卷，而不是编号
	 */
	public TestPaper getPaperByPid(Integer pid) {
		
		return null;
	}
	
}
