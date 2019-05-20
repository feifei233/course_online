package com.fei.web.interceptor;

import com.fei.domain.User;
import com.fei.utils.CommonUtils;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class CourseLoginInterceptor extends MethodFilterInterceptor{

	/**
	 * 登录拦截器
	 */
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		User user = CommonUtils.getLoginUser();
		if(user == null){
			//没有登录，跳转到登录页面
			return "login";
		}
		//放行
		return invocation.invoke();
	}

}
