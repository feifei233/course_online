package com.fei.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fei.dao.ISubjectDao;
import com.fei.domain.Subject;
import com.fei.service.ISubjectService;
import com.fei.utils.PageBean;
@Service
@Transactional
public class SubjectServiceImpl implements ISubjectService {

	
	@Autowired
	private ISubjectDao subjectDao ; 
	
	/**
	 * 
	 */
	public void pageQuery(PageBean pageBean) {
		
		subjectDao.pageQuery(pageBean);
	}

	/**
	 * 
	 */
	public Subject findById(Integer subjectId) {
		return subjectDao.findById(subjectId);
	}

	@Override
	public void update(Subject subject) {
		subjectDao.update(subject);
	}

	@Override
	public void save(Subject model) {
		subjectDao.save(model);
	}

	@Override
	public void deleteBatch(String ids) {
		if(StringUtils.isNotBlank(ids)){
			String[] subjectIds = ids.split(",");
			for (String id : subjectIds) {
				subjectDao.executeUpdate("subject.delete",id);
			}
		}
		
	}

}
