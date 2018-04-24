package com.oes.dao;

import java.util.List;

import com.oes.bean.SingleQuestion;

public interface SingleDao {
	
	boolean saveSingleQuestion(SingleQuestion singleQuestion);

	List<SingleQuestion> getSinglesByTid(int tid);

	int getSinglesCountByTid(int tid);

}
