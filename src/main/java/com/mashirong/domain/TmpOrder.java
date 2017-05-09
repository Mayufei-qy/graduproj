package com.mashirong.domain;

import java.util.List;

public class TmpOrder {
	private Integer shopid;
	private String flowNum;
	private String orderTime;
	private int packingBox;
	private float totalPrice;
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
}
