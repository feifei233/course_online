package com.fei.service;

import java.util.List;

import com.fei.domain.Teacher;
import com.fei.utils.PageBean;

public interface ITeacherService {

	public void save(Teacher model);

	public void pageQuery(PageBean pageBean);

	public void deleteBatch(String ids);

	public Teacher findById(Integer teacherId);

	public void update(Teacher teacher);

	public void initPassword(String ids);

	public void restoreBatch(String ids);
	
	public List<Teacher> findListNotDelete();

}
