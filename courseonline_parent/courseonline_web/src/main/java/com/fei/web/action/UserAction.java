package com.fei.web.action;

import java.io.IOException;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fei.domain.User;
import com.fei.service.IUserService;
import com.fei.utils.CommonUtils;
import com.fei.web.action.base.BaseAction;


@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User>{

	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	@Autowired
	private IUserService userService;
	
	/**
	 * 用户登录
	 * @return
	 */
	public String login(){
		
		String validatecode = (String) ServletActionContext.getRequest().getSession().getAttribute("key");
		if(StringUtils.isNotBlank(checkcode) && checkcode.equals(validatecode)){
			//验证码正确
			User user = userService.login(model);
			if(user!=null){
				//登录成功
				ServletActionContext.getRequest().getSession().setAttribute("loginUser", user);
				return HOME;
			}
			else{
				//登录失败
				//用户名或者密码错误
				this.addActionError("用户名或者密码输入错误！");
				return LOGIN;
			}
		}else{
			//验证码错误
			this.addActionError("验证码输入错误！");
			return LOGIN;
		}
		
		
	}

	/**
	 * 注销登陆
	 * @return
	 */
	public String logout(){
		ServletActionContext.getRequest().getSession().invalidate();
		return LOGIN;
	}
	
	/**
	 * 修改密码
	 */
	public String editPwd() throws IOException{
		String f = "1";
		User user = CommonUtils.getLoginUser();
		try {
			userService.editPassword(user.getId(),model.getPassword());
		} catch (Exception e) {
			f = "0";
			e.printStackTrace();
		}
		
		ServletActionContext.getResponse().setContentType("text/html;character=uft-8");
		ServletActionContext.getResponse().getWriter().print(f);
		return NONE;
		
	}
}
