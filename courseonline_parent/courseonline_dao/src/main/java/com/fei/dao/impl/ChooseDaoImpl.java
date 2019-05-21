package com.fei.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.fei.dao.IChooseDao;
import com.fei.dao.base.impl.BaseDaoImpl;
import com.fei.domain.Lesson;
import com.fei.domain.Studentlesson;
import com.fei.utils.PageBean;
@Repository
public class ChooseDaoImpl extends BaseDaoImpl<Studentlesson> implements IChooseDao {

	@SuppressWarnings("all")
	public Integer findByCid(final String cid) {
		return getHibernateTemplate().execute(new HibernateCallback() {
			String sql = "select count(lesson_id) from studentlesson where lesson_id =?";
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0,cid);
				Object uniqueResult = query.uniqueResult();
				return Integer.parseInt(uniqueResult.toString());
				
			}
		});
	}

	@SuppressWarnings("all")
	public void save(final String slid, final String studentId, final String cid) {
		getHibernateTemplate().execute(new HibernateCallback() {
			String sql = "insert into studentlesson (slid,student_id,lesson_id) values(?,?,?)";
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0,slid);
				query.setParameter(1,studentId);
				query.setParameter(2,cid);
				query.executeUpdate();
				return null;
				
			}
		});
		
	}

	@Override
	public List find(String studentId, String cid) {
		String hql = "FROM Studentlesson sl where sl.studentId=? and sl.lessonId=?";
		return  this.getHibernateTemplate().find(hql, studentId,cid);
	}

	@Override
	public List<Studentlesson> findStudentByCid(String cid) {
		String hql = "FROM Studentlesson sl where sl.lessonId=?";
		return  (List<Studentlesson>) this.getHibernateTemplate().find(hql,cid);
	}

	@Override
	public List<Studentlesson> findBySid(String id) {
		String hql = "FROM Studentlesson sl where sl.studentId=?";
		return  (List<Studentlesson>) this.getHibernateTemplate().find(hql,id);
	}



//	@SuppressWarnings("all")
//	public void saveorupdate(String studentId, String cid) {
//		return getHibernateTemplate().execute(new HibernateCallback() {
//			String sql = "select count(lesson_id) from studentlesson where lesson_id =?";
//			@Override
//			public Object doInHibernate(Session session) throws HibernateException {
//				SQLQuery query = session.createSQLQuery(sql);
//				query.setParameter(0,cid);
//				Object uniqueResult = query.uniqueResult();
//				return Integer.parseInt(uniqueResult.toString());
//				
//			}
//		});
//	}


}
