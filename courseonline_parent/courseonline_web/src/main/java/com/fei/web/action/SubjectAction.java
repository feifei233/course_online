package com.fei.web.action;

import java.io.IOException;


import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import com.fei.domain.Subject;
import com.fei.service.ISubjectService;
import com.fei.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class SubjectAction extends BaseAction<Subject>{
	
	@Autowired
	private ISubjectService subjectService;
	
	
	/**
	 * 分页查询显示列表
	 * @throws IOException 
	 */
	public String pageQuery(){
		DetachedCriteria dc = pageBean.getDetachedCriteria();
		subjectService.pageQuery(pageBean);
		this.java2Json(pageBean, new String[]{"currentPage","detachedCriteria","pageSize"});
		return NONE;
	}
	/**
	 * 修改
	 * @return
	 */
	public String editInfo(){
		Subject subject = subjectService.findById(model.getSubjectId());
		subject.setSubjectTitle(model.getSubjectTitle());
		subject.setSubjectOptionA(model.getSubjectOptionA());
		subject.setSubjectOptionB(model.getSubjectOptionB());
		subject.setSubjectOptionC(model.getSubjectOptionC());
		subject.setSubjectOptionD(model.getSubjectOptionD());
		subject.setSubjectAnswer(model.getSubjectAnswer());
		subject.setSubjectParse(model.getSubjectParse());
		subjectService.update(subject);
		return LIST;
	}
	

	private String ids;
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	/**
	 * 增加
	 * @return
	 */
	public String add(){
		
		subjectService.save(model);
		
		return LIST;
	}

	/**
	 * 删除某个教师
	 * @return
	 */
	public String deleteBatch(){
		
		subjectService.deleteBatch(ids);
		return LIST;
	}
}
