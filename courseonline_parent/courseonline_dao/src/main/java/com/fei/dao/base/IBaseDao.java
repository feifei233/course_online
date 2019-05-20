package com.fei.dao.base;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.fei.utils.PageBean;

/**
 * 持久层通用接口
 * @author huihui
 *
 * @param <T>
 */
public interface IBaseDao<T> {
    public void save(T entity);
	public void delete(T entity);
	public void update(T entity);
	public void saveOrUpdate(T entity);
	public T findById(Serializable id);
	public List<T> findAll();
	public List<T> findByCriteria(DetachedCriteria detachedCriteria);
	public void executeUpdate(String queryname,Object...objects);
	public void pageQuery(PageBean pageBean);
}
