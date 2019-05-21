package com.fei.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fei.dao.INoticeDao;
import com.fei.domain.Notice;
import com.fei.service.INoticeService;
import com.fei.utils.PageBean;
@Service
@Transactional
public class NoticeServiceImpl implements INoticeService {

	@Autowired
	private INoticeDao noticeDao;
	
	@Override
	public void save(Notice model) {
		noticeDao.save(model);

	}

	@Override
	public void pageQuery(PageBean pageBean) {
		
		noticeDao.pageQuery(pageBean);
	}

	@Override
	public void deleteBatch(String ids) {
		if(StringUtils.isNotBlank(ids)){
			String[] noticeIds = ids.split(",");
			for (String id : noticeIds) {
				noticeDao.executeUpdate("notice.delete",id);
			}
		}
	}

	@Override
	public Notice findById(String nid) {
		return noticeDao.findById(nid);
	}

	@Override
	public void update(Notice notice) {
		noticeDao.update(notice);

	}

	@Override
	public List<Notice> findByCid(String cid) {
		return noticeDao.findAllNotice(cid);
	}

}
