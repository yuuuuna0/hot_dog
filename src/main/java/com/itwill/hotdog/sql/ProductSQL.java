package com.itwill.hotdog.sql;

public class ProductSQL {
	public final static String PRODUCT_SELECT_ALL=
			"select * from product p join categories c on p.ct_no=c.ct_no";
	public final static String PRODUCT_SELECT_BY_NO=
			"select * from product p join categories c on p.ct_no=c.ct_no where p_no=?";
	public final static String PRODUCT_SELECT_BY_CNO=
			"select * from product where ct_no=?";
	public final static String CATEGORIES_SELECT_All=
			"select * from categories c join product p on c.ct_no=p.ct_no";
	public final static String CATEGORY_SELECT_BY_CTNO=
			"select * from categories c where ct_no=?";

	
	//상품 이름으로 검색하는 기능 추가
	public static final String PRODUCT_BY_NAME= "select*from product where p_name like '%'||?||'%'";

	public final static String CATEGORIES_SELECT_ONLY = "select * from categories";

}
