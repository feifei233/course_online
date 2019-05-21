package com.fei.service;

import java.util.List;

import com.fei.domain.LessonScore;

public interface ILessonScoreService {

	List<LessonScore> findAll(String cid);

	void save(LessonScore model);

}
