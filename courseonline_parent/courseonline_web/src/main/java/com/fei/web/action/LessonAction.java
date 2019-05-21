package com.fei.web.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.fei.dao.IChooseDao;
import com.fei.dao.ILessonDao;
import com.fei.domain.Lesson;
import com.fei.domain.LessonScore;
import com.fei.domain.Materia;
import com.fei.domain.Notice;
import com.fei.domain.Studentinfo;
import com.fei.domain.Studentlesson;
import com.fei.domain.Vedio;
import com.fei.service.IChooseService;
import com.fei.service.ILessonScoreService;
import com.fei.service.ILessonService;
import com.fei.service.IMateriaService;
import com.fei.service.INoticeService;
import com.fei.service.IStudentService;
import com.fei.service.IVedioService;
import com.fei.utils.FrontPageBean;
import com.fei.web.action.base.BaseAction;
import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class LessonAction extends BaseAction<Lesson>{

	@Autowired
	private ILessonService lessonService;
	

	/**
	 * 分页查询显示列表
	 * @throws IOException 
	 */
	public String pageQuery(){
		DetachedCriteria dc = pageBean.getDetachedCriteria();
		lessonService.pageQuery(pageBean);
		this.java2Json(pageBean, new String[]{"currentPage","detachedCriteria","pageSize"});
		return NONE;
	}
	
	
	public String editInfo(){
		Lesson lesson = lessonService.findById(model.getCid());
		lesson.setCjj(model.getCjj());
		lesson.setCname(model.getCname());
		lesson.setCount(model.getCount());
		//SimpleDateFormat sf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//lesson.setCtime(sf.format(new Date()));
		lesson.setCtime(model.getCtime());
		lesson.setCstate(model.getCstate());
		lesson.setCtype(model.getCtype());
		lessonService.update(lesson);
		return LIST;
	}
	
	
	private String ids;
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	private File upload;
	private String uploadFileName;//真实的文件名
	private String uploadContentType;
	
	public File getUpload() {
		return upload;
	}


	public void setUpload(File upload) {
		this.upload = upload;
	}


	public String getUploadFileName() {
		return uploadFileName;
	}


	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}


	public String getUploadContentType() {
		return uploadContentType;
	}


	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}


	/**
	 * 增加
	 * @return
	 * @throws IOException 
	 */
	public String add() throws IOException{
		
		String[] split = uploadFileName.split("\\.");
		String courseName = split[0];
		String courseType = split[1];
		String imagepath="D:\\work2bishe\\workspace\\courseonline_parent\\courseonline_web\\src\\main\\webapp\\uploadimage";
        //判断路径是否存在,不存在创建  
          File imagedir = new File(imagepath);  
          if (!imagedir.exists()) {  
          	imagedir.mkdirs();  
          }
         String imageurl = imagedir+"\\"+uploadFileName;
         File dirflag_1 = new File(imageurl);
         if( !dirflag_1.exists()){
 			FileUtils.moveFile(upload,new File(imagedir,uploadFileName));//剪切文件,推荐使用,无备份文件    
// 			model.setUrl(imageurl);
// 			model.setImagefilename(courseName);
 			lessonService.save(model);
 			System.out.println(model.getCid());
 			System.out.println(model.getCid());
 			System.out.println(model.getCid());
 			System.out.println(model.getCid());
 			System.out.println(model.getCid());
 			lessonService.insertAll(model.getCid(),imageurl,courseName,uploadFileName);
 		}
 		else{
 			this.addActionError("文件或者图片已存在！");
				return LIST; 
 		}
		
		
		return LIST;
	}

	/**
	 * 删除
	 * @return
	 */
	public String deleteBatch(){
		
		lessonService.deleteBatch(ids);
		return LIST;
	}
	
	public String listajax(){
		List<Lesson> list = lessonService.findListNotDelete();
		this.java2Json(list, new String[]{});
		return NONE;
	}
