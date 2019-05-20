package com.fei.domain;



/**
 * Notice entity. @author MyEclipse Persistence Tools
 */

public class Notice  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Teacher teacher;
     private String title;
     private String content;
     private String date;


    // Constructors

    /** default constructor */
    public Notice() {
    }

	/** minimal constructor */
    public Notice(Integer id, String title) {
        this.id = id;
        this.title = title;
    }
    
    /** full constructor */
    public Notice(Integer id, Teacher teacher, String title, String content, String date) {
        this.id = id;
        this.teacher = teacher;
        this.title = title;
        this.content = content;
        this.date = date;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Teacher getTeacher() {
        return this.teacher;
    }
    
    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return this.date;
    }
    
    public void setDate(String date) {
        this.date = date;
    }
   








}