package com.oes.dao;

import java.util.List;

import com.oes.bean.FillQuestion;

public interface FillDao {
	/**
	 * 保存填空题
	 * @param fillQuestion
	 * @return
	 */
	boolean save(FillQuestion fillQuestion);

	List<FillQuestion> getFillsByTid(int tid);

	int getFillsCountByTid(int tid);
	boolean updateFillByFno(FillQuestion fill);
	boolean updateFillByFid(FillQuestion fill);
	FillQuestion getFillQuestionById(int id);

	List<FillQuestion> getFQByTidAndDiff(Integer tid, String difficulty);
	
	boolean deleteFillByfqid(int fqid);
	
}
