package com.fei.domain;



/**
 * Basedata entity. @author MyEclipse Persistence Tools
 */

public class Basedata  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Basetype basetype;
     private String info;


    // Constructors

    /** default constructor */
    public Basedata() {
    }

    
    /** full constructor */
    public Basedata(Integer id, Basetype basetype, String info) {
        this.id = id;
        this.basetype = basetype;
        this.info = info;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Basetype getBasetype() {
        return this.basetype;
    }
    
    public void setBasetype(Basetype basetype) {
        this.basetype = basetype;
    }

    public String getInfo() {
        return this.info;
    }
    
    public void setInfo(String info) {
        this.info = info;
    }
   








}