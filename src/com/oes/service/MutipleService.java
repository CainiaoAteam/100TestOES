package com.oes.service;

import java.util.List;

import com.oes.bean.MutipleQuestion;

public interface MutipleService {

	boolean saveMutipleQuestion(MutipleQuestion mutipleQuestion);

	List<MutipleQuestion> getMutiplesByTid(int tid);

	int getMutiplesCountByTid(int tid);

	MutipleQuestion getMutipleById(int parseInt);

	List<MutipleQuestion> getMutiplesByTidAndDifficulty(Integer tid, String difficulty);

	boolean updataMutipleQuestion(MutipleQuestion mutipleQuestion);
	
}
