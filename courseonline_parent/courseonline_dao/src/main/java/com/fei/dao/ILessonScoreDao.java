package com.fei.dao;

import java.util.List;

import com.fei.dao.base.IBaseDao;
import com.fei.domain.LessonScore;

public interface ILessonScoreDao extends IBaseDao<LessonScore>{

	List<LessonScore> findByCid(String cid);

}
