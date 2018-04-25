package com.oes.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.oes.bean.FillQuestion;
import com.oes.bean.MutipleQuestion;
import com.oes.bean.SingleQuestion;
import com.oes.bean.TestPaper;
import com.oes.dao.PaperDao;
import com.oes.service.FillService;
import com.oes.service.MutipleService;
import com.oes.service.PaperService;
import com.oes.service.SingleService;
import com.oes.utils.BasicUtil;

public class PaperServiceImpl implements PaperService {
	private PaperDao paperDao;
	private SingleService singleService;
	private MutipleService mutipleService;
	private FillService fillService;
	
	public void setSingleService(SingleService singleService) {
		this.singleService = singleService;
	}

	public void setMutipleService(MutipleService mutipleService) {
		this.mutipleService = mutipleService;
	}

	public void setFillService(FillService fillService) {
		this.fillService = fillService;
	}
	
	public void setPaperDao(PaperDao paperDao) {
		this.paperDao = paperDao;
	}
	/**
	 * 获取试卷，并且封装好试卷信息
	 */
	public TestPaper getPaperByPid(Integer pid) {
		TestPaper paper = paperDao.getPaperByPid(pid);
		List<SingleQuestion> sList = new ArrayList<SingleQuestion>();
		List<MutipleQuestion> mList = new ArrayList<MutipleQuestion>();
		List<FillQuestion> fList = new ArrayList<FillQuestion>();
		
		//封装好题目
		//封装里边的题目
		String[] sqids = paper.getSquestion().split(",");
		String[] mqids = paper.getMquestion().split(",");
		String[] fqids = paper.getFquestion().split(",");
		
		for(int i=0; i<sqids.length;i++) {
			sList.add(singleService.getSingleById(Integer.parseInt(sqids[i])));
		}
		for(int i=0; i<mqids.length;i++) {
			mList.add(mutipleService.getMutipleById(Integer.parseInt(mqids[i])));
		}
		for(int i =0; i<fqids.length;i++) {
			fList.add(fillService.getFillById(Integer.parseInt(fqids[i])));
		}
		
		paper.setSquestions(sList);
		paper.setMquestions(mList);
		paper.setFquestions(fList);
		
		//封装好paper，方便显示
		//封装每种题目的数目
		paper.setSquestionSize(paper.getSquestions().size());
		paper.setMquestionSize(paper.getMquestions().size());
		paper.setFquestionSize(paper.getFquestions().size());
		
//		//封装每种题目的总分值
		paper.setsTotal(paper.getSquestions().size()*paper.getSquestionscore());
		paper.setmTotal(paper.getMquestions().size()*paper.getMquestionscore());
		paper.setfTotal(paper.getFquestions().size()*paper.getFquestionscore());
//		
		
		
		return paper;
	}
	public List<TestPaper> getPapersByStateForTid(int tid, int state) {
		// TODO Auto-generated method stub
		return paperDao.getPapersByStateForTid(tid, state);
	}
	/**
	 * 添加题目
	 */
	public boolean addTestPaper(TestPaper testPaper) {
		// 封装适合保存于数据库的题目字段
		testPaper.setSquestion(BasicUtil.join(testPaper.getSqid(), ","));
		testPaper.setMquestion(BasicUtil.join(testPaper.getMqid(), ","));
		testPaper.setFquestion(BasicUtil.join(testPaper.getFqid(), ","));
		testPaper.setTpno(BasicUtil.getUUID());
		testPaper.setState(0);//初始化试卷为未审核
		
		
		return paperDao.addTestPaper(testPaper);
	}
	public List<TestPaper> getPapersByTid(int tid) {
		// TODO Auto-generated method stub
		return paperDao.getPapersByTid(tid);
	}

}
