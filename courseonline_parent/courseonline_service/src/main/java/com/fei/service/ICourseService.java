package com.fei.service;

import java.util.List;

import com.fei.domain.Courseinfo;

public interface ICourseService {

	List<Courseinfo> findFileByFileName(String fileFileName);

}
