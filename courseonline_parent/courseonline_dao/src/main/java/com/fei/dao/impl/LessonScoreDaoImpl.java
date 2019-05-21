package com.fei.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.fei.dao.ILessonScoreDao;
import com.fei.dao.base.impl.BaseDaoImpl;
import com.fei.domain.LessonScore;
import com.fei.domain.Notice;

@Repository
public class LessonScoreDaoImpl extends BaseDaoImpl<LessonScore> implements ILessonScoreDao {

	@Override
	public List<LessonScore> findByCid(String cid) {
		String hql="FROM LessonScore ls WHERE ls.cid=?";		
		return (List<LessonScore>) this.getHibernateTemplate().find(hql, cid);
	}

}
