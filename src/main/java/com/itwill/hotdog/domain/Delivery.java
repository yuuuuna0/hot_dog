package com.itwill.hotdog.domain;

public class Delivery {
	private int d_no;
	private String d_name;
	private String d_address;
	private String u_id;
	
	public Delivery() {
		// TODO Auto-generated constructor stub
	}

	public Delivery(int d_no, String d_name, String d_address, String u_id) {
		super();
		this.d_no = d_no;
		this.d_name = d_name;
		this.d_address = d_address;
		this.u_id = u_id;
	}

	public int getD_no() {
		return d_no;
	}

	public void setD_no(int d_no) {
		this.d_no = d_no;
	}

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
	}

	public String getD_address() {
		return d_address;
	}

	public void setD_address(String d_address) {
		this.d_address = d_address;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	@Override
	public String toString() {
		return "Delivery [d_no=" + d_no + ", d_name=" + d_name + ", d_address=" + d_address + ", u_id=" + u_id + "]";
	}
}