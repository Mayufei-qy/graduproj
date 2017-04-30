package com.mashirong.domain;

public class TmpDish {
	private int shopId;
	private int dishId;
	private float dishPrice;
	private int dishNum;
	private String dishName;
	private String orderNote;
	public String getOrderNote() {
		return orderNote;
	}
	public void setOrderNote(String orderNote) {
		this.orderNote = orderNote;
	}
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public int getDishId() {
		return dishId;
	}
	public void setDishId(int dishId) {
		this.dishId = dishId;
	}
	public float getDishPrice() {
		return dishPrice;
	}
	public void setDishPrice(float dishPrice) {
		this.dishPrice = dishPrice;
	}
	public int getDishNum() {
		return dishNum;
	}
	public void setDishNum(int dishNum) {
		this.dishNum = dishNum;
	}
	public String getDishName() {
		return dishName;
	}
	public void setDishName(String dishName) {
		this.dishName = dishName;
	}
	@Override
	public String toString() {
		return "TmpDish [shopId=" + shopId + ", dishId=" + dishId + ", dishPrice=" + dishPrice + ", dishNum=" + dishNum
				+ ", dishName=" + dishName + ", orderNote=" + orderNote + "]";
	}
}
