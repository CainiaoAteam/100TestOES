package com.oes.dao;

import java.util.List;

import com.oes.bean.MutipleQuestion;

public interface MutipleDao {

	boolean save(MutipleQuestion mutipleQuestion);

	List<MutipleQuestion> getMutiplesByTid(int tid);

	int getMutiplesCountByTid(int tid);
	
	boolean updateMutipleByMno(MutipleQuestion mq);
	boolean updateMutipleByMid(MutipleQuestion mq);
	MutipleQuestion getMutipleById(int id);

	List<MutipleQuestion> getMQByTidAndDiff(Integer tid, String difficulty);

	boolean delectMutipleByMqid(int mqid);
}
