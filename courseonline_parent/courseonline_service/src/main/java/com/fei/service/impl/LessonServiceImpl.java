package com.fei.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fei.dao.IChooseDao;
import com.fei.dao.ILessonDao;
import com.fei.dao.INoticeDao;
import com.fei.dao.IVedioDao;
import com.fei.domain.Lesson;
import com.fei.domain.Vedio;
import com.fei.service.ILessonService;
import com.fei.utils.FrontPageBean;
import com.fei.utils.PageBean;
@Service
@Transactional
public class LessonServiceImpl implements ILessonService{
	@Autowired
	private ILessonDao lessonDao;
	@Autowired
	private IChooseDao chooseDao;
	@Autowired
	private IVedioDao vedioDao;
	@Autowired
	private INoticeDao noticeDao;
	@Override
	public void pageQuery(PageBean pageBean) {
		lessonDao.pageQuery(pageBean);
		
	}

	@Override
	public Lesson findById(String cid) {
		return lessonDao.findById(cid);
	}

	@Override
	public void update(Lesson lesson) {
		lessonDao.update(lesson);
		
	}

	@Override
	public void save(Lesson model) {
		lessonDao.save(model);
		
	}

	@Override
	public void deleteBatch(String ids) {
		if(StringUtils.isNotBlank(ids)){
			String[] studentIds = ids.split(",");
			for (String id : studentIds) {
				lessonDao.executeUpdate("lesson.delete",id);
			}
		}
		
	}

	@Override
	public List<Lesson> findListNotDelete() {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Lesson.class);
		detachedCriteria.add(Restrictions.ne("cstate", "1"));
		return lessonDao.findByCriteria(detachedCriteria);
	}

	@Override
	public FrontPageBean getPagebean(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		Integer totalCount = lessonDao.getTotalCount(dc);
		FrontPageBean pb= new FrontPageBean(currentPage, totalCount, pageSize);
		List<Lesson> list = lessonDao.getPageList(dc,pb.getStart(),pb.getPageSize());
		for (Lesson lesson : list) {
			Integer count = chooseDao.findByCid(lesson.getCid());
			lesson.setCount(count);
			Integer ctime = vedioDao.findByCid(lesson.getCid());
			lesson.setCtime(ctime);
			lessonDao.update(lesson);
		}
		pb.setList(list);
		return pb;
	}

	@Override
	public List<Lesson> findList(String ctype) {
		return lessonDao.findList(ctype);
	}

	@Override
	public List<Lesson> findAll(String cid) {
		String type = lessonDao.findByCid(cid);
		 return lessonDao.findList(type);
		
	}

	@Override
	public FrontPageBean getPagebean2(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		
		
		
		Integer totalCount = lessonDao.getTotalCount(dc);
		FrontPageBean pb= new FrontPageBean(currentPage, totalCount, pageSize);
		List<Lesson> list = lessonDao.getPageList(dc,pb.getStart(),pb.getPageSize());
		for (Lesson lesson : list) {
			Integer count = chooseDao.findByCid(lesson.getCid());
			lesson.setCount(count);
			Integer ctime = vedioDao.findByCid(lesson.getCid());
			lesson.setCtime(ctime);
			lessonDao.update(lesson);
		}
		pb.setList(list);
		return pb;
	}

	@Override
	public void insertAll(String cid,String imageurl, String courseName, String uploadFileName) {
		
		lessonDao.insertAll(cid,imageurl,courseName,uploadFileName);
		
	}

	@Override
	public List<Object> findPieByType() {
		return lessonDao.findPieByType();
	}

	@Override
	public List<Object> findConlumnByType() {
	
		return lessonDao.findConlumnByType();
	}

//	@Override
//	public List findList(String cid, String ctype) {
//        
//		List<Vedio> vedio = vedioDao.findVedio(cid);
//		
//		return null;
//	}


}
