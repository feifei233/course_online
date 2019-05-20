package com.fei.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.fei.domain.Studentinfo;
import com.fei.domain.Teacher;
import com.fei.service.IStudentService;
import com.fei.utils.FileUtils;
import com.fei.web.action.base.BaseAction;

@Controller
@Scope("prototype")
public class StudentAction extends BaseAction<Studentinfo>{

	@Autowired
	private IStudentService studentService;
	
	private File studentFile;
	
	
	public void setStudentFile(File studentFile) {
		this.studentFile = studentFile;
	}

	/**
	 * 分页查询显示列表
	 * @throws IOException 
	 */
	public String pageQuery(){
		DetachedCriteria dc = pageBean.getDetachedCriteria();
		//动态添加过滤条件
		String studentId= model.getStudentId();
		if(StringUtils.isNotBlank(studentId)){
			//添加过滤条件，根据地址关键字模糊查询
			dc.add(Restrictions.like("studentId", "%"+studentId+"%"));
		}
		
		String name= model.getName();
		if(StringUtils.isNotBlank(name)){
			//添加过滤条件，根据地址关键字模糊查询
			dc.add(Restrictions.like("name", "%"+name+"%"));
		}
		
		String profession= model.getProfession();
		if(StringUtils.isNotBlank(profession)){
			//添加过滤条件，根据地址关键字模糊查询
			dc.add(Restrictions.like("profession", "%"+profession+"%"));
		}
		
		
		Teacher teacher = model.getTeacher();
		if(teacher != null){
			String teachername = teacher.getTeachername();
			dc.createAlias("teacher", "t");
			if(StringUtils.isNotBlank(teachername)){
				dc.add(Restrictions.like("t.name", "%"+teachername+"%"));
			}
		}
		studentService.pageQuery(pageBean);
		this.java2Json(pageBean, new String[]{"currentPage","detachedCriteria","pageSize",
						"studentsPostses","studentinfos","courseinfos","postses","notices"});
		return NONE;
	}
	
	
	public String editInfo(){
		Studentinfo student = studentService.findById(model.getStudentId());
		student.setName(model.getName());
		student.setSex(model.getSex());
		student.setPassword(model.getPassword());
		student.setProfession(model.getProfession());
		student.setBirthday(model.getBirthday());
		student.setAddress(model.getAddress());
		student.setTel(model.getTel());
		student.setEmail(model.getEmail());
		
		studentService.update(student);
		return LIST;
	}
	
	
	public String importXls() throws FileNotFoundException, IOException{
		List<Studentinfo> studentList = new ArrayList<Studentinfo>();
		//使用POI解析Excel文件
		HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(studentFile));
		//根据名称获得指定Sheet对象
		HSSFSheet hssfSheet = workbook.getSheetAt(0);
		for (Row row : hssfSheet) {
			int rowNum = row.getRowNum();
			if(rowNum == 0){
				continue;
			}
			String studentId = row.getCell(0).getStringCellValue();
			String name = row.getCell(1).getStringCellValue();
			String sex = row.getCell(2).getStringCellValue();
			String profession = row.getCell(3).getStringCellValue();
			String  password = row.getCell(4).getStringCellValue();
			String address = row.getCell(5).getStringCellValue();
			String tel = row.getCell(6).getStringCellValue();
			String email = row.getCell(7).getStringCellValue();
			//包装一个区域对象
			Studentinfo student = new Studentinfo(studentId,null, name,sex,password,profession,null,address,tel,email,null);
			studentList.add(student);
			
		}
		//批量保存
		studentService.saveBatch(studentList);
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
	 * 增加
	 * @return
	 */
	public String add(){
		
		studentService.save(model);
		
		return LIST;
	}

	/**
	 * 删除某个教师
	 * @return
	 */
	public String deleteBatch(){
		
		studentService.deleteBatch(ids);
		return LIST;
	}
	
	/**
	 * 导出数据到excel表格
	 */
	public String  exportXls() throws IOException{
		
		//第一步：查询所有的分区数据
		List<Studentinfo> list = studentService.findAll();
		
		//第二步：使用POI将数据写到Excel文件中
		//在内存中创建一个Excel文件
		HSSFWorkbook workbook = new HSSFWorkbook();
		//创建一个标签页
		HSSFSheet sheet = workbook.createSheet("分区数据");
		//创建标题行
		HSSFRow headRow = sheet.createRow(0);
		headRow.createCell(0).setCellValue("学生学号");
		headRow.createCell(1).setCellValue("学生姓名");
		headRow.createCell(2).setCellValue("性别");
		headRow.createCell(3).setCellValue("专业");
		headRow.createCell(4).setCellValue("出生日期");
		headRow.createCell(5).setCellValue("家庭住址");
		headRow.createCell(6).setCellValue("联系方式");
		headRow.createCell(7).setCellValue("邮箱地址");
		//headRow.createCell(8).setCellValue("授课教师");
		
		for (Studentinfo student : list) {
			HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
			dataRow.createCell(0).setCellValue(student.getStudentId());
			dataRow.createCell(1).setCellValue(student.getName());
			dataRow.createCell(2).setCellValue(student.getSex());
			dataRow.createCell(3).setCellValue(student.getProfession());
			dataRow.createCell(4).setCellValue(student.getBirthday());
			dataRow.createCell(5).setCellValue(student.getAddress());
			dataRow.createCell(6).setCellValue(student.getTel());
			dataRow.createCell(7).setCellValue(student.getEmail());
			//dataRow.createCell(8).setCellValue(student.getTeacher().getName());
		}
		
		//第三步：使用输出流进行文件下载（一个流、两个头）
		
		String filename = "学生信息.xls";
		String contentType = ServletActionContext.getServletContext().getMimeType(filename);
		ServletOutputStream out = ServletActionContext.getResponse().getOutputStream();
		ServletActionContext.getResponse().setContentType(contentType);
		
		//获取客户端浏览器类型
		String agent = ServletActionContext.getRequest().getHeader("User-Agent");
		filename = FileUtils.encodeDownloadFilename(filename, agent);
		ServletActionContext.getResponse().setHeader("content-disposition", "attachment;filename="+filename);
		workbook.write(out);
		
		return NONE;
	}
	
}
