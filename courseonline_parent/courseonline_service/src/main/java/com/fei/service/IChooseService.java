package com.fei.service;

import java.util.List;

import com.fei.domain.Studentlesson;
import com.fei.utils.PageBean;

public interface IChooseService {

	public void pageQuery(PageBean pageBean);


	public void save(String slid, String studentId, String cid);


	public List<Studentlesson> findStudentByCid(String cid);

}
