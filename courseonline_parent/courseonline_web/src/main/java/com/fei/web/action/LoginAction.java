package com.fei.web.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fei.dao.IChooseDao;
import com.fei.dao.ILessonDao;
import com.fei.domain.Lesson;
import com.fei.domain.Studentinfo;
import com.fei.domain.Studentlesson;
import com.fei.domain.Teacher;
import com.fei.service.IStudentService;
import com.fei.service.ITeacherService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class LoginAction extends ActionSupport implements SessionAware{

	private Map<String, Object> session;
	
	private String id; // 接受用户编号
	private String password; // 接受用户密码

	
	@Autowired
	private IStudentService studentService;
	
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}



	@Autowired
	private IChooseDao iChooseDao;
	@Autowired
	private ILessonDao iLessonDao;
	/**
	 * 登录
	 */
	public String frontlogin(){
	
		
			if(studentService.allowLogin(id, password)){
				Studentinfo studentInfo = studentService.findById(id);
				session.put("studentInfo", studentInfo);
				
				//准备成功页面数据的显示
				List<Studentlesson>  list= iChooseDao.findBySid(id);
				List<Lesson> lesson =null;
				for (Studentlesson studentlesson : list) {
					lesson = iLessonDao.findByid(studentlesson.getLessonId());
				}
				ActionContext.getContext().put("homelesson", lesson);
				
				return "studentSuccess";
			} else {
				this.addActionError("该学生编号不存在，或者密码不正确!");
				return INPUT;
			}
		
	}
	/**
	 * 注销登陆
	 * @return
	 */
	public String logout(){
		ServletActionContext.getRequest().getSession().invalidate();
		return "frontlogin";
	}
	
	
}
