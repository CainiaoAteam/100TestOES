package com.oes.service;

import com.oes.bean.TestPaper;

public interface PaperService {
	/**
	 * 根据试卷id获取试卷
	 * @param pid
	 * @return
	 */
	TestPaper getPaperByPid(String pid);
	
}
