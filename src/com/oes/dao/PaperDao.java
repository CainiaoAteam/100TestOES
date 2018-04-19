package com.oes.dao;

import com.oes.bean.TestPaper;

public interface PaperDao {
	/**
	 * 根据pid获取试卷
	 * 
	 * @param pid
	 * @return
	 */
	TestPaper getPaperByPid(String pid);
	
}
