package com.fei.domain;

import java.util.HashSet;
import java.util.Set;


/**
 * Basetype entity. @author MyEclipse Persistence Tools
 */

public class Basetype  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String type;
     private Set basedatas = new HashSet(0);


    // Constructors

    /** default constructor */
    public Basetype() {
    }

	/** minimal constructor */
    public Basetype(Integer id, String type) {
        this.id = id;
        this.type = type;
    }
    
    /** full constructor */
    public Basetype(Integer id, String type, Set basedatas) {
        this.id = id;
        this.type = type;
        this.basedatas = basedatas;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }

    public Set getBasedatas() {
        return this.basedatas;
    }
    
    public void setBasedatas(Set basedatas) {
        this.basedatas = basedatas;
    }
   








}