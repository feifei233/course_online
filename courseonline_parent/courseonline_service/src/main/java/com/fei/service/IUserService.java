package com.fei.service;

import com.fei.domain.User;

public interface IUserService {
	//用户登录
	public User login(User model);
	
	//修改密码
	public void editPassword(String id, String password);
}
