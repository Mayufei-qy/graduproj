package com.mashirong.domain;

import javax.persistence.Transient;

public class OrderCon {
    private Integer orderconid;

    private Integer orderid;

    private Integer dishid;

    private Integer dishnum;
    
    @Transient
    private String dishName;
    
    @Transient
    private float dishPrice;

    public String getDishName() {
		return dishName;
	}

	public void setDishName(String dishName) {
		this.dishName = dishName;
	}

	public float getDishPrice() {
		return dishPrice;
	}

	public void setDishPrice(float dishPrice) {
		this.dishPrice = dishPrice;
	}

	public Integer getOrderconid() {
        return orderconid;
    }

    public void setOrderconid(Integer orderconid) {
        this.orderconid = orderconid;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getDishid() {
        return dishid;
    }

    public void setDishid(Integer dishid) {
        this.dishid = dishid;
    }

    public Integer getDishnum() {
        return dishnum;
    }

    public void setDishnum(Integer dishnum) {
        this.dishnum = dishnum;
    }

	@Override
	public String toString() {
		return "OrderCon [orderconid=" + orderconid + ", orderid=" + orderid + ", dishid=" + dishid + ", dishnum="
				+ dishnum + ", dishName=" + dishName + ", dishPrice=" + dishPrice + "]";
	}

}