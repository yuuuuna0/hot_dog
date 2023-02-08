package com.itwill.hotdog.sql;

public class OrdersSQL_sy {
	public static final String ORDERS_DELETE_BY_U_ID = "delete from orders where u_id=?";
	public static final String ORDERS_DELETE_BY_O_NO = "delete from orders where o_no=?";
	public static final String ORDERS_INSERT = "insert into orders(o_no, o_date, o_totalprice, o_usedpoint, pm_no, u_id) values (ORDERS_O_NO_SEQ.nextval, sysdate, ?, ?, ?, ?)";
	public static final String ORDERITEM_INSERT = "insert into order_item(oi_no, oi_qty, o_no, p_no) values(ORDER_ITEM_OI_NO_SEQ.nextval, ?, ORDERS_O_NO_SEQ.currval, ?)";
	public static final String ORDERS_PAYMENT_USERINFO_JOIN_SELECT_BY_U_ID = "select * from orders o join payment pm on o.pm_no=pm.pm_no join userinfo u on o.u_id=u.u_id where o.u_id=?";
	public static final String ORDERS_PAYMENT_USERINFO_ORDERITEM_PRODUCT_JOIN_SELECT_BY_O_NO
	= "select * from orders o join payment pm on o.pm_no=pm.pm_no join userinfo u on o.u_id=u.u_id join order_item oi on o.o_no=oi.o_no join product p on oi.p_no=p.p_no where o.o_no=?";
}