package com.fei.utils;

import java.util.List;

/**
 * @author 路小瑞 E-mail:luxr123@sjtu.edu.cn
 * @version 创建时间：2013-3-7 下午08:20:27 版权所有,翻版必究
 * @param <T>
 */
public class PageResult<T> {

	private Page page; // 分页信息
	private List<T> list; // 记录信息

	public PageResult(Page page, List list) {
		this.page = page;
		this.list = list;
	}

	public PageResult() {
		super();
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

}
