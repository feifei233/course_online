package com.fei.domain;

/**
 * Studentlesson entity. @author MyEclipse Persistence Tools
 */

public class Studentlesson implements java.io.Serializable {

	// Fields

	private String slid;
	private String studentId;
	private String lessonId;

	// Constructors

	/** default constructor */
	public Studentlesson() {
	}

	/** full constructor */
	public Studentlesson(String studentId, String lessonId) {
		this.studentId = studentId;
		this.lessonId = lessonId;
	}

	// Property accessors

	public String getSlid() {
		return this.slid;
	}

	public void setSlid(String slid) {
		this.slid = slid;
	}

	public String getStudentId() {
		return this.studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getLessonId() {
		return this.lessonId;
	}

	public void setLessonId(String lessonId) {
		this.lessonId = lessonId;
	}

}