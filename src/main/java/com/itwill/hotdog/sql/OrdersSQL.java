package com.itwill.hotdog.sql;

public class OrdersSQL {
	public static final String ORDERS_DELETE_BY_U_ID = "delete from orders where u_id=?";
	public static final String ORDERS_DELETE_BY_O_NO = "delete from orders where o_no=?";
	public static final String ORDERS_INSERT = "insert into orders(o_no, o_date, o_totalprice, o_usedpoint, pm_no, u_id) values (ORDERS_O_NO_SEQ.nextval, sysdate, ?, ?, ?, ?)";
	public static final String ORDERITEM_INSERT = "insert into order_item(oi_no, oi_qty, o_no, p_no) values(ORDER_ITEM_OI_NO_SEQ.nextval, ?, ORDERS_O_NO_SEQ.currval, ?)";
}