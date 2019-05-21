package com.fei.service.impl;

import java.io.File;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fei.dao.IMateriaDao;
import com.fei.domain.Materia;
import com.fei.service.IMateriaService;
import com.fei.utils.PageBean;
@Service
@Transactional
public class MateriaServiceImpl implements IMateriaService {

	@Autowired
	private IMateriaDao materiaDao;
	
	@Override
	public List<Materia> findFileByFileName(String vname) {
		return materiaDao.findFileByFileName(vname);
	}

	@Override
	public void save(Materia model) {
		materiaDao.save(model);

	}

	@Override
	public void pageQuery(PageBean pageBean) {
		materiaDao.pageQuery(pageBean);

	}

	@Override
	public String findByIds(String ids) {
		return materiaDao.findByIds(ids);
	}

	@Override
	public String findNameByid(String ids) {
		return materiaDao.findNameByid(ids);
	}


	@Override
	public Materia findById(String vid) {
		return materiaDao.findById(vid);
	}

	@Override
	public void deleteBatch(String ids) {
		if(StringUtils.isNotBlank(ids)){
			String[] MateriaIds = ids.split(",");
			for (String id : MateriaIds) {
				String url = materiaDao.findByIds(id);
				File csvFile = new File(url);
		        if (csvFile.exists()) {
		            csvFile.delete();
		        }
		        materiaDao.executeUpdate("materia.delete",id);
				
				
			}
		}

	}

	@Override
	public void update(Materia materia) {
		materiaDao.update(materia);
		
	}

	@Override
	public List<Materia> findAll(String cid) {
		
		return materiaDao.findAllByCid(cid);
	}


}
