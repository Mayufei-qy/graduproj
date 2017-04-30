package com.mashirong.domain;

import java.util.List;

public class TmpOrder {
	private String flowNum;
	private String orderTime;
	private int packingBox;
	private float totalPrice;
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
	private List<OrderCon> dishList;
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

}
