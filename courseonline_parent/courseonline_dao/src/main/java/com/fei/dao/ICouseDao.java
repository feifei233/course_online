package com.fei.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.fei.dao.base.IBaseDao;
import com.fei.domain.Courseinfo;
import com.fei.domain.Teacher;

public interface ICouseDao extends IBaseDao<Courseinfo>{

	List<Courseinfo> findFileByFileName(String fileFileName);

	public void saveAll(String courseId,String courseName,String courseType, String courseFbrq, String url, String courseopen,   Integer courseClicksum,String imageurl);

	String findUrlByid(String id);

	String findNameByid(String ids);

	String findTypeByid(String ids);


	Courseinfo findByTId(Integer teacherId, String type);

}
