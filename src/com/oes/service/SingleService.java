package com.oes.service;

import java.util.List;

import com.oes.bean.SingleQuestion;

public interface SingleService {

	boolean saveSingleQuestion(SingleQuestion singleQuestion);

	List<SingleQuestion> getSinglesByTid(int tid);

	int getSinglesCountByTid(int tid);

}
