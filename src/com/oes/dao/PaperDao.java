package com.oes.dao;

import java.util.List;

import com.oes.bean.TestPaper;

public interface PaperDao {
	/**
	 * 根据pid获取试卷
	 * 
	 * @param pid
	 * @return
	 */
	TestPaper getPaperByPid(Integer pid);

	List<TestPaper> getPapersByStateForTid(int tid, int state);
	
}
