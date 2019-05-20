package com.fei.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fei.domain.Teacher;
import com.fei.service.ITeacherService;
import com.fei.utils.MD5Utils;
import com.fei.utils.PageBean;
import com.fei.web.action.base.BaseAction;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class TeacherAction extends BaseAction<Teacher>{

	
	@Autowired
	public ITeacherService teacherService;
	
	/**
	 * 增加
	 * @return
	 * @throws IOException 
	 */
	public String add() throws IOException{
		
		
		teacherService.save(model);
	
		return LIST;
	}

	/**
	 * 分页查询显示列表
	 * @throws IOException 
	 */
	public String pageQuery() throws IOException{
		teacherService.pageQuery(pageBean);
		this.java2Json(pageBean, 
				new String[]{"currentPage","detachedCriteria","pageSize","courseinfos","studentinfos","postses","notices"});
		return NONE;
	}
	
	
	private String ids;
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}


	/**
	 * 删除某个教师
	 * @return
	 */
	public String deleteBatch(){
		
		teacherService.deleteBatch(ids);
		return LIST;
	}
	
	/**
	 * 还原某个教室
	 */
	public String restoreBatch(){
		
		teacherService.restoreBatch(ids);
		return LIST;
	}
	
	
	/**
	 * 修改教师信息
	 */
	public String edit(){
		
		Teacher teacher = teacherService.findById(model.getTeacherId());
		teacher.setTeachername(model.getTeachername());
		teacher.setTel(model.getTel());
		teacher.setPassword(model.getPassword());
		teacherService.update(teacher);
		return LIST;
	}
	
	/**
	 * 教师密码初始化
	 */
	public String initPassword(){
		
		teacherService.initPassword(ids);
		
		return LIST;
	}
	

	
	public String listajax(){
		List<Teacher> list = teacherService.findListNotDelete();
		this.java2Json(list, new String[]{"courseinfos","studentinfos","postses","notices"});
		return NONE;
	}

	
	
	
}
