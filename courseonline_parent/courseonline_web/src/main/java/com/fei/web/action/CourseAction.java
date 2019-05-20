package com.fei.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fei.domain.Courseinfo;
import com.fei.service.ICourseService;
import com.fei.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class CourseAction extends BaseAction<Courseinfo>{
	
	@Autowired
	private ICourseService courseService;
	
	private File file;
	private String fileFileName;//真实的文件名
	private String fileContentType;
	
	public String upload() throws IOException{
		//查询数据
		HttpServletRequest request = ServletActionContext.getRequest();
		//获取当前上传的文件的名称查找数据库是否有记录
		List<Courseinfo> listFile = courseService.findFileByFileName(fileFileName); 
		
		// 得到保存上传文件的目录的真实路径  
        File dir = new File("E:\\upload");  
        // 如果该目录不存在，就创建  
        if (!dir.exists()) {  
            dir.mkdirs();  
        }  
        int pos = fileFileName.lastIndexOf(".");  
        fileContentType = fileFileName.substring(pos + 1);//文件后缀名  
        
        
        InputStream is = new FileInputStream(file);  
        OutputStream os = new FileOutputStream(new File(dir, fileFileName));  
        byte[] buf = new byte[1024];  
        int len = -1;  
        while ((len = is.read(buf)) != -1) {  
            os.write(buf, 0, len);  
        }  
        is.close();  
        os.close();   
        //文件路径+文件名称
        model.setUrl( "E:\\upload\\"+fileFileName);
        
        
        int a = listFile.size();
        if(a == 0){
        	 if (resourceService.save(uploadFileName, fileDir,contentType, author, description, uploadDate)) {  
                 result = "{suc:1, msg:’上传成功!’}";  
             } else {  
                 result = "{suc:0, msg:’上传失败!’}";  
             }   

     		//调service里的方法
     		List<Resource> listResource = resourceService.listResource();  
            System.out.println("listResource.size>>"+listResource.size()); 
     		//把值存到request作用域里，传到页面上
     		request.setAttribute("listResource", listResource);  
     		//把值存到request作用域里，传到页面上 
     		//request.setAttribute("listFile", listFile);  
             return SUCCESS; 
        	 
        }else{
        	return ERROR; 
        }
	}
	
}
