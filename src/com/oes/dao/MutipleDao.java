package com.oes.dao;

import java.util.List;

import com.oes.bean.MutipleQuestion;

public interface MutipleDao {

	boolean save(MutipleQuestion mutipleQuestion);

	List<MutipleQuestion> getMutiplesByTid(int tid);

	int getMutiplesCountByTid(int tid);

}
