package com.fei.dao;

import java.util.List;

import com.fei.dao.base.IBaseDao;
import com.fei.domain.Studentinfo;

public interface IStudentDao extends IBaseDao<Studentinfo>{

	Studentinfo findStudentByNameAndPassword(String id, String password);

	List<Studentinfo> findNewById(String studentId);

}
