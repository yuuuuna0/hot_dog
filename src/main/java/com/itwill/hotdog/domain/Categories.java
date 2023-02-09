package com.itwill.hotdog.domain;


public class Categories {
	private int ct_no;
	private String ct_name;
	private String ct_img;
	private Product product;
	

	public Categories() {
		
    }
	
	public Categories(int ct_no, String ct_name, String ct_img, Product product) {
      super();
      this.ct_no = ct_no;
      this.ct_name = ct_name;
      this.ct_img = ct_img;
      this.product = product;
    }
	
	public int getCt_no() {
		return ct_no;
	}
	public void setCt_no(int ct_no) {
		this.ct_no = ct_no;
	}
	public String getCt_name() {
		return ct_name;
	}
	public void setCt_name(String ct_name) {
		this.ct_name = ct_name;
	}
	public String getCt_img() {
		return ct_img;
	}
	public void setCt_img(String ct_img) {
		this.ct_img = ct_img;
	}

	@Override
	public String toString() {
		return "Categories [ct_no=" + ct_no + ", ct_name=" + ct_name + ", ct_img=" + ct_img + ", product="
				+ product + "]";
	}


	
	
}
