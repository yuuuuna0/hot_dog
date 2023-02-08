package com.itwill.hotdog.domain;

import java.util.ArrayList;
import java.util.List;

public class Product {
	private int p_no;
	private String p_name;
	private int p_price;
	private int p_discount;
	private String p_desc;
	private String p_img;
	private int p_click;
	private Categories categories;
	private List<Review> reviewList;
	
	public Product() {
		this.reviewList=new ArrayList<Review>();
	}
	public List<Review> getReviewList() {
		return reviewList;
	}
	public void setReviewList(List<Review> reviewList) {
		this.reviewList = reviewList;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_discount() {
		return p_discount;
	}
	public void setP_discount(int p_discount) {
		this.p_discount = p_discount;
	}
	public String getP_desc() {
		return p_desc;
	}
	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public int getP_click() {
		return p_click;
	}
	public void setP_click(int p_click) {
		this.p_click = p_click;
	}
	public Categories getCategories() {
		return categories;
	}
	public void setCategories(Categories categories) {
		this.categories = categories;
	}
	public Product(int p_no, String p_name, int p_price, int p_discount, String p_desc, String p_img, int p_click,
			Categories categories) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_discount = p_discount;
		this.p_desc = p_desc;
		this.p_img = p_img;
		this.p_click = p_click;
		this.categories = categories;
		
	}
	@Override
	public String toString() {
		return "Product [p_no=" + p_no + ", p_name=" + p_name + ", p_price=" + p_price + ", p_discount=" + p_discount
				+ ", p_desc=" + p_desc + ", p_img=" + p_img + ", p_click=" + p_click + ", categories=" + categories
				+ ", reviewList=" + reviewList + "]";
	}
	
	

}