package com.fei.domain;



/**
 * StudentsPosts entity. @author MyEclipse Persistence Tools
 */

public class StudentsPosts  implements java.io.Serializable {


    // Fields    

     private Integer stuPostsId;
     private Studentinfo studentinfo;
     private Posts posts;


    // Constructors

    /** default constructor */
    public StudentsPosts() {
    }

	/** minimal constructor */
    public StudentsPosts(Integer stuPostsId) {
        this.stuPostsId = stuPostsId;
    }
    
    /** full constructor */
    public StudentsPosts(Integer stuPostsId, Studentinfo studentinfo, Posts posts) {
        this.stuPostsId = stuPostsId;
        this.studentinfo = studentinfo;
        this.posts = posts;
    }

   
    // Property accessors

    public Integer getStuPostsId() {
        return this.stuPostsId;
    }
    
    public void setStuPostsId(Integer stuPostsId) {
        this.stuPostsId = stuPostsId;
    }

    public Studentinfo getStudentinfo() {
        return this.studentinfo;
    }
    
    public void setStudentinfo(Studentinfo studentinfo) {
        this.studentinfo = studentinfo;
    }

    public Posts getPosts() {
        return this.posts;
    }
    
    public void setPosts(Posts posts) {
        this.posts = posts;
    }
   








}