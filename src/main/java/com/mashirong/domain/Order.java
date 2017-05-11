package com.mashirong.domain;

import java.util.Date;

public class Order {
    private Integer orderid;

    private Integer userid;

    private Integer shopid;

    private String flownum;

    private Date ordertime;

    private String ordernote;
    
    private Integer orderType;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getShopid() {
        return shopid;
    }

    public void setShopid(Integer shopid) {
        this.shopid = shopid;
    }

    public String getFlownum() {
        return flownum;
    }

    public void setFlownum(String flownum) {
        this.flownum = flownum == null ? null : flownum.trim();
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public String getOrdernote() {
        return ordernote;
    }

    public void setOrdernote(String ordernote) {
        this.ordernote = ordernote == null ? null : ordernote.trim();
    }

	public Integer getOrderType() {
		return orderType;
	}

	public void setOrderType(Integer orderType) {
		this.orderType = orderType;
	}

	@Override
	public String toString() {
		return "Order [orderid=" + orderid + ", userid=" + userid + ", shopid=" + shopid + ", flownum=" + flownum
				+ ", ordertime=" + ordertime + ", ordernote=" + ordernote + ", orderType=" + orderType + "]";
	}
}