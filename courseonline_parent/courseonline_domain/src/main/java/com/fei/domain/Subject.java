package com.fei.domain;

/**
 * Subject entity. @author MyEclipse Persistence Tools
 */

public class Subject implements java.io.Serializable {

	// Fields

	private Integer subjectId;
	private String subjectTitle;
	private String subjectOptionA;
	private String subjectOptionB;
	private String subjectOptionC;
	private String subjectOptionD;
	private String subjectAnswer;
	private String subjectParse;

	// Constructors

	/** default constructor */
	public Subject() {
	}

	/** full constructor */
	public Subject(String subjectTitle, String subjectOptionA,
			String subjectOptionB, String subjectOptionC,
			String subjectOptionD, String subjectAnswer, String subjectParse) {
		this.subjectTitle = subjectTitle;
		this.subjectOptionA = subjectOptionA;
		this.subjectOptionB = subjectOptionB;
		this.subjectOptionC = subjectOptionC;
		this.subjectOptionD = subjectOptionD;
		this.subjectAnswer = subjectAnswer;
		this.subjectParse = subjectParse;
	}

	// Property accessors

	public Integer getSubjectId() {
		return this.subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectTitle() {
		return this.subjectTitle;
	}

	public void setSubjectTitle(String subjectTitle) {
		this.subjectTitle = subjectTitle;
	}

	public String getSubjectOptionA() {
		return this.subjectOptionA;
	}

	public void setSubjectOptionA(String subjectOptionA) {
		this.subjectOptionA = subjectOptionA;
	}

	public String getSubjectOptionB() {
		return this.subjectOptionB;
	}

	public void setSubjectOptionB(String subjectOptionB) {
		this.subjectOptionB = subjectOptionB;
	}

	public String getSubjectOptionC() {
		return this.subjectOptionC;
	}

	public void setSubjectOptionC(String subjectOptionC) {
		this.subjectOptionC = subjectOptionC;
	}

	public String getSubjectOptionD() {
		return this.subjectOptionD;
	}

	public void setSubjectOptionD(String subjectOptionD) {
		this.subjectOptionD = subjectOptionD;
	}

	public String getSubjectAnswer() {
		return this.subjectAnswer;
	}

	public void setSubjectAnswer(String subjectAnswer) {
		this.subjectAnswer = subjectAnswer;
	}

	public String getSubjectParse() {
		return this.subjectParse;
	}

	public void setSubjectParse(String subjectParse) {
		this.subjectParse = subjectParse;
	}

	@Override
	public String toString() {
		return "Subject [subjectAnswer=" + subjectAnswer + ", subjectId=" + subjectId + ", subjectOptionA="
				+ subjectOptionA + ", subjectOptionB=" + subjectOptionB + ", subjectOptionC=" + subjectOptionC
				+ ", subjectOptionD=" + subjectOptionD + ", subjectParse=" + subjectParse + ", subjectTitle="
				+ subjectTitle + "]";
	}
}