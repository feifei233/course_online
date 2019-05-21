package com.fei.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fei.domain.Notice;
import com.fei.domain.Teacher;
import com.fei.domain.Vedio;
import com.fei.service.INoticeService;
import com.fei.service.IStudentService;
import com.fei.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class NoticeAction extends BaseAction<Notice>{
	@Autowired
	private INoticeService noticeService;
	
	
	public String add() throws IOException{

		noticeService.save(model);
	
		return LIST;
	}
	
	public String pageQuery() throws IOException{
		noticeService.pageQuery(pageBean);
		this.java2Json(pageBean, 
				new String[]{"currentPage","detachedCriteria","pageSize"});
		return NONE;
	}
	
	private String ids;
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}


	public String deleteBatch(){
		
		noticeService.deleteBatch(ids);
		return LIST;
	}
	
	/**
	 * 修改教师信息
	 */
	public String editInfo(){
		
		Notice notice = noticeService.findById(model.getNid());
		notice.setNcid(model.getNcid());
		notice.setNcontent(model.getNcontent());
		notice.setNtime(model.getNtime());
		noticeService.update(notice);
		return LIST;
	}
	
	
	////////////////////////////////////////////////////////////////////////////////////
		
	public String frontlistajax(){
	
		String cid = ServletActionContext.getRequest().getParameter("cid");
		List<Notice> notice = noticeService.findByCid(cid);
		this.java2Json(notice, new String[]{});
		return NONE;
	}
}
