package com.oes.service.impl;

import java.util.List;

import com.oes.bean.MutipleQuestion;
import com.oes.dao.MutipleDao;
import com.oes.service.MutipleService;
import com.oes.utils.BasicUtil;

public class MutipleServiceImpl implements MutipleService {
	private MutipleDao mutipleDao;

	public void setMutipleDao(MutipleDao mutipleDao) {
		this.mutipleDao = mutipleDao;
	}

	public boolean saveMutipleQuestion(MutipleQuestion mutipleQuestion) {
		// TODO Auto-generated method stub
		//解析答案数组
		String[] manswers = mutipleQuestion.getManswers();
		String manswer = "";
		for(int i = 0; i<manswers.length; i++) {
			manswer += manswers[i];
		}
		//将该答案组装进去
		mutipleQuestion.setManswer(manswer);
		mutipleQuestion.setMqno(BasicUtil.getUUID());
		
		
		return mutipleDao.save(mutipleQuestion);
	}
	/**
	 * 
	 */
	public List<MutipleQuestion> getMutiplesByTid(int tid) {
		// TODO Auto-generated method stub
		return mutipleDao.getMutiplesByTid(tid);
	}

	public int getMutiplesCountByTid(int tid) {
		// TODO Auto-generated method stub
		return mutipleDao.getMutiplesCountByTid(tid);
	}
	

}
