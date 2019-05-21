package com.fei.dao;

import java.util.List;

import com.fei.dao.base.IBaseDao;
import com.fei.domain.Notice;

public interface INoticeDao extends IBaseDao<Notice>{

	List<Notice> findAllNotice(String cid);

}
