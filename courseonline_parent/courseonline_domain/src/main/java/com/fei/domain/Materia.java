package com.fei.domain;

/**
 * Materia entity. @author MyEclipse Persistence Tools
 */

public class Materia implements java.io.Serializable {

	// Fields

	private String mid;
	private String mname;
	private String murl;
	private String mtime;
	private String mcid;
	private String mfilename;
	// Constructors

	/** default constructor */
	public Materia() {
	}

	/** full constructor */
	public Materia(String mname, String murl, String mtime, String mcid,String mfilename) {
		this.mname = mname;
		this.murl = murl;
		this.mtime = mtime;
		this.mcid = mcid;
		this.mfilename = mfilename;
	}

	// Property accessors

	public String getMid() {
		return this.mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMname() {
		return this.mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMurl() {
		return this.murl;
	}

	public void setMurl(String murl) {
		this.murl = murl;
	}

	public String getMtime() {
		return this.mtime;
	}

	public void setMtime(String mtime) {
		this.mtime = mtime;
	}

	public String getMcid() {
		return this.mcid;
	}

	public void setMcid(String mcid) {
		this.mcid = mcid;
	}

	public String getMfilename() {
		return mfilename;
	}

	public void setMfilename(String mfilename) {
		this.mfilename = mfilename;
	}

}