package com.oes.service.impl;

import java.util.List;

import com.oes.bean.SingleQuestion;
import com.oes.dao.SingleDao;
import com.oes.service.SingleService;
import com.oes.utils.BasicUtil;

public class SingleServiceImpl implements SingleService {
	private SingleDao singleDao;

	public void setSingleDao(SingleDao singleDao) {
		this.singleDao = singleDao;
	}

	/**
	 * 保存到数据库
	 */
	public boolean saveSingleQuestion(SingleQuestion singleQuestion) {

		//先封装no
		singleQuestion.setSqno(BasicUtil.getUUID());
		
		return singleDao.saveSingleQuestion(singleQuestion);
	}

	public List<SingleQuestion> getSinglesByTid(int tid) {
		// TODO Auto-generated method stub
		return singleDao.getSinglesByTid(tid);
	}

	public int getSinglesCountByTid(int tid) {
		// TODO Auto-generated method stub
		return singleDao.getSinglesCountByTid(tid);
	}

	public SingleQuestion getSingleById(int parseInt) {
		// TODO Auto-generated method stub
		return singleDao.getSingleBySqid(parseInt);
	}
	
}
