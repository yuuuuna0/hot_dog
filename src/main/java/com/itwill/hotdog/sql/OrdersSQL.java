package com.itwill.hotdog.sql;

public class OrdersSQL {
	public final static String ORDERS_INSERT="insert into orders(o_no,o_date,o_totalPrice,o_usedPoint,pm_no,u_id) values(orders_o_no_seq.nextval,sysdate,?,?,?,?)";
	public final static String ORDERITEM_INSERT="insert into orderItem(oi_no,oi_qty,o_no,p_no) values(orderItem_oi_no_seq.nextval,?,orders_o_no_seq.currval,?)";
	public final static String ORDERS_DELETE_BY_U_ID="delete from orders where u_id=?";
	public final static String ORDERS_DELETE_BY_O_NO="delete from orders where o_no=?";
	public final static String ORDERITEM_DELETE_BY_OI_NO="delete from orderItem where oi_no=?";
	public final static String ORDERS_SELECT_ALL="select * from orders";
	public final static String ORDERS_SELECT_WITH_ORDERITEM_SELECT_WITH_PRODUCT_BY_O_NO="select * from orderItem oi join product p on oi.p_no=p.p_no where oi.o_no=?";
	public final static String ORDERS_SELECT_BY_U_ID="select * from orders where u_id=?";
	public final static String ORDERS_SELECT_WITH_PAYMENT_WITH_USERINFO_BY_U_ID="select * from orders o "
																			+ "join payment pm on o.pm_no=pm.pm_no "
																			+ "join userinfo u on o.u_id=u.u_id "
																			+ "where o.u_id=?";
	public final static String ORDERS_SELECT_WITH_ORDERITEM_BY_OI_NO="select * from orders o join orderItem oi on o.o_no=oi.o_no where oi.oi_no=?";
	public final static String ORDERS_SELECT_WITH_ORDERITEM_WITH_PRODUCT_BY_O_NO="select * from orders o "
																			+ "join orderItem oi on o.o_no=oi.o_no "
																			+ "join product p on oi.p_no=p.p_no"
																			+ "where o.o_no=? and o.u_id=?";
	

}
