package com.fei.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.fei.dao.ILessonDao;
import com.fei.dao.IStudentDao;
import com.fei.dao.base.impl.BaseDaoImpl;
import com.fei.domain.Lesson;
import com.fei.domain.Studentinfo;
import com.fei.domain.Teacher;
import com.fei.domain.Vedio;
import com.fei.utils.PageBean;

@Repository
public class LessonDaoImpl extends BaseDaoImpl<Lesson> implements ILessonDao {

	@SuppressWarnings("all")
	public List<Lesson> findList(final String ctype) {
		String hql = "FROM Lesson where ctype=?";
		
		Query query = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
		int b1 = (int) (Math.random()*2);
		query.setParameter(0, ctype);
		query.setFirstResult(b1);
		query.setMaxResults(3);
		return query.list();
	}

	@SuppressWarnings("all")
	public String findByCid(final String cid) {
		return this.getHibernateTemplate().execute(new HibernateCallback() {

			String sql = "select ctype from lesson where cid=?";
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, cid);
				return query.uniqueResult();
			}
		});
	}

	@Override
	public List<Lesson> findByid(String lessonId) {
		String hql = "FROM Lesson where cid=?";
		return (List<Lesson>) this.getHibernateTemplate().find(hql,lessonId);
	}

	@SuppressWarnings("all")
	public void insertAll(final String cid,final String imageurl, final String courseName, final String uploadFileName) {
		
		this.getHibernateTemplate().execute(new HibernateCallback() {
//(url,imagefilename,imagename)
			String sql = "update lesson set url=?,imagefilename=?,imagename=? where cid=?";
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, imageurl);
				query.setParameter(1, courseName);
				query.setParameter(2, uploadFileName);
				query.setParameter(3, cid);
				query.executeUpdate();
				return null;
			}
		});
		
	}

	@SuppressWarnings("all")
	public List<Object> findPieByType() {
		//SELECT ctype,SUM(count) FROM Lesson GROUP BY ctype
		
		return  this.getHibernateTemplate().execute(new HibernateCallback() {
			String sql = "SELECT ctype,SUM(count) FROM Lesson GROUP BY ctype";
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				return query.list();
			}
		});
	}

	@SuppressWarnings("all")
	public List<Object> findConlumnByType() {
		return this.getHibernateTemplate().execute(new HibernateCallback() {
			String sql = "SELECT SUM(count) FROM Lesson GROUP BY ctype";
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				return query.list();
			}
		});
	}




}
