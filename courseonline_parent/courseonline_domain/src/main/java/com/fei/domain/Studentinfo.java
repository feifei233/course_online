package com.fei.domain;

import java.util.HashSet;
import java.util.Set;


/**
 * Studentinfo entity. @author MyEclipse Persistence Tools
 */

public class Studentinfo  implements java.io.Serializable {


    // Fields    

     private String studentId;
     private Teacher teacher;
     private String name;
     private String sex;
     private String password = "123456";
     private String profession;
     private String birthday;
     private String address;
     private String tel;
     private String email;
     private Set studentsPostses = new HashSet(0);
     
     private Integer result;
     private String sclass;

    // Constructors

    /** default constructor */
    public Studentinfo() {
    }

	/** minimal constructor */
    public Studentinfo(String studentId) {
        this.studentId = studentId;
    }
    
    /** full constructor */
    public Studentinfo(String studentId, Teacher teacher, String name, String sex, String password, String profession, String birthday, String address, String tel,String email,Set studentsPostses
    		,Integer result,String sclass) {
        this.studentId = studentId;
        this.teacher = teacher;
        this.name = name;
        this.sex = sex;
        this.password = password;
        this.profession = profession;
        this.birthday = birthday;
        this.address = address;
        this.tel = tel;
        this.email = email;
        this.studentsPostses = studentsPostses;
        this.result = result;
        this.sclass = sclass;
    }

   
    // Property accessors

    public String getStudentId() {
        return this.studentId;
    }
    
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public Teacher getTeacher() {
        return this.teacher;
    }
    
    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return this.sex;
    }
    
    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfession() {
        return this.profession;
    }
    
    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getBirthday() {
        return this.birthday;
    }
    
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return this.tel;
    }
    
    public void setTel(String tel) {
        this.tel = tel;
    }

    
    
    public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set getStudentsPostses() {
        return this.studentsPostses;
    }
    
    public void setStudentsPostses(Set studentsPostses) {
        this.studentsPostses = studentsPostses;
    }

	

	public Integer getResult() {
		return result;
	}

	public void setResult(Integer result) {
		this.result = result;
	}

	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}
   








}