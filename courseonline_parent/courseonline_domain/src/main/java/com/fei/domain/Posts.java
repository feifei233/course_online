package com.fei.domain;

import java.util.HashSet;
import java.util.Set;


/**
 * Posts entity. @author MyEclipse Persistence Tools
 */

public class Posts  implements java.io.Serializable {


    // Fields    

     private String postsId;
     private Teacher teacher;
     private String subject;
     private String content;
     private String createtime;
     private Integer broser;
     private Set studentsPostses = new HashSet(0);


    // Constructors

    /** default constructor */
    public Posts() {
    }

	/** minimal constructor */
    public Posts(String postsId, String subject) {
        this.postsId = postsId;
        this.subject = subject;
    }
    
    /** full constructor */
    public Posts(String postsId, Teacher teacher, String subject, String content, String createtime, Integer broser, Set studentsPostses) {
        this.postsId = postsId;
        this.teacher = teacher;
        this.subject = subject;
        this.content = content;
        this.createtime = createtime;
        this.broser = broser;
        this.studentsPostses = studentsPostses;
    }

   
    // Property accessors

    public String getPostsId() {
        return this.postsId;
    }
    
    public void setPostsId(String postsId) {
        this.postsId = postsId;
    }

    public Teacher getTeacher() {
        return this.teacher;
    }
    
    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getSubject() {
        return this.subject;
    }
    
    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatetime() {
        return this.createtime;
    }
    
    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public Integer getBroser() {
        return this.broser;
    }
    
    public void setBroser(Integer broser) {
        this.broser = broser;
    }

    public Set getStudentsPostses() {
        return this.studentsPostses;
    }
    
    public void setStudentsPostses(Set studentsPostses) {
        this.studentsPostses = studentsPostses;
    }
   








}