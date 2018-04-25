package com.oes.service;

import java.util.List;

import com.oes.bean.FillQuestion;

public interface FillService {

	boolean saveFillQuestion(FillQuestion fillQuestion);

	List<FillQuestion> getFillsByTid(int tid);

	int getFillsCountByTid(int tid);

	FillQuestion getFillById(int parseInt);

}
