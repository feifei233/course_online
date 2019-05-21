package com.fei.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fei.dao.IChooseDao;
import com.fei.domain.Studentlesson;
import com.fei.service.IChooseService;
import com.fei.utils.PageBean;
@Service
@Transactional
public class ChooseServcieImpl implements  IChooseService{
	
	@Autowired
	private IChooseDao chooseDao;
	
	@Override
	public void pageQuery(PageBean pageBean) {
		chooseDao.pageQuery(pageBean);
		
	}


	@Override
	public void save(String slid, String studentId, String cid) {
		List sl = chooseDao.find(studentId,cid);
		if(sl.size()==0){
			chooseDao.save(slid,studentId,cid);
		}else{
			
		}
		
	}


	@Override
	public List<Studentlesson> findStudentByCid(String cid) {
		return chooseDao.findStudentByCid(cid);
	}

}
