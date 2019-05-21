package com.fei.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.fei.domain.Courseinfo;
import com.fei.domain.Teacher;
import com.fei.utils.PageBean;

public interface ICourseService {

	List<Courseinfo> findFileByFileName(String fileFileName);

	void save(Courseinfo model);

	public void pageQuery(PageBean pageBean);

	public void saveAll( String courseId, String courseName,String courseType, String courseFbrq, String url, String courseopen, Integer courseClicksum,String imageurl);

	public String findByIds(String ids);

	public String findNameByid(String ids);

	public String findTypeByid(String ids);

	public Courseinfo findById(String courseId);

	public void update(Courseinfo course);

	public void deleteBatch(String ids);

	Courseinfo findByTId(Integer teacherId, String type);




}
