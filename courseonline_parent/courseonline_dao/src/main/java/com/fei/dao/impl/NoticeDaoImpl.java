package com.fei.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.fei.dao.INoticeDao;
import com.fei.dao.base.impl.BaseDaoImpl;
import com.fei.domain.Notice;
import com.fei.domain.Vedio;
import com.fei.utils.PageBean;
@Repository
public class NoticeDaoImpl extends BaseDaoImpl<Notice> implements INoticeDao {

	@Override
	public List<Notice> findAllNotice(String cid) {
		String hql="FROM Notice n WHERE n.ncid=?";		
		return (List<Notice>) this.getHibernateTemplate().find(hql, cid);
	}



}
