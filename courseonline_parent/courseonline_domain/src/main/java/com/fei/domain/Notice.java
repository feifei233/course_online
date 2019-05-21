package com.fei.domain;

/**
 * Notice entity. @author MyEclipse Persistence Tools
 */

public class Notice implements java.io.Serializable {

	// Fields

	private String nid;
	private String ncontent;
	private String ntime;
	private String ncid;

	// Constructors

	/** default constructor */
	public Notice() {
	}

	/** full constructor */
	public Notice(String ncontent, String ntime, String ncid) {
		this.ncontent = ncontent;
		this.ntime = ntime;
		this.ncid = ncid;
	}

	// Property accessors

	public String getNid() {
		return this.nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public String getNcontent() {
		return this.ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNtime() {
		return this.ntime;
	}

	public void setNtime(String ntime) {
		this.ntime = ntime;
	}

	public String getNcid() {
		return this.ncid;
	}

	public void setNcid(String ncid) {
		this.ncid = ncid;
	}

}