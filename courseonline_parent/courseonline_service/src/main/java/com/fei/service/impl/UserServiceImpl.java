package com.fei.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fei.dao.IUserDao;
import com.fei.domain.User;
import com.fei.service.IUserService;
import com.fei.utils.MD5Utils;
@Service
@Transactional
public class UserServiceImpl implements IUserService {
	@Autowired
	private IUserDao userDao;
	/***
	 * 用户登录
	 */
	public User login(User user) {
		String password = MD5Utils.md5(user.getPassword());
		return userDao.findUserByUsernameAndPassword(user.getUsername(),password);
	}

	/**
	 * 修改密码
	 */
	public void editPassword(String id, String password) {
		//使用MD5加密密码
		password = MD5Utils.md5(password);
		userDao.executeUpdate("user.editpassword", password,id);
		
	}

}
