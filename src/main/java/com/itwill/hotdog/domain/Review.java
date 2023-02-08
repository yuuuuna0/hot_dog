package com.itwill.hotdog.domain;

import java.util.Date;

/**********************************
Table Name: review 

CREATE TABLE review(
		r_no                          		NUMBER(10)		 NULL ,
		r_date                        		DATE		 DEFAULT sysdate		 NULL ,
		r_comment                     		VARCHAR2(10)		 NULL ,
		r_grade                       		NUMBER(10)		 NULL ,
		r_groupNo                     		NUMBER(10)		 NULL ,
		r_step                        		NUMBER(10)		 NULL ,
		r_depth                       		NUMBER(10)		 NULL ,
		u_id                          		VARCHAR2(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);
*********************************/


public class Review {
	
	private int r_no;
	private Date r_date;
	private String r_comment;
	private int r_grade;	
	private int r_groupNo;	
	private int r_step;	
	private int r_depth;	
	private String u_id;	// FK
	private int p_no;		// FK

	
	
	@Override
	public String toString() {
		return "review [r_no=" + r_no + ", r_date=" + r_date + ", r_comment=" + r_comment + ", r_grade=" + r_grade
				+ ", r_groupNo=" + r_groupNo + ", r_step=" + r_step + ", r_depth=" + r_depth + ", u_id=" + u_id
				+ ", p_no=" + p_no + "]";
	}



	public int getR_no() {
		return r_no;
	}



	public void setR_no(int r_no) {
		this.r_no = r_no;
	}



	public Date getR_date() {
		return r_date;
	}



	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}



	public String getR_comment() {
		return r_comment;
	}



	public void setR_comment(String r_comment) {
		this.r_comment = r_comment;
	}



	public int getR_grade() {
		return r_grade;
	}



	public void setR_grade(int r_grade) {
		this.r_grade = r_grade;
	}



	public int getR_groupNo() {
		return r_groupNo;
	}



	public void setR_groupNo(int r_groupNo) {
		this.r_groupNo = r_groupNo;
	}



	public int getR_step() {
		return r_step;
	}



	public void setR_step(int r_step) {
		this.r_step = r_step;
	}



	public int getR_depth() {
		return r_depth;
	}



	public void setR_depth(int r_depth) {
		this.r_depth = r_depth;
	}



	public String getU_id() {
		return u_id;
	}



	public void setU_id(String u_id) {
		this.u_id = u_id;
	}



	public int getP_no() {
		return p_no;
	}



	public void setP_no(int p_no) {
		this.p_no = p_no;
	}



	public Review(int r_no, Date r_date, String r_comment, int r_grade, int r_groupNo, int r_step, int r_depth,
			String u_id, int p_no) {
		super();
		this.r_no = r_no;
		this.r_date = r_date;
		this.r_comment = r_comment;
		this.r_grade = r_grade;
		this.r_groupNo = r_groupNo;
		this.r_step = r_step;
		this.r_depth = r_depth;
		this.u_id = u_id;
		this.p_no = p_no;
	}



	public Review() {
		// TODO Auto-generated constructor stub
	}



}
