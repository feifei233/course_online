package com.fei.dao;

import com.fei.dao.base.IBaseDao;
import com.fei.domain.Tea;


public interface ITeaDao extends IBaseDao<Tea>{

	void saveFromteacher(String string, String password);

	void updateFromteacher(String string, String password);

}
