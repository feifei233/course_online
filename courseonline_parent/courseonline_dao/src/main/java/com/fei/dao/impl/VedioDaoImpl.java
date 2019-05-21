package com.fei.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.fei.dao.IVedioDao;
import com.fei.dao.base.impl.BaseDaoImpl;
import com.fei.domain.Courseinfo;
import com.fei.domain.Vedio;
import com.fei.utils.PageBean;
@Repository
public class VedioDaoImpl extends BaseDaoImpl<Vedio> implements IVedioDao {

	@Override
	public List<Vedio> findFileByFileName(String vfilename) {
		String hql="FROM Vedio v WHERE v.vfilename=?";		
		return (List<Vedio>) this.getHibernateTemplate().find(hql, vfilename);
	}

	@SuppressWarnings("all")
	public String findByIds(final String ids) {
		return this.getHibernateTemplate().execute(new HibernateCallback() {

			String sql = "select vurl from vedio where vid=?";
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

			String sql = "select vfilename from vedio where vid=?";
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, ids);
				return query.uniqueResult();
			}
		});
	}

	@SuppressWarnings("all")
	public Integer findByCid(final String cid) {
		return getHibernateTemplate().execute(new HibernateCallback() {
			String sql = "select count(vcid) from vedio where vcid =?";
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0,cid);
				Object uniqueResult = query.uniqueResult();
				return Integer.parseInt(uniqueResult.toString());
			}
		});
	}
/////////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<Vedio> findAllVedio(String cid) {
		String hql="FROM Vedio v WHERE v.vcid=?";		
		return (List<Vedio>) this.getHibernateTemplate().find(hql, cid);
	}

	
}
