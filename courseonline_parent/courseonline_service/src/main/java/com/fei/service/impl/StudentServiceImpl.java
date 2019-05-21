package com.fei.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fei.dao.IStudentDao;
import com.fei.domain.Studentinfo;
import com.fei.service.IStudentService;
import com.fei.utils.MD5Utils;
import com.fei.utils.PageBean;

@Service
@Transactional
public class StudentServiceImpl implements IStudentService {
	@Autowired
	private IStudentDao studentDao;
	
	/**
	 * 分页查询
	 */
	public void pageQuery(PageBean pageBean) {
		studentDao.pageQuery(pageBean);

	}

	/**
	 * 导入数据
	 */
	public void saveBatch(List<Studentinfo> studentList) {
		for (Studentinfo studentinfo : studentList) {
			studentDao.saveOrUpdate(studentinfo);
		}

	}

	/**
	 * 逻辑删除某个学生
	 */
	public void deleteBatch(String ids) {
		if(StringUtils.isNotBlank(ids)){
			String[] studentIds = ids.split(",");
			for (String id : studentIds) {
				studentDao.executeUpdate("student.delete",id);
			}
		}
		
	}

	/**
	 * 通过id查找学生
	 */
	public Studentinfo findById(String studentId) {
		return studentDao.findById(studentId);
	}

	/**
	 * 修改
	 */
	public void update(Studentinfo student) {
		studentDao.update(student);
		
	}

	/**
	 * 添加
	 */
	public void save(Studentinfo model) {
		studentDao.save(model);
		
	}

	/**
	 * 导出数据查询对象
	 */
	public List<Studentinfo> findAll() {
		return studentDao.findAll();
	}

	@Override
	public boolean allowLogin(String id, String password) {
		String pw = MD5Utils.md5(password);
		
		Studentinfo student =  studentDao.findStudentByNameAndPassword(id,pw);
		
		if(student!=null){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Studentinfo> findNewById(String studentId) {
		
		return studentDao.findNewById(studentId);
	}



}
