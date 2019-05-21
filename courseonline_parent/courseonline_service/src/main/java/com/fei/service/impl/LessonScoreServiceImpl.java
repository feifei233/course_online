package com.fei.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fei.dao.ILessonScoreDao;
import com.fei.domain.LessonScore;
import com.fei.service.ILessonScoreService;

@Service
@Transactional
public class LessonScoreServiceImpl implements ILessonScoreService {

	@Autowired
	private ILessonScoreDao lessonScoreDao;
	
	@Override
	public List<LessonScore> findAll(String cid) {
		 
		 return lessonScoreDao.findByCid(cid);
	}

	@Override
	public void save(LessonScore model) {

		lessonScoreDao.save(model);
		
	}

}
