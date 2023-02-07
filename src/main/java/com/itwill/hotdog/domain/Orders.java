package com.itwill.hotdog.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Orders {
	private int o_no;
	private Date o_date;
	private int o_totalPrice;
	private int o_usedPoint;
	private Payment payment;
	private UserInfo userInfo;
	private List<OrderItem> orderItemList;
	
	public Orders() {
	}

	public Orders(int o_no, Date o_date, int o_totalPrice, int o_usedPoint, Payment payment, UserInfo userInfo) {
		super();
		this.o_no = o_no;
		this.o_date = o_date;
		this.o_totalPrice = o_totalPrice;
		this.o_usedPoint = o_usedPoint;
		this.payment = payment;
		this.userInfo = userInfo;
		this.orderItemList = new ArrayList<OrderItem>();
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public int getO_totalPrice() {
		return o_totalPrice;
	}

	public void setO_totalPrice(int o_totalPrice) {
		this.o_totalPrice = o_totalPrice;
	}

	public int getO_usedPoint() {
		return o_usedPoint;
	}

	public void setO_usedPoint(int o_usedPoint) {
		this.o_usedPoint = o_usedPoint;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}

	@Override
	public String toString() {
		return "Orders [o_no=" + o_no + ", o_date=" + o_date + ", o_totalPrice=" + o_totalPrice + ", o_usedPoint="
				+ o_usedPoint + ", payment=" + payment + ", userInfo=" + userInfo + ", orderItemList=" + orderItemList
				+ "]";
	}
}