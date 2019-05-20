package com.fei.domain;



/**
 * Advertiseing entity. @author MyEclipse Persistence Tools
 */

public class Advertiseing  implements java.io.Serializable {


    // Fields    

     private String adId;
     private String adImage;
     private String adDel;
     private String adDate;
     private String remark;


    // Constructors

    /** default constructor */
    public Advertiseing() {
    }

	/** minimal constructor */
    public Advertiseing(String adId, String adImage) {
        this.adId = adId;
        this.adImage = adImage;
    }
    
    /** full constructor */
    public Advertiseing(String adId, String adImage, String adDel, String adDate, String remark) {
        this.adId = adId;
        this.adImage = adImage;
        this.adDel = adDel;
        this.adDate = adDate;
        this.remark = remark;
    }

   
    // Property accessors

    public String getAdId() {
        return this.adId;
    }
    
    public void setAdId(String adId) {
        this.adId = adId;
    }

    public String getAdImage() {
        return this.adImage;
    }
    
    public void setAdImage(String adImage) {
        this.adImage = adImage;
    }

    public String getAdDel() {
        return this.adDel;
    }
    
    public void setAdDel(String adDel) {
        this.adDel = adDel;
    }

    public String getAdDate() {
        return this.adDate;
    }
    
    public void setAdDate(String adDate) {
        this.adDate = adDate;
    }

    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
   








}