package com.fei.service.impl;

import java.io.File;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fei.dao.IVedioDao;
import com.fei.domain.Vedio;
import com.fei.service.IVedioService;
import com.fei.utils.PageBean;
@Service
@Transactional
public class VedioServiceImpl implements IVedioService {

	@Autowired
	private IVedioDao vedioDao;
	
	@Override
	public List<Vedio> findFileByFileName(String vname) {
		return vedioDao.findFileByFileName(vname);
	}

	@Override
	public void save(Vedio model) {
		vedioDao.save(model);

	}

	@Override
	public void pageQuery(PageBean pageBean) {
		vedioDao.pageQuery(pageBean);

	}

	@Override
	public String findByIds(String ids) {
		return vedioDao.findByIds(ids);
	}

	@Override
	public String findNameByid(String ids) {
		return vedioDao.findNameByid(ids);
	}


	@Override
	public Vedio findById(String vid) {
		return vedioDao.findById(vid);
	}

	@Override
	public void deleteBatch(String ids) {
		if(StringUtils.isNotBlank(ids)){
			String[] vedioIds = ids.split(",");
			for (String id : vedioIds) {
				String url = vedioDao.findByIds(id);
				File csvFile = new File(url);
		        if (csvFile.exists()) {
		            csvFile.delete();
		        }
				vedioDao.executeUpdate("vedio.delete",id);
				
				
			}
		}

	}

	@Override
	public void update(Vedio vedio) {
		vedioDao.update(vedio);
		
	}

	@Override
	public List<Vedio> findByCid(String cid) {
		return vedioDao.findAllVedio(cid);
	}

	@Override
	public List<Vedio> findAll(String cid) {
		return vedioDao.findAllVedio(cid);
	}


}
