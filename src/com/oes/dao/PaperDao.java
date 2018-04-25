package com.oes.dao;

import java.util.List;

import com.oes.bean.TestPaper;
import com.opensymphony.xwork2.util.TextParser;

public interface PaperDao {
	/**
	 * 根据pid获取试卷
	 * 
	 * @param pid
	 * @return
	 */
	TestPaper getPaperByPid(Integer pid);

	List<TestPaper> getPapersByStateForTid(int tid, int state);

	boolean addTestPaper(TestPaper testPaper);
	

	List<TestPaper> getPapersByTid(int tid);


	List<TestPaper> getAllPapers();

	List<TestPaper> getPapersByState(int state);
	
}