///////////////////////////////////////////////////////////////////////////////////////////////////
	
	private Integer currentPage;
	
	private Integer pageSize;

	public String frontlist() throws UnsupportedEncodingException{
		DetachedCriteria dc= DetachedCriteria.forClass(Lesson.class);
		ServletActionContext.getRequest().setCharacterEncoding("utf-8");
		String ctype = (String) ServletActionContext.getRequest().getAttribute("ctype");
		String cid = (String) ServletActionContext.getRequest().getAttribute("cid");
		System.out.println(ctype);
		if(StringUtils.isNotBlank(ctype)){
			dc.add(Restrictions.eq("ctype", ctype));
		}
		if(StringUtils.isNotBlank(cid)){
			dc.add(Restrictions.eq("cid", cid));
		}
		FrontPageBean pb = lessonService.getPagebean(dc,currentPage,pageSize);
		ActionContext.getContext().put("pageBean", pb);
		return "frontlist";
	}

	@Autowired
	private IVedioService vedioService;
	@Autowired
	private INoticeService noticeService;
	@Autowired
	private IMateriaService materiaService;
	@Autowired
	private IChooseService chooseService;
	@Autowired
	private IStudentService studentService;
	
	public String frontlist1() throws UnsupportedEncodingException{
		DetachedCriteria dc= DetachedCriteria.forClass(Lesson.class);
		ServletActionContext.getRequest().setCharacterEncoding("utf-8");
		String cid = (String) ServletActionContext.getRequest().getAttribute("cid");
		if(StringUtils.isNotBlank(cid)){
			dc.add(Restrictions.eq("cid", cid));
		}
		FrontPageBean pb = lessonService.getPagebean(dc,currentPage,pageSize);
		List<Vedio> vedio = vedioService.findAll(cid);
		List<Notice> notice = noticeService.findByCid(cid);
		List<Lesson> list = lessonService.findAll(cid);
		ActionContext.getContext().put("vedio", vedio);
		ActionContext.getContext().put("notice", notice);
		ActionContext.getContext().put("listlesson", list);
		ActionContext.getContext().put("pageBean", pb);
		return "frontlist1";
	}
	
	
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
/////////////////////////////////////////////////////////////////////////////////////////////
	
	public String getType(){
		List<Lesson> list = lessonService.findListNotDelete();
		this.java2Json(list, new String[]{});
		return NONE;
	}
	
	
	private String studentId;
	
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	
	
	@Autowired
	private ILessonScoreService lessonscoreService;
	public String frontlist2() throws UnsupportedEncodingException{
		DetachedCriteria dc= DetachedCriteria.forClass(Lesson.class);
		ServletActionContext.getRequest().setCharacterEncoding("utf-8");
		String cid = (String) ServletActionContext.getRequest().getAttribute("cid");

		System.out.println(studentId+"xuesheng "+cid);
			String str = UUID.randomUUID().toString().replace("-","");
	        String slid = str.substring(0, 16);
			chooseService.save(slid,studentId,cid);
			
			if(StringUtils.isNotBlank(cid)){
				dc.add(Restrictions.eq("cid", cid));
			}
			FrontPageBean pb = lessonService.getPagebean2(dc,currentPage,pageSize);
			List<Vedio> vedio = vedioService.findAll(cid);
			List<Notice> notice = noticeService.findByCid(cid);
			List<Lesson> list = lessonService.findAll(cid);
			List<Materia> materia = materiaService.findAll(cid);
			List<Studentlesson> student = chooseService.findStudentByCid(cid);
			List<Studentinfo> newstudent = null;
			for (Studentlesson studentlesson : student) {
				newstudent = studentService.findNewById(studentlesson.getStudentId());
			}
			List<LessonScore> lessonScore = lessonscoreService.findAll(cid);
			ActionContext.getContext().put("lessonScore", lessonScore);
			ActionContext.getContext().put("newstudent", newstudent);
			
			ActionContext.getContext().put("vedio", vedio);
			ActionContext.getContext().put("notice", notice);
			ActionContext.getContext().put("listlesson", list);
			ActionContext.getContext().put("materia", materia);
			ActionContext.getContext().put("pageBean", pb);
			return "frontlist2";
	}
	
	@Autowired
	private IChooseDao iChooseDao;
	@Autowired
	private ILessonDao iLessonDao;
	
	public String fronthome(){
		//String sid = (String) ServletActionContext.getRequest().getAttribute("sid");
		//准备成功页面数据的显示
		List<Studentlesson>  list= iChooseDao.findBySid(studentId);
		List<Lesson> lesson =null;
		for (Studentlesson studentlesson : list) {
			lesson = iLessonDao.findByid(studentlesson.getLessonId());
		}
		ActionContext.getContext().put("homelesson", lesson);
		return "fronthome";
	}
	
	
	
	public String findPieByType(){
		
		List<Object> list = lessonService.findPieByType();
		this.java2Json(list, new String[]{});
		return NONE;
	}
	
	public String findConlumnByType(){
		List<Object> list = lessonService.findConlumnByType();
		this.java2Json(list, new String[]{});
		System.out.println(list);
		return NONE;
	}
}
