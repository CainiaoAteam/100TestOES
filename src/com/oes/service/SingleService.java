package com.oes.service;

import java.util.List;

import com.oes.bean.SingleQuestion;

public interface SingleService {

	boolean saveSingleQuestion(SingleQuestion singleQuestion);

	List<SingleQuestion> getSinglesByTid(int tid);

	int getSinglesCountByTid(int tid);

	SingleQuestion getSingleById(int parseInt);

	List<SingleQuestion> getSinglesByTidAndDifficulty(Integer tid, String difficulty);

	boolean updataSingleQuestion(SingleQuestion singleQuestion);

	boolean delectSQBySqid(int sqid);

}
