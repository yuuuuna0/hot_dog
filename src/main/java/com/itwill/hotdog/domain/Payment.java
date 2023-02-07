package com.itwill.hotdog.domain;

public class Payment {
	private int pm_no;
	private String pm_name;
	
	public Payment() {
		// TODO Auto-generated constructor stub
	}

	public Payment(int pm_no, String pm_name) {
		super();
		this.pm_no = pm_no;
		this.pm_name = pm_name;
	}

	public int getPm_no() {
		return pm_no;
	}

	public void setPm_no(int pm_no) {
		this.pm_no = pm_no;
	}

	public String getPm_name() {
		return pm_name;
	}

	public void setPm_name(String pm_name) {
		this.pm_name = pm_name;
	}

	@Override
	public String toString() {
		return "Payment [pm_no=" + pm_no + ", pm_name=" + pm_name + "]";
	}
}