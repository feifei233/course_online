package com.fei.dao;

import java.util.List;

import com.fei.dao.base.IBaseDao;
import com.fei.domain.Materia;

public interface IMateriaDao extends IBaseDao<Materia>{

	public List<Materia> findFileByFileName(String vname);

	public String findByIds(String ids);

	public String findNameByid(String ids);

	public List<Materia> findAllByCid(String cid);

}
