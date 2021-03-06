package com.oes.service.impl;

import java.util.List;

import com.oes.bean.FillQuestion;
import com.oes.dao.FillDao;
import com.oes.service.FillService;
import com.oes.utils.BasicUtil;

public class FillServiceImpl implements FillService {
	private FillDao fillDao;

	public void setFillDao(FillDao fillDao) {
		this.fillDao = fillDao;
	}
	/**
	 * 添加填空题
	 */
	public boolean saveFillQuestion(FillQuestion fillQuestion) {
		// TODO Auto-generated method stub
		fillQuestion.setFqno(BasicUtil.getUUID());
		return fillDao.save(fillQuestion);
	}
	public List<FillQuestion> getFillsByTid(int tid) {
		// TODO Auto-generated method stub
		return fillDao.getFillsByTid(tid);
	}
	public int getFillsCountByTid(int tid) {
		// TODO Auto-generated method stub
		return fillDao.getFillsCountByTid(tid);
	}
	public FillQuestion getFillById(int parseInt) {
		// TODO Auto-generated method stub
		return fillDao.getFillQuestionById(parseInt);
	}
	public List<FillQuestion> getFillsByTidAndDifficulty(Integer tid, String difficulty) {
		// TODO Auto-generated method stub
		return fillDao.getFQByTidAndDiff(tid,difficulty);
	}
	public boolean updataFillQuestion(FillQuestion fillQuestion) {
		// TODO Auto-generated method stub
		return fillDao.updateFillByFid(fillQuestion);
	}
	public boolean delectFQByFqid(int fqid) {
		// TODO Auto-generated method stub
		return fillDao.deleteFillByfqid(fqid);
	}
	
}
