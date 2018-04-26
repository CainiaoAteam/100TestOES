package com.oes.dao;

import java.util.List;

import com.oes.bean.SingleQuestion;

public interface SingleDao {
	
	boolean saveSingleQuestion(SingleQuestion singleQuestion);

	List<SingleQuestion> getSinglesByTid(int tid);

	int getSinglesCountByTid(int tid);
	public boolean updateSingleBySno(SingleQuestion sq);
	public boolean updateSingleBySid(SingleQuestion sq);
	public SingleQuestion getSingleBySqid(int sqid);

	List<SingleQuestion> getSQByTidAndDiff(Integer tid, String difficulty);

	boolean updataSQ(SingleQuestion singleQuestion);

}
