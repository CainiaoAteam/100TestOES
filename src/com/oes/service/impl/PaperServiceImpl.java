package com.oes.service.impl;

import com.oes.bean.TestPaper;
import com.oes.dao.PaperDao;
import com.oes.service.PaperService;

public class PaperServiceImpl implements PaperService {
	private PaperDao paperDao;
	
	public void setPaperDao(PaperDao paperDao) {
		this.paperDao = paperDao;
	}

	public TestPaper getPaperByPid(String pid) {
		// TODO Auto-generated method stub
		return paperDao.getPaperByPid(pid);
	}

}
