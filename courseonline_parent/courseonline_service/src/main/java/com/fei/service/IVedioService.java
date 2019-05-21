package com.fei.service;

import java.util.List;

import com.fei.domain.Vedio;
import com.fei.utils.PageBean;

public interface IVedioService {

	public List<Vedio> findFileByFileName(String courseName);

	public void save(Vedio model);

	public void pageQuery(PageBean pageBean);

	public String findByIds(String ids);

	public String findNameByid(String ids);

	public Vedio findById(String vid);

	public void deleteBatch(String ids);

	public void update(Vedio vedio);

	public List<Vedio> findByCid(String cid);

	public List<Vedio> findAll(String cid);


}
