package com.fei.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fei.domain.Courseinfo;
import com.fei.domain.Studentinfo;
import com.fei.domain.Teacher;
import com.fei.domain.User;
import com.fei.service.ICourseService;
import com.fei.service.IStudentService;
import com.fei.utils.NewFileUtils;
import com.fei.web.action.base.BaseAction;
import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class CourseAction extends BaseAction<Courseinfo>{
	
	@Autowired
	private ICourseService courseService;
	
	private List<File> upload;
	private List<String> uploadFileName;//真实的文件名
	private List<String> uploadContentType;
	
	
	public String add() throws IOException{
	 
            //我们需要做的就是提供一个服务器的存放地址即可  
            //String realPath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload");  
			
			String[] split = uploadFileName.get(0).split("\\.");
			String courseName = split[0];
			String courseType = split[1];
			List<Courseinfo> course = courseService.findFileByFileName(courseName);
			if(courseName.length()>25){
				this.addActionError("文件名太长，不能超过25位");
				return "listerror"; 
			}else{
			if(course.size()==0){
				String realPath="D:\\work2bishe\\workspace\\courseonline_parent\\courseonline_web\\src\\main\\webapp\\upload";
				//判断路径是否存在,不存在创建  
	            File dir = new File(realPath);  
	            if (!dir.exists()) {  
	                dir.mkdirs();  
	            }
	            
	            String imagepath="D:\\work2bishe\\workspace\\courseonline_parent\\courseonline_web\\src\\main\\webapp\\uploadimage";
	          //判断路径是否存在,不存在创建  
	            File imagedir = new File(imagepath);  
	            if (!imagedir.exists()) {  
	            	imagedir.mkdirs();  
	            }
	            
	            //第一个参数是文件 ,第二个参数是文件在服务器中的位置,fileUtils 是org.apache.commons.io.FileUtils提供好的现成的方法  
	            //FileUtils.copyFile(upload,new File(dir,uploadFileName));//copy文件,服务器中有备份文件  
	            
	            String imageurl = imagedir+"\\"+uploadFileName.get(1);
	            String str = UUID.randomUUID().toString().replace("-","");
	            String courseId = str.substring(0, 16);
	            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	    		String courseFbrq = df.format(new Date());
	    		String url = dir+"\\"+uploadFileName.get(0);
	    		String courseopen="1";
	    		Integer courseClicksum=0;
	    		File dirflag_1 = new File(imageurl);
	    		File dirflag_2 = new File(url);
	    		
	    		if(!dirflag_1.exists() && !dirflag_2.exists()){
	    			FileUtils.moveFile(upload.get(0),new File(dir,uploadFileName.get(0)));//剪切文件,推荐使用,无备份文件 
		            FileUtils.moveFile(upload.get(1),new File(imagedir,uploadFileName.get(1)));//剪切文件,推荐使用,无备份文件 
	    			courseService.saveAll(courseId,courseName,courseType,courseFbrq,url,courseopen,courseClicksum,imageurl);
	    		}
	    		else{
	    			this.addActionError("文件或者图片已存在！");
					return "listerror"; 
	    		}
			}else{
				
	            this.addActionError("文件已存在!");
	            return "listerror"; 
			}
			}
        return LIST; 
	}
	
	public String pageQuery(){
		
		DetachedCriteria dc = pageBean.getDetachedCriteria();
		Teacher teacher = model.getTeacher();
		if(teacher != null){
			String teachername = teacher.getTeachername();
			dc.createAlias("teacher", "t");
			if(StringUtils.isNotBlank(teachername)){
				dc.add(Restrictions.like("t.name", "%"+teachername+"%"));
			}
		}
		courseService.pageQuery(pageBean);
		this.java2Json(pageBean, 
				new String[]{"currentPage","detachedCriteria","pageSize","teacher"});
		return NONE;
	}
	private String ids;

	
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	//下载文件
	public InputStream getInputStream() throws IOException
    {

		String str = courseService.findByIds(ids);
		String filename=courseService.findNameByid(ids);
		String filetype= courseService.findTypeByid(ids);
		String fileFileName1 = new String(filename.getBytes("iso-8859-1"),"utf-8");
		String fileName=fileFileName1+"."+filetype;
		ServletActionContext.getRequest().setAttribute("filename", fileName);
		File file = new File(str);
        return new FileInputStream(file);
    }
	

	/**
	 * 进行文件下载
	 * @return
	 * @throws IOException 
	 */
	public String downloadFile() throws IOException{  
		return "download";
		
	}
	//2.4:下载显示的中文名，（浏览器显示的文件名）
	     public String getDownFileName(){
	         try{
	        	 String filename=courseService.findNameByid(ids);
	     		 String filetype= courseService.findTypeByid(ids);
	     		 String fileName=filename+"."+filetype;
	           //获取客户端浏览器类型
	     		String agent = ServletActionContext.getRequest().getHeader("User-Agent");
	     		fileName = NewFileUtils.encodeDownloadFilename(fileName, agent);
		        return fileName;
	        }catch(Exception e){
	             throw new RuntimeException();
	         }
	        
	     }
	
	   public String editInfo(){
	 		Courseinfo course = courseService.findById(model.getCourseId());
	 		course.setCourseName(model.getCourseName());
	 		course.setUrl(model.getUrl());
	 		course.setCourseFbrq(model.getCourseFbrq());
	 		course.setCourseJj(model.getCourseJj());
	 		course.setCourseType(model.getCourseType());
	 		course.setCourseOpen(model.getCourseOpen());
	 		course.setCourseClicksum(model.getCourseClicksum());
	 		course.setCourseFbrq(model.getCourseFbrq());
	 		courseService.update(course);
	 		return LIST;
	 }

	   
	 /*
	  * 批量删除  
	  */
	  public String deleteBatch(){
		  
		  courseService.deleteBatch(ids);
		  return LIST;
		  
	  }
	   
	   
	  
	  private String studentId;
	  @Autowired
	  private IStudentService studentService;
	  
	  public String frontlist(){
		  
		  Studentinfo student = studentService.findById(studentId);
		  Integer teacherId = student.getTeacher().getTeacherId();
		  String type="flv";
		  Courseinfo course = courseService.findByTId(teacherId,type);
		  ActionContext.getContext().put("course", course);
		  return "frontlist";
	  }
	  
	  
	  
	  
	   
	   
	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public List<File> getUpload() {
		return upload;
	}

	public void setUpload(List<File> upload) {
		this.upload = upload;
	}

	public List<String> getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public List<String> getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	
	
	
}
