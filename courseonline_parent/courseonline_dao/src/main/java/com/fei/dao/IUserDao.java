package com.fei.dao;

import com.fei.dao.base.IBaseDao;
import com.fei.domain.User;

public interface IUserDao extends IBaseDao<User> {
	public User findUserByUsernameAndPassword(String username, String password);
}
