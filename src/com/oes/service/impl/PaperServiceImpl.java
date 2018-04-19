package com.oes.service.impl;

import com.oes.bean.TestPaper;
import com.oes.dao.PaperDao;
import com.oes.service.PaperService;

public class PaperServiceImpl implements PaperService {
	private PaperDao paperDao;
	
	public void setPaperDao(PaperDao paperDao) {
		this.paperDao = paperDao;
	}
	/**
	 * 获取试卷，并且封装好试卷信息
	 */
	public TestPaper getPaperByPid(Integer pid) {
		TestPaper paper = paperDao.getPaperByPid(pid);
		
		//封装好paper，方便显示
		//封装每种题目的数目
		paper.setSquestionSize(paper.getSquestions().size());
		paper.setMquestionSize(paper.getMquestions().size());
		paper.setFquestionSize(paper.getFquestions().size());
		
		//封装每种题目的总分值
		paper.setsTotal(paper.getSquestions().size()*paper.getSquestionscore());
		paper.setmTotal(paper.getMquestions().size()*paper.getMquestionscore());
		paper.setfTotal(paper.getFquestions().size()*paper.getFquestionscore());
		
		
		
		return paper;
	}

}
