package com.fei.dao;

import java.util.List;

import com.fei.dao.base.IBaseDao;
import com.fei.domain.Lesson;
import com.fei.domain.Studentinfo;

public interface ILessonDao  extends IBaseDao<Lesson>{

	List<Lesson> findList(String ctype);

	String findByCid(String cid);

	List<Lesson> findByid(String lessonId);

	void insertAll(String cid,String imageurl, String courseName, String uploadFileName);

	List<Object> findPieByType();

	List<Object> findConlumnByType();

	

}
