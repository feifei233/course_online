package com.fei.domain;



/**
 * Courseinfo entity. @author MyEclipse Persistence Tools
 */

public class Courseinfo  implements java.io.Serializable {


    // Fields    

     private String courseId;
     private Teacher teacher;
     private String courseJj;
     private String courseName;
     private Integer courseType;
     private String courseFbrq;
     private String url;
     private String courseOpen;
     private Integer courseClicksum;


    // Constructors

    /** default constructor */
    public Courseinfo() {
    }

	/** minimal constructor */
    public Courseinfo(String courseId, String courseName) {
        this.courseId = courseId;
        this.courseName = courseName;
    }
    
    /** full constructor */
    public Courseinfo(String courseId, Teacher teacher, String courseJj, String courseName, Integer courseType, String courseFbrq,String url,String courseOpen, Integer courseClicksum) {
        this.courseId = courseId;
        this.teacher = teacher;
        this.courseJj = courseJj;
        this.courseName = courseName;
        this.courseType = courseType;
        this.courseFbrq = courseFbrq;
        this.url = url;
        this.courseOpen = courseOpen;
        this.courseClicksum = courseClicksum;
    }

   
    // Property accessors

    public String getCourseId() {
        return this.courseId;
    }
    
    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public Teacher getTeacher() {
        return this.teacher;
    }
    
    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getCourseJj() {
        return this.courseJj;
    }
    
    public void setCourseJj(String courseJj) {
        this.courseJj = courseJj;
    }

    public String getCourseName() {
        return this.courseName;
    }
    
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Integer getCourseType() {
        return this.courseType;
    }
    
    public void setCourseType(Integer courseType) {
        this.courseType = courseType;
    }

    public String getCourseFbrq() {
        return this.courseFbrq;
    }
    
    public void setCourseFbrq(String courseFbrq) {
        this.courseFbrq = courseFbrq;
    }

    
    public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCourseOpen() {
		return courseOpen;
	}

	public void setCourseOpen(String courseOpen) {
		this.courseOpen = courseOpen;
	}

	public Integer getCourseClicksum() {
        return this.courseClicksum;
    }
    
    public void setCourseClicksum(Integer courseClicksum) {
        this.courseClicksum = courseClicksum;
    }
   


}