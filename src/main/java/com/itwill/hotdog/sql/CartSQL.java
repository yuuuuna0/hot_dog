package com.itwill.hotdog.sql;

public class CartSQL {
	/*
-- sy0 님의 카트아이템리스트
select * 
from cart c join userinfo u
on c.u_id=u.u_id 
join product p 
on p.p_no=c.p_no
where u.u_id='sy0';

-- sy0님의 카트아이템 1개의 제품정보
select * from cart c join product p on c.p_no=p.p_no where c_no=1 ;

-- sys0님의 카트에 있는 1번제품의 수량증가
update cart set c_qty=c_qty+1 where u_id='sy0' and p_no=1;
-- sys0님의 카트에 있는 cart_no 1번의 수량 5개로 수정
update cart set c_qty=5 where c_no=1;

-- sys0님의 카트아이템 1개 삭제
delete from cart where c_no=1;

-- sys0님의 카트아이템 모두 삭제
delete from cart where u_id='sy0';

	 */
	public static final String CART_INSERT = "insert into cart(c_no,c_qty,u_id,p_no) values(cart_c_no_SEQ.nextval,?,?,?)";
	public static final String CART_SELECT_BY_USERID = "select c.*,p.* from cart c join product p on c.p_no=p.p_no where u_id=?";
	public static final String CART_SELECT_BY_CART_NO = "select * from cart c join product p on c.p_no=p.p_no where c_no=?";
	public static final String CART_COUNT_BY_USERID_PRODUCT_NO = "select count(*)  as p_count from cart c join userinfo u on c.u_id=u.u_id where u.u_id=? and c.p_no=?";
	public static final String CART_DELETE_BY_CART_NO = "delete from cart where c_no=?";
	public static final String CART_DELETE_BY_USERID = "delete from cart where u_id=?";
	public static final String CART_UPDATE_BY_CART_NO = "update cart set c_qty=? where c_no=?";
	public static final String CART_UPDATE_BY_PRODUCT_NO_USERID = "update cart set c_qty=c_qty+? where u_id=? and p_no=?";
}
