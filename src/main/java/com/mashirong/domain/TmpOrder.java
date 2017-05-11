package com.mashirong.domain;

import java.util.List;

public class TmpOrder {
	private Integer orderid;
	private Integer shopid;
	private String flowNum;
	private String orderTime;
	private String userName;
	private String userPhonenum;
	private int packingBox;
	private float totalPrice;
	private String orderNote;
	private List<OrderCon> dishList;
	
	public int getPackingBox() {
		return packingBox;
	}
	public void setPackingBox(int packingBox) {
		this.packingBox = packingBox;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getFlowNum() {
		return flowNum;
	}
	public void setFlowNum(String flowNum) {
		this.flowNum = flowNum;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public List<OrderCon> getDishList() {
		return dishList;
	}
	public void setDishList(List<OrderCon> dishList) {
		this.dishList = dishList;
	}
	public Integer getShopid() {
		return shopid;
	}
	public void setShopid(Integer shopid) {
		this.shopid = shopid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhonenum() {
		return userPhonenum;
	}
	public void setUserPhonenum(String userPhonenum) {
		this.userPhonenum = userPhonenum;
	}
	public String getOrderNote() {
		return orderNote;
	}
	public void setOrderNote(String orderNote) {
		this.orderNote = orderNote;
	}
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
}
