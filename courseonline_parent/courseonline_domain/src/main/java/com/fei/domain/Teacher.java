package com.fei.domain;

import java.util.HashSet;
import java.util.Set;


/**
 * Teacher entity. @author MyEclipse Persistence Tools
 */

public class Teacher  implements java.io.Serializable {


    // Fields    

     private Integer teacherId;
     private String teachername;
     private String tel;
     private String password = "123456";
     private String deltag = "0";
     private Set studentinfos = new HashSet(0);
     private Set courseinfos = new HashSet(0);
     private Set postses = new HashSet(0);
     private Set notices = new HashSet(0);


    // Constructors

    /** default constructor */
    public Teacher() {
    }

	/** minimal constructor 
	 * @param deltag */
    public Teacher(Integer teacherId, String name, String password) {
        this.teacherId = teacherId;
        this.teachername = teachername;
        this.password = password;
    }
    
    /** full constructor 
     * @param deltag */
    public Teacher(Integer teacherId, String teachername, String tel, String password, String deltag, Set studentinfos, Set courseinfos, Set postses, Set notices) {
        this.teacherId = teacherId;
        this.teachername = teachername;
        this.tel = tel;
        this.password = password;
        this.deltag = deltag;
        this.studentinfos = studentinfos;
        this.courseinfos = courseinfos;
        this.postses = postses;
        this.notices = notices;
    }

   
    // Property accessors

    public Integer getTeacherId() {
        return this.teacherId;
    }
    
    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }



    public String getTeachername() {
		return teachername;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}

	public String getTel() {
        return this.tel;
    }
    
    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getDeltag() {
		return deltag;
	}

	public void setDeltag(String deltag) {
		this.deltag = deltag;
	}

	public Set getStudentinfos() {
        return this.studentinfos;
    }
    
    public void setStudentinfos(Set studentinfos) {
        this.studentinfos = studentinfos;
    }

    public Set getCourseinfos() {
        return this.courseinfos;
    }
    
    public void setCourseinfos(Set courseinfos) {
        this.courseinfos = courseinfos;
    }

    public Set getPostses() {
        return this.postses;
    }
    
    public void setPostses(Set postses) {
        this.postses = postses;
    }

    public Set getNotices() {
        return this.notices;
    }
    
    public void setNotices(Set notices) {
        this.notices = notices;
    }
   








}