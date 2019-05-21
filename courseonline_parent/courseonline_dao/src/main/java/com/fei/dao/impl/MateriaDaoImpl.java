package com.fei.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.fei.dao.IMateriaDao;
import com.fei.dao.IVedioDao;
import com.fei.dao.base.impl.BaseDaoImpl;
import com.fei.domain.Courseinfo;
import com.fei.domain.Materia;
import com.fei.domain.Notice;
import com.fei.domain.Vedio;
import com.fei.utils.PageBean;
@Repository
public class MateriaDaoImpl extends BaseDaoImpl<Materia> implements IMateriaDao {

	@Override
	public List<Materia> findFileByFileName(String mfilename) {
		String hql="FROM Materia m WHERE m.mfilename=?";		
		return (List<Materia>) this.getHibernateTemplate().find(hql, mfilename);
	}

	@SuppressWarnings("all")
	public String findByIds(final String ids) {
		return this.getHibernateTemplate().execute(new HibernateCallback() {

			String sql = "select murl from materia where mid=?";
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, ids);
				return query.uniqueResult();
			}
		});
	}


	@SuppressWarnings("all")
	public String findNameByid(final String ids) {
		return this.getHibernateTemplate().execute(new HibernateCallback() {

			String sql = "select mfilename from materia where mid=?";
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, ids);
				return query.uniqueResult();
			}
		});
	}

	@Override
	public List<Materia> findAllByCid(String cid) {
		String hql="FROM Materia m WHERE m.mcid=?";		
		return (List<Materia>) this.getHibernateTemplate().find(hql, cid);
	}

	
}
