package com.itwill.hotdog.sql;

public class DeliverySQL {
	public final static String DELIVERY_INSERT="insert into delivery(d_no, d_name, d_address, u_id) values(DELIVERY_D_NO_SEQ.nextval,?,?,?)";
	public final static String DELIVERY_DELETE_ALL_BY_U_ID="delete from delivery where u_id=? order by d_no";
	public final static String DELIVERY_DELETE_BY_D_NO="delete from delivery where d_no=?";
	public final static String DELIVERY_SELECT_ALL_BY_U_ID="select * from delivery where u_id=?";
	public final static String DELIVERY_SELECT_BY_D_NO="select * from delivery where d_no=?";
	public final static String DELIVERY_UPDATE_BY_D_NO="update delivery set d_name=?,d_address=? where d_no=?";
	public final static String DELIVERY_SELECT_BY_ID_DNAME="select count(*) cnt from delivery where u_id=? and d_name=?";
}
