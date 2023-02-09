package com.itwill.hotdog.domain;

import java.util.ArrayList;
import java.util.List;


public class UserInfo {
	private String u_id; 
	private String u_password; 
	private String u_name; 
	private String u_phone; 
	private int u_point; 
	private List<Delivery> deliveryList;
	private List<Orders> orderList;
	private List<Review> reviewList;
	
	public UserInfo() {
		this.deliveryList = new ArrayList<Delivery>();
		this.orderList = new ArrayList<Orders>();
		this.reviewList = new ArrayList<Review>();
	}

	public UserInfo(String u_id, String u_password, String u_name, String u_phone, int u_point) {
		super();
		this.u_id = u_id;
		this.u_password = u_password;
		this.u_name = u_name;
		this.u_phone = u_phone;
		this.u_point = u_point;
		this.deliveryList = new ArrayList<Delivery>();
		this.orderList = new ArrayList<Orders>();
		this.reviewList = new ArrayList<Review>();
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_password() {
		return u_password;
	}

	public void setU_password(String u_password) {
		this.u_password = u_password;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public int getU_point() {
		return u_point;
	}

	public void setU_point(int u_point) {
		this.u_point = u_point;
	}

	public List<Delivery> getDeliveryList() {
		return deliveryList;
	}

	public void setDeliveryList(List<Delivery> deliveryList) {
		this.deliveryList = deliveryList;
	}

	public List<Orders> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Orders> orderList) {
		this.orderList = orderList;
	}

	public List<Review> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<Review> reviewList) {
		this.reviewList = reviewList;
	}

	@Override
	public String toString() {
		return "UserInfo [u_id=" + u_id + ", u_password=" + u_password + ", u_name=" + u_name + ", u_phone=" + u_phone
				+ ", u_point=" + u_point + ", deliveryList=" + deliveryList + ", orderList=" + orderList
				+ ", reviewList=" + reviewList + "]";
	}
	
	public boolean isMatchPassword(String password){
		boolean isMatch=false;
		if(this.u_password.equals(password)){
			isMatch=true;
		}
		return isMatch;
	}
}
