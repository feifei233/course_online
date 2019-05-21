package com.fei.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fei.domain.Studentlesson;
import com.fei.service.IChooseService;
import com.fei.web.action.base.BaseAction;
@Controller
@Scope("prototype")
public class ChooseAction extends BaseAction<Studentlesson>{
	@Autowired
	private IChooseService chooseService;
	
	public String pageQuery(){
		chooseService.pageQuery(pageBean);
		this.java2Json(pageBean, 
				new String[]{"currentPage","detachedCriteria","pageSize"});
		return NONE;
	}
}
