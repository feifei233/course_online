package com.fei.domain;

/**
 * Vedio entity. @author MyEclipse Persistence Tools
 */

public class Vedio implements java.io.Serializable {

	// Fields

	private String vid;
	private String vname;
	private String vurl;
	private String vtime;
	private String vcid;
	private String vfilename;
	// Constructors

	/** default constructor */
	public Vedio() {
	}

	/** full constructor */
	public Vedio(String vname, String vurl, String vtime, String vcid,String vfilename) {
		this.vname = vname;
		this.vurl = vurl;
		this.vtime = vtime;
		this.vcid = vcid;
		this.vfilename=vfilename;
	}

	// Property accessors

	public String getVid() {
		return this.vid;
	}

	public void setVid(String vid) {
		this.vid = vid;
	}

	public String getVname() {
		return this.vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public String getVurl() {
		return this.vurl;
	}

	public void setVurl(String vurl) {
		this.vurl = vurl;
	}

	public String getVtime() {
		return this.vtime;
	}

	public void setVtime(String vtime) {
		this.vtime = vtime;
	}

	public String getVcid() {
		return this.vcid;
	}

	public void setVcid(String vcid) {
		this.vcid = vcid;
	}

	public String getVfilename() {
		return vfilename;
	}

	public void setVfilename(String vfilename) {
		this.vfilename = vfilename;
	}

}