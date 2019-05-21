package com.fei.dao;


import java.util.List;

import com.fei.dao.base.IBaseDao;
import com.fei.domain.Teacher;
import com.fei.utils.PageBean;


public interface ITeacherDao extends IBaseDao<Teacher>{

	List<Teacher> findListByQ(String q);

	Teacher findStudentByNameAndPassword(Integer teacher_id, String password);


}
