package com.fei.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.fei.dao.IStudentDao;
import com.fei.dao.base.impl.BaseDaoImpl;
import com.fei.domain.Studentinfo;
import com.fei.domain.Teacher;
import com.fei.utils.PageBean;

@Repository
public class StudentDaoImpl extends BaseDaoImpl<Studentinfo> implements IStudentDao {

	@Override
	public Studentinfo findStudentByNameAndPassword(String id, String password) {
		String hql="FROM Studentinfo s WHERE s.studentId=? and s.password=?";
		List<Studentinfo> list = (List<Studentinfo>) this.getHibernateTemplate().find(hql, id,password);
		if(list!=null  && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Studentinfo> findNewById(String studentId) {
		String hql = "FROM Studentinfo where studentId=? order by studentId desc";
		
		Query query = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		query.setParameter(0, studentId);
		query.setFirstResult(0);
		query.setMaxResults(6);
		return query.list();
	}

}
