package com.fei.dao;

import java.util.List;

import com.fei.dao.base.IBaseDao;
import com.fei.domain.Lesson;
import com.fei.domain.Studentlesson;

public interface IChooseDao extends IBaseDao<Studentlesson>{


	Integer findByCid(String cid);

	List find(String studentId, String cid);


	void save(String slid, String studentId, String cid);

	List<Studentlesson> findStudentByCid(String cid);

	List<Studentlesson> findBySid(String id);


}
