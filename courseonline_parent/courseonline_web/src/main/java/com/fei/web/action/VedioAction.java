package com.fei.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;



import org.apache.commons.io.FileUtils;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import com.fei.domain.Vedio;

import com.fei.service.IVedioService;
import com.fei.utils.NewFileUtils;
import com.fei.web.action.base.BaseAction;
import com.opensymphony.xwork2.ActionContext;


@Controller
@Scope("prototype")
public class VedioAction extends BaseAction<Vedio>{
	
	@Autowired
	private IVedioService vedioService;
	
	private File upload;
	private String uploadFileName;//真实的文件名
	private String uploadContentType;
	
	
	public String add() throws IOException{
	 
            //我们需要做的就是提供一个服务器的存放地址即可  
            //String realPath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload");  
			
			
		
			String[] split = uploadFileName.split("\\.");
			String courseName = split[0];
			String courseType = split[1];
			List<Vedio> vedio = vedioService.findFileByFileName(courseName);
			if(courseName.length()>30){
				this.addActionError("文件名太长，不能超过30位");
				return "listerror"; 
			}else{
			if(vedio.size()==0){
				String realPath="D:\\work2bishe\\workspace\\courseonline_parent\\courseonline_web\\src\\main\\webapp\\vedio";
				//判断路径是否存在,不存在创建  
	            File dir = new File(realPath);  
	            if (!dir.exists()) {  
	                dir.mkdirs();  
	            }
	            
	    
	            
	            //第一个参数是文件 ,第二个参数是文件在服务器中的位置,fileUtils 是org.apache.commons.io.FileUtils提供好的现成的方法  
	            //FileUtils.copyFile(upload,new File(dir,uploadFileName));//copy文件,服务器中有备份文件  
	            
	 
	            //String str = UUID.randomUUID().toString().replace("-","");
	            //String courseId = str.substring(0, 16);
	            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	    		String vtime = df.format(new Date());
	    		String url = dir+"\\"+uploadFileName;
	    		File dirflag = new File(url);
	    		model.setVurl(url);
	    		model.setVtime(vtime);
	    		model.setVfilename(courseName);
	    		if(!dirflag.exists()){
	    			FileUtils.moveFile(upload,new File(dir,uploadFileName));//剪切文件,推荐使用,无备份文件 
	    			vedioService.save(model);
	    		}
	    		else{
	    			this.addActionError("文件已存在！");
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
		vedioService.pageQuery(pageBean);
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
	
	
	//下载文件
	public InputStream getInputStream() throws IOException
    {

		String str = vedioService.findByIds(ids);
		String filename=vedioService.findNameByid(ids);
		System.out.println(str);
		System.out.println(filename);
		String filetype =  str.substring(str.length()-3, str.length());
		System.out.println(filetype);
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
	        	 String str = vedioService.findByIds(ids);
	        	 String filename=vedioService.findNameByid(ids);
	        	 String filetype =  str.substring(str.length()-3, str.length());
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
	 		Vedio vedio = vedioService.findById(model.getVid());
	 		vedio.setVcid(model.getVcid());
	 		vedio.setVname(model.getVname());
	 		vedio.setVtime(model.getVtime());
	 		vedio.setVurl(model.getVurl());
	 		vedio.setVfilename(model.getVfilename());
	 		vedioService.update(vedio);
	 		return LIST;
	 }

	   
	 /*
	  * 批量删除  
	  */
	  public String deleteBatch(){
		  
		  vedioService.deleteBatch(ids);
		  return LIST;
		  
	  }

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
	 
	  
	  
	////////////////////////////////////////////////////////////////////////////////////
	
	public String frontlistajax(){
		
		String cid = ServletActionContext.getRequest().getParameter("cid");
		System.out.println(cid);
		List<Vedio> vedio = vedioService.findByCid(cid);
		this.java2Json(vedio, new String[]{});
		return NONE;
	}

public String frontlist(){
		
		String cid = ServletActionContext.getRequest().getParameter("cid");
		System.out.println(cid);
		List<Vedio> vedio = vedioService.findAll(cid);
		System.out.println(vedio.get(0).getVfilename());
		ActionContext.getContext().put("vedio", vedio);
		return "frontlist";
	}
	
}
