package com.itwill.hotdog.sql;

public class OrdersSQL {

	public static final String ORDERS_DELETE_BY_U_ID = "delete from orders where u_id=?";
	public static final String ORDERS_DELETE_BY_O_NO = "delete from orders where o_no=?";
	public static final String ORDERS_INSERT = "insert into orders(o_no, o_date, o_totalprice, o_usedpoint, pm_no, u_id) values (ORDERS_O_NO_SEQ.nextval, sysdate, ?, ?, ?, ?)";
	public static final String ORDERITEM_INSERT = "insert into order_item(oi_no, oi_qty, o_no, p_no) values(ORDER_ITEM_OI_NO_SEQ.nextval, ?, ORDERS_O_NO_SEQ.currval, ?)";
}
	/*
	public final static String ORDERS_INSERT="insert into orders(o_no,o_date,o_totalPrice,o_usedPoint,pm_no,u_id) values(orders_o_no_seq.nextval,sysdate,?,?,?,?)";
	public final static String ORDERITEM_INSERT="insert into orderItem(oi_no,oi_qty,o_no,p_no) values(orderItem_oi_no_seq.nextval,?,orders_o_no_seq.currval,?)";
	public final static String ORDERITEM_DELETE_BY_OI_NO="delete from orderItem where oi_no=?";
	public final static String ORDERS_SELECT_ALL="select * from orders";
	public final static String ORDERITEM_SELECT_ALL="select * from orderItem";
	public final static String ORDERS_SELECT_BY_U_ID="select * from orders where u_id=?";
	public final static String ORDERS_SELECT_WITH_ORDERITEM_BY_OI_NO="select * from orders o join orderItem oi on o.o_no=oi.o_no where oi.oi_no=?";
	public final static String ORDERS_SELECT_WITH_ORDERITEM_BY_U_ID="select * from orders o join orderItem oi on o.o_no=oi.o_no where o.u_id=?";
	*/