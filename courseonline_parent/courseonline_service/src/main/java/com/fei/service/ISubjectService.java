package com.fei.service;

import com.fei.domain.Subject;
import com.fei.utils.PageBean;

public interface ISubjectService {

	public void pageQuery(PageBean pageBean);

	public Subject findById(Integer subjectId);

	public void update(Subject subject);

	public void save(Subject model);

	public void deleteBatch(String ids);

}
