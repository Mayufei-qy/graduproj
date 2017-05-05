package com.mashirong.domain;

import java.math.BigDecimal;

public class Dish {
    private Integer dishid;

    private Integer shopid;

    private String dishname;

    private BigDecimal dishprice;

    private BigDecimal saleprice;

    private String dishdesc;

    private String dishimage;

    private Integer salsenum;

    public Integer getDishid() {
        return dishid;
    }

    public void setDishid(Integer dishid) {
        this.dishid = dishid;
    }

    public Integer getShopid() {
        return shopid;
    }

    public void setShopid(Integer shopid) {
        this.shopid = shopid;
    }

    public String getDishname() {
        return dishname;
    }

    public void setDishname(String dishname) {
        this.dishname = dishname == null ? null : dishname.trim();
    }

    public BigDecimal getDishprice() {
        return dishprice;
    }

    public void setDishprice(BigDecimal dishprice) {
        this.dishprice = dishprice;
    }

    public BigDecimal getSaleprice() {
        return saleprice;
    }

    public void setSaleprice(BigDecimal saleprice) {
        this.saleprice = saleprice;
    }

    public String getDishdesc() {
        return dishdesc;
    }

    public void setDishdesc(String dishdesc) {
        this.dishdesc = dishdesc == null ? null : dishdesc.trim();
    }

    public String getDishimage() {
        return dishimage;
    }

    public void setDishimage(String dishimage) {
        this.dishimage = dishimage == null ? null : dishimage.trim();
    }

    public Integer getSalsenum() {
        return salsenum;
    }

    public void setSalsenum(Integer salsenum) {
        this.salsenum = salsenum;
    }

	@Override
	public String toString() {
		return "Dish [dishid=" + dishid + ", shopid=" + shopid + ", dishname=" + dishname + ", dishprice=" + dishprice
				+ ", saleprice=" + saleprice + ", dishdesc=" + dishdesc + ", dishimage=" + dishimage + ", salsenum="
				+ salsenum + "]";
	}
}