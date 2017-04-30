package com.mashirong.domain;

public class Shop {
    private Integer shopid;

    private Integer userid;

    private String shopname;

    private String ownername;

    private String idcnum;

    private String licensenum;

    private Integer maindishid;

    private String shopaddress;

    private String shopphonenum;

    public Integer getShopid() {
        return shopid;
    }

    public void setShopid(Integer shopid) {
        this.shopid = shopid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname == null ? null : shopname.trim();
    }

    public String getOwnername() {
        return ownername;
    }

    public void setOwnername(String ownername) {
        this.ownername = ownername == null ? null : ownername.trim();
    }

    public String getIdcnum() {
        return idcnum;
    }

    public void setIdcnum(String idcnum) {
        this.idcnum = idcnum == null ? null : idcnum.trim();
    }

    public String getLicensenum() {
        return licensenum;
    }

    public void setLicensenum(String licensenum) {
        this.licensenum = licensenum == null ? null : licensenum.trim();
    }

    public Integer getMaindishid() {
        return maindishid;
    }

    public void setMaindishid(Integer maindishid) {
        this.maindishid = maindishid;
    }

    public String getShopaddress() {
        return shopaddress;
    }

    public void setShopaddress(String shopaddress) {
        this.shopaddress = shopaddress == null ? null : shopaddress.trim();
    }

    public String getShopphonenum() {
        return shopphonenum;
    }

    public void setShopphonenum(String shopphonenum) {
        this.shopphonenum = shopphonenum == null ? null : shopphonenum.trim();
    }
}