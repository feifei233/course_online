package com.fei.dao.impl;



import java.util.List;

import org.springframework.stereotype.Repository;

import com.fei.dao.ITeacherDao;
import com.fei.dao.base.impl.BaseDaoImpl;
import com.fei.domain.Teacher;
@Repository
public class TeacherDaoImpl extends BaseDaoImpl<Teacher> implements ITeacherDao {

	@Override
	public List<Teacher> findListByQ(String q) {
		String hql = "FROM Teacher t WHERE t.name LIKE ?";
	List<Teacher> list = (List<Teacher>) this.getHibernateTemplate().
			find(hql, "%"+q+"%");
	return list;
	}

	@Override
	public Teacher findStudentByNameAndPassword(Integer id, String password) {
		String hql="FROM Teacher t WHERE t.teacherId=? and t.password=?";
		List<Teacher> list = (List<Teacher>) this.getHibernateTemplate().find(hql,id,password);
		if(list!=null  && list.size()>0){
			return list.get(0);
		}
		return null;
	}


	
}
