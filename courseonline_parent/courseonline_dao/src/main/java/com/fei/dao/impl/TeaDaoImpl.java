package com.fei.dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.fei.dao.ITeaDao;
import com.fei.dao.base.impl.BaseDaoImpl;
import com.fei.domain.Tea;

@Repository
public class TeaDaoImpl extends BaseDaoImpl<Tea> implements ITeaDao{

	@SuppressWarnings("all")
	public void saveFromteacher(final String teacherID, final String password) {
		this.getHibernateTemplate().execute(new HibernateCallback() {

			String sql = "insert into teacher(teacherID,password) values(?,?)";
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, teacherID);
				query.setParameter(1, password);
				query.executeUpdate();
				return null;
			}
		});
		
	}

	@SuppressWarnings("all")
	public void updateFromteacher(final String teacherID, final String password) {
		this.getHibernateTemplate().execute(new HibernateCallback() {

			String sql = "update teacher set teacherID=?,password=? where teacherID=?";
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, teacherID);
				query.setParameter(1, password);
				query.setParameter(2, teacherID);
				query.executeUpdate();
				return null;
			}
		});
	}

}
