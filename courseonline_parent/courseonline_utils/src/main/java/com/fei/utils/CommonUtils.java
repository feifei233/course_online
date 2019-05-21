package com.fei.utils;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.fei.domain.Studentinfo;
import com.fei.domain.User;

public class CommonUtils {

	
		//获取session对象
		public static HttpSession getSession(){
			return ServletActionContext.getRequest().getSession();
		}
		//获取登录用户对象
		public static User getLoginUser(){
			return (User) getSession().getAttribute("loginUser");
		}
		
		//获取登录用户对象
		public static Studentinfo getLoginStudent(){
			return (Studentinfo) getSession().getAttribute("studentInfo");
		}
}
