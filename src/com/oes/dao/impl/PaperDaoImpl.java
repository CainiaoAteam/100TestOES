package com.oes.dao.impl;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.TestPaper;
import com.oes.dao.PaperDao;

public class PaperDaoImpl extends JdbcDaoSupport implements PaperDao {
	/**
	 * 不要实现该方法
	 * @param pid
	 * @return
	 */
	public TestPaper getPaperByPid(String pid) {
		// TODO Auto-generated method stub
		
		return null;
	}

	public TestPaper getPaperByPid(Integer pid) {
		TestPaper paper = new TestPaper();
		paper.setTpname("2018英语四级考试 A 卷");
		
		return paper;
	}
	
}
