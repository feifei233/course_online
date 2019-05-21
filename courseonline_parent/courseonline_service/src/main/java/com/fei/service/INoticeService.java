package com.fei.service;

import java.util.List;

import com.fei.domain.Notice;
import com.fei.utils.PageBean;

public interface INoticeService {

	public void save(Notice model);

	public void pageQuery(PageBean pageBean);

	public void deleteBatch(String ids);

	public Notice findById(String nid);

	public void update(Notice notice);

	public List<Notice> findByCid(String cid);

}
