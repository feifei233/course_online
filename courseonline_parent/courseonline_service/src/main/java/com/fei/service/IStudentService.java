package com.fei.service;

import java.util.List;

import com.fei.domain.Studentinfo;
import com.fei.utils.PageBean;

public interface IStudentService {

	public void pageQuery(PageBean pageBean);

	public void saveBatch(List<Studentinfo> studentList);

	public void deleteBatch(String ids);

	public Studentinfo findById(String studentId);

	public void update(Studentinfo student);

	public void save(Studentinfo model);

	public List<Studentinfo> findAll();

	public boolean allowLogin(String id, String password);

	public List<Studentinfo> findNewById(String studentId);


}
