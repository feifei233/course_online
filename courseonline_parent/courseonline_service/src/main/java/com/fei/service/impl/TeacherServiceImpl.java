package com.fei.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fei.dao.ITeaDao;
import com.fei.dao.ITeacherDao;
import com.fei.domain.Teacher;
import com.fei.service.ITeacherService;
import com.fei.utils.MD5Utils;
import com.fei.utils.PageBean;

@Service
@Transactional
public class TeacherServiceImpl implements ITeacherService{

	@Autowired
	private ITeacherDao teacherDao;
	@Autowired
	private ITeaDao teaDao;
	
	
	public void save(Teacher model) {
		
		String password =MD5Utils.md5(model.getPassword());
		model.setPassword(password);
		teacherDao.save(model);
		teaDao.saveFromteacher(Integer.toString(model.getTeacherId()),model.getPassword());
	}

	/**
	 * 分页查询
	 */
	public void pageQuery(PageBean pageBean) {
		teacherDao.pageQuery(pageBean);
		
	}

	/**
	 * 
	 * 实现对教师的逻辑删除
	 */
	public void deleteBatch(String ids) {
		if(StringUtils.isNotBlank(ids)){
			String[] teacherIds = ids.split(",");
			for (String id : teacherIds) {
				teacherDao.executeUpdate("teacher.delete",id);
			}
		}
	}

	/**
	 * 通过id查找对象
	 */
	public Teacher findById(String teacherId) {
		return teacherDao.findById(teacherId);
	}

	/**
	 * 修改
	 */
	public void update(Teacher teacher) {
		teacherDao.update(teacher);
		teaDao.updateFromteacher(Integer.toString(teacher.getTeacherId()),teacher.getPassword());
	}

	/**
	 * 密码初始化
	 */
	public void initPassword(String ids) {
		if(StringUtils.isNotBlank(ids)){
			String[] teacherIds = ids.split(",");
			for (String id : teacherIds) {
				teacherDao.executeUpdate("teacher.initPassword",id);
			}
		}
		
	}

	/**
	 * 还原
	 */
	public void restoreBatch(String ids) {
		if(StringUtils.isNotBlank(ids)){
			String[] teacherIds = ids.split(",");
			for (String id : teacherIds) {
				teacherDao.executeUpdate("teacher.restore",id);
			}
		}
	}


	/**
	 * 查询未删除的老师
	 */
	public List<Teacher> findListNotDelete() {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Teacher.class);
		//添加过滤条件，deltag等于0
		detachedCriteria.add(Restrictions.eq("deltag", "0"));
		//detachedCriteria.add(Restrictions.ne("deltag", "1"));
		return teacherDao.findByCriteria(detachedCriteria);
	}

	@Override
	public Teacher findById(Integer id) {
		return teacherDao.findById(id);
	}

	@Override
	public boolean allowLogin(Integer teacher_id, String password) {
		String pw = MD5Utils.md5(password);
		Teacher teacher = teacherDao.findStudentByNameAndPassword(teacher_id,pw);
		if(teacher==null){
			return false;
		}else{
			return true;
		}
	}




}
