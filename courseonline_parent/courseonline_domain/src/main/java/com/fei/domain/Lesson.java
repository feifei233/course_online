package com.fei.domain;

/**
 * Lesson entity. @author MyEclipse Persistence Tools
 */

public class Lesson implements java.io.Serializable {

	// Fields

	private String cid;
	private String cname;
	private String cjj;
	private Integer count =0;
	private Integer ctime;
	private String cstate = "0";
	private String ctype;
	private String url;
	private String imagefilename;
	private String imagename;
	// Constructors

	/** default constructor */
	public Lesson() {
	}

	/** full constructor */
	public Lesson(String cname, String cjj, Integer count, Integer ctime,
			String cstate,String ctype,String url,String imagefilename,String imagename) {
		this.cname = cname;
		this.cjj = cjj;
		this.count = count;
		this.ctime = ctime;
		this.cstate = cstate;
		this.ctype = ctype;
		this.url = url;
		this.imagefilename=imagefilename;
		this.imagename=imagename;
	}

	// Property accessors

	public String getCid() {
		return this.cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCjj() {
		return this.cjj;
	}

	public void setCjj(String cjj) {
		this.cjj = cjj;
	}

	public Integer getCount() {
		return this.count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getCtime() {
		return this.ctime;
	}

	public void setCtime(Integer ctime) {
		this.ctime = ctime;
	}

	public String getCstate() {
		return this.cstate;
	}

	public void setCstate(String cstate) {
		this.cstate = cstate;
	}

	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImagefilename() {
		return imagefilename;
	}

	public void setImagefilename(String imagefilename) {
		this.imagefilename = imagefilename;
	}

	public String getImagename() {
		return imagename;
	}

	public void setImagename(String imagename) {
		this.imagename = imagename;
	}

	
	
}