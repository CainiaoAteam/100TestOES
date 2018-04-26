package com.oes.service;

import java.util.List;

import com.oes.bean.TestPaper;

public interface PaperService {
	/**
	 * 根据试卷id获取试卷
	 * @param pid
	 * @return
	 */
	TestPaper getPaperByPid(Integer pid);

	List<TestPaper> getPapersByStateForTid(int tid, int state);
	
	boolean addTestPaper(TestPaper testPaper);

	List<TestPaper> getPapersByTid(int tid);

	List<TestPaper> getExamByTidAndState(int tid, int i);
	
}
