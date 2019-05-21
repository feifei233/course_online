package com.fei.dao;

import java.util.List;

import com.fei.dao.base.IBaseDao;
import com.fei.domain.Lesson;
import com.fei.domain.Vedio;

public interface IVedioDao extends IBaseDao<Vedio>{

	List<Vedio> findFileByFileName(String vname);

	String findByIds(String ids);

	String findNameByid(String ids);

	Integer findByCid(String cid);

	List<Vedio> findAllVedio(String cid);

}
