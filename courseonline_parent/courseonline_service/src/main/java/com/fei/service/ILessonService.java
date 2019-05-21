package com.fei.service;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;

import com.fei.domain.Lesson;
import com.fei.utils.FrontPageBean;
import com.fei.utils.PageBean;

public interface ILessonService {

	public void pageQuery(PageBean pageBean);

	public Lesson findById(String cid);

	public void update(Lesson lesson);

	public void save(Lesson model);

	public void deleteBatch(String ids);

	public List<Lesson> findListNotDelete();

	public FrontPageBean getPagebean(DetachedCriteria dc, Integer currentPage, Integer pageSize);

	public List<Lesson> findList(String ctype);

	public List<Lesson> findAll(String cid);

	public FrontPageBean getPagebean2(DetachedCriteria dc, Integer currentPage, Integer pageSize);

	public void insertAll(String cid,String imageurl, String courseName, String uploadFileName);

	public List<Object> findPieByType();

	public List<Object> findConlumnByType();


	

}
