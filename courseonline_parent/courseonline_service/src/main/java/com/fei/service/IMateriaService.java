package com.fei.service;

import java.util.List;

import com.fei.domain.Materia;
import com.fei.utils.PageBean;

public interface IMateriaService {

	public List<Materia> findFileByFileName(String courseName);

	public void save(Materia model);

	public void pageQuery(PageBean pageBean);

	public String findByIds(String ids);

	public String findNameByid(String ids);

	public void deleteBatch(String ids);

	public Materia findById(String mid);

	public void update(Materia materia);

	public List<Materia> findAll(String cid);

}
