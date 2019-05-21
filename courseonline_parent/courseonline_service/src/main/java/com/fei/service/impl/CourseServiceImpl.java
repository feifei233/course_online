package com.fei.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fei.dao.ICouseDao;
import com.fei.domain.Courseinfo;
import com.fei.domain.Teacher;
import com.fei.service.ICourseService;
import com.fei.utils.PageBean;

@Service
@Transactional
public class CourseServiceImpl implements ICourseService {
	@Autowired
	private ICouseDao courseDao;
	
	/**
	 * 通过文件名查循
	 */
	public List<Courseinfo> findFileByFileName(String fileFileName) {
		
		return courseDao.findFileByFileName(fileFileName);
	}

	/**
	 *	记录上传的文件信息
	 */
	public void save(Courseinfo model) {
		courseDao.save(model);

	}

	/**
	 * 
	 */
	public void pageQuery(PageBean pageBean) {
		courseDao.pageQuery(pageBean);
	}

	/**
	 * 
	 */
	public void saveAll(String courseId,String courseName ,String courseType, String courseFbrq, String url, String courseopen, Integer courseClicksum,String imageurl) {
		courseDao.saveAll(courseId,courseName,courseType,courseFbrq,url,courseopen,courseClicksum,imageurl);
		
	}

	@Override
	public String findByIds(String ids) {

		return courseDao.findUrlByid(ids);
	}

	@Override
	public String findNameByid(String ids) {
		return courseDao.findNameByid(ids);
	}

	@Override
	public String findTypeByid(String ids) {
		return courseDao.findTypeByid(ids);
	}

	@Override
	public Courseinfo findById(String courseId) {
		return courseDao.findById(courseId);
	}

	@Override
	public void update(Courseinfo course) {
		courseDao.saveOrUpdate(course);
		
	}

	@Override
	public void deleteBatch(String ids) {
		if(StringUtils.isNotBlank(ids)){
			String[] courseIds = ids.split(",");
			for (String id : courseIds) {
				courseDao.executeUpdate("course.delete",id);
			}
		}
	}

	@Override
	public Courseinfo findByTId(Integer teacherId, String type) {
	
		return courseDao.findByTId(teacherId,type);
	}



}
