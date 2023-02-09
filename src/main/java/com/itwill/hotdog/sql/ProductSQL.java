package com.itwill.hotdog.sql;

public class ProductSQL {
	public final static String PRODUCT_SELECT_ALL=
			"select * from product p join categories c on p.ct_no=c.ct_no";
	public final static String PRODUCT_SELECT_BY_NO=
			"select * from product p join categories c on p.ct_no=c.ct_no where p_no=?";
	public final static String PRODUCT_SELECT_BY_CNO=
			"select * from categories c join product p on c.ct_no=p.ct_no where c.ct_no=?";
	public final static String CATEGORIES_SELECT_All=
			"select * from categories c join product p on c.ct_no=p.ct_no";
	
}
