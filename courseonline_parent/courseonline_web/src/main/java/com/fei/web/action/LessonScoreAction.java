package com.fei.web.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fei.domain.LessonScore;
import com.fei.domain.Notice;
import com.fei.domain.Vedio;
import com.fei.service.ILessonScoreService;
import com.fei.utils.FrontPageBean;
import com.fei.web.action.base.BaseAction;
import com.opensymphony.xwork2.ActionContext;


@Controller
@Scope("prototype")
public class LessonScoreAction extends BaseAction<LessonScore>{
	@Autowired
	private ILessonScoreService lessonscoreService;
	
	public String frontlist1() throws UnsupportedEncodingException{
		DetachedCriteria dc= DetachedCriteria.forClass(LessonScore.class);
		ServletActionContext.getRequest().setCharacterEncoding("utf-8");
		String cid = (String) ServletActionContext.getRequest().getAttribute("cid");
		if(StringUtils.isNotBlank(cid)){
			dc.add(Restrictions.eq("cid", cid));
		}
		List<LessonScore> lessonScore = lessonscoreService.findAll(cid);
		ActionContext.getContext().put("lessonScore", lessonScore);
		return "frontlist2";
	}
	
	public String frontadd(){
		
		lessonscoreService.save(model);
		
		return "frontadd";
	}
	
}
