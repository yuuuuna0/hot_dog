package com.itwill.hotdog.sql;

public class ProductSQL {
	public final static String PRODUCT_SELECT_ALL=
			"select * from product";
	public final static String PRODUCT_SELECT_BY_NO=
			"select * from product where p_no=?";
	public final static String PRODUCT_SELECT_BY_CNO=
			"select * from product where ct_no=?";
	
}
