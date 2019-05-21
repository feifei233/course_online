package com.fei.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LessonScore {
	// Fields

	private Integer id;
	private Integer score;
	private String content;
	private String time = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
	private String cid;
	private String sname;
	
	
	// Constructors
	public LessonScore() {
		//super();
	}
	
	public LessonScore(Integer id, Integer score, String content, String  time, String cid,String sname) {
		super();
		this.id = id;
		this.score = score;
		this.content = content;
		this.time = time;
		this.cid = cid;
		this.sname = sname;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}



	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}
	
	
	

}
