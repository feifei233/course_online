package com.fei.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.fei.dao.ICouseDao;
import com.fei.dao.base.impl.BaseDaoImpl;
import com.fei.domain.Courseinfo;
@Repository
public class CourseDaoImpl extends BaseDaoImpl<Courseinfo> implements ICouseDao{

	/**
	 * 通过文件名查询对象
	 */
	public List<Courseinfo> findFileByFileName(String fileFileName) {
		String hql="FROM Courseinfo c WHERE c.courseName=?";		
		return (List<Courseinfo>) this.getHibernateTemplate().find(hql, fileFileName);
	}

	@SuppressWarnings("all")
	public void saveAll(final String courseId,final String courseName,final String courseType, final String courseFbrq, final String url, final String courseopen, final Integer courseClicksum,final String imageurl) {
		this.getHibernateTemplate().execute(new HibernateCallback() {

			String sql = "replace into bc_courseinfo(course_id,course_name,course_type,course_fbrq,url,course_open,course_clicksum,imageurl) values(?,?,?,?,?,?,?,?)";
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, courseId);
				query.setParameter(1, courseName);
				query.setParameter(2, courseType);
				query.setParameter(3, courseFbrq);
				query.setParameter(4, url);
				query.setParameter(5, courseopen);
				query.setParameter(6, courseClicksum);
				query.setParameter(7, imageurl);
				query.executeUpdate();
				return null;
			}
		
		
		
		});
		
	}

	@SuppressWarnings("all")
	public String findUrlByName(final String uploadFileName) {
		return this.getHibernateTemplate().execute(new HibernateCallback() {

			String sql = "select url from bc_courseinfo where course_name=?";
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, uploadFileName);
				query.executeUpdate();
				return null;
			}
		});

	}

	@SuppressWarnings("all")
	public String findUrlByid(final String id) {
		return this.getHibernateTemplate().execute(new HibernateCallback() {

			String sql = "select url from bc_courseinfo where course_id=?";
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, id);
				return query.uniqueResult();
			}
		});
	}

	@SuppressWarnings("all")
	public String findNameByid(final String ids) {
		return this.getHibernateTemplate().execute(new HibernateCallback() {

			String sql = "select course_name from bc_courseinfo where course_id=?";
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, ids);
				return query.uniqueResult();
			}
		});
	}

	@SuppressWarnings("all")
	public String findTypeByid(final String ids) {
		return this.getHibernateTemplate().execute(new HibernateCallback() {

			String sql = "select course_type from bc_courseinfo where course_id=?";
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, ids);
				return query.uniqueResult();
			}
		});
	}

	@SuppressWarnings("all")
	public Courseinfo findByTId(final Integer teacherId, final String type) {
		return this.getHibernateTemplate().execute(new HibernateCallback() {

			String sql = "select * from bc_courseinfo where teacher_id=? and type=?";
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, teacherId);
				query.setParameter(1, type);
				return query.list();
			}
		});
	}

}
