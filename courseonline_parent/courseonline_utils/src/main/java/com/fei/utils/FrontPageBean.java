package com.fei.utils;

import java.util.List;

public class FrontPageBean {
	private Integer currentPage;
	private Integer pageSize;
	private Integer totalPage;
	private Integer totalCount;
	private List list;
	public FrontPageBean(Integer currentPage,Integer totalCount,Integer pageSize) {
		this.currentPage = currentPage;
		this.totalCount  = totalCount;
		this.pageSize = pageSize;
		
		if(this.currentPage == null){
			this.currentPage = 1;
		}
		
		if(this.pageSize == null){
			this.pageSize = 15;
		}
		
		this.totalPage = (this.totalCount+this.pageSize-1)/this.pageSize;
		
		if(this.currentPage < 1){
			this.currentPage = 1;
		}
		
		if(this.currentPage > this.totalPage){
			this.currentPage = this.totalPage ;
		}	
	}
	
	public Integer getStart(){
		return (this.currentPage-1)*this.pageSize;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	
	
}
