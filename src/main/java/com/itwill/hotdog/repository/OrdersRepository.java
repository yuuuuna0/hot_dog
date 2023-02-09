package com.itwill.hotdog.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import com.itwill.hotdog.common.DataSourceFactory;
import com.itwill.hotdog.domain.Categories;
import com.itwill.hotdog.domain.OrderItem;
import com.itwill.hotdog.domain.Orders;
import com.itwill.hotdog.domain.Payment;
import com.itwill.hotdog.domain.Product;
import com.itwill.hotdog.domain.UserInfo;
import com.itwill.hotdog.sql.OrdersSQL_sy;

public class OrdersRepository {
	
	private DataSource dataSource;
	
	public OrdersRepository() throws Exception {
	  dataSource=DataSourceFactory.getDataSource();
	}
	
	/*
	 * 주문 전체삭제
	 */
	public int deleteAll(String sUserId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(OrdersSQL_sy.ORDERS_DELETE_BY_U_ID);
			pstmt.setString(1, sUserId);
			rowCount = pstmt.executeUpdate();
		} finally {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}
		
		return rowCount;
	}
	
	/*
	 * 주문 1건 삭제 (선택삭제)
	 */
	public int delete(int o_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(OrdersSQL_sy.ORDERS_DELETE_BY_O_NO);
			pstmt.setInt(1, o_no);
			rowCount = pstmt.executeUpdate();
		} finally {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}
		
		return rowCount;
	}
	
	/*
	 * 주문 생성 - 트랜잭션 처리 필요.
	 */
	public int insert(Orders orders) throws Exception {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);//트랜잭션 시작
			pstmt1 = con.prepareStatement(OrdersSQL_sy.ORDERS_INSERT);
			pstmt1.setInt(1, orders.getO_totalPrice());
			pstmt1.setInt(2, orders.getO_usedPoint());
			pstmt1.setInt(3, orders.getPayment().getPm_no());
			pstmt1.setString(4, orders.getUserInfo().getU_id());
			rowCount = pstmt1.executeUpdate();
			pstmt2 = con.prepareStatement(OrdersSQL_sy.ORDERITEM_INSERT);
			for(OrderItem orderItem : orders.getOrderItemList()) {
				pstmt2.setInt(1, orderItem.getOi_qty());
				pstmt2.setInt(2, orderItem.getProduct().getP_no());
				pstmt2.executeUpdate();
			}
			con.commit();//트랜잭션 종료
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();//트랜잭션 종료
			//throw e;
		} finally {
			if(pstmt1!=null) pstmt1.close();
			if(pstmt2!=null) pstmt2.close();
			if(con!=null) con.close();
		}
		
		return rowCount;
	}
	
	/*
	 * 주문 전체검색 (특정 사용자) - orders, payment, userinfo 테이블 JOIN
	 */
	public List<Orders> findAll(String sUserId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Orders> orderList = new ArrayList<Orders>();
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(OrdersSQL_sy.ORDERS_PAYMENT_USERINFO_JOIN_SELECT_BY_U_ID);
			pstmt.setString(1, sUserId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				orderList.add(new Orders(rs.getInt("o_no"),
										 rs.getDate("o_date"),
										 rs.getInt("o_totalPrice"),
										 rs.getInt("o_usedPoint"),
										 new Payment(rs.getInt("pm_no"),
												 	 rs.getString("pm_name")
												 	 ),
										 new UserInfo(rs.getString("u_id"),
												 	  rs.getString("u_password"),
												 	  rs.getString("u_name"),
												 	  rs.getString("u_phone"),
												 	  rs.getInt("u_point")
												 	  )
										 )
							);
			}
		} finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}
		
		return orderList;
	}
	
	/*
	 * 주문 상세보기 전체검색 (특정 사용자) - orders, payment, userinfo, order_item, product 테이블 JOIN
	 */
	public List<Orders> findDetailAll(String sUserId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ArrayList<Orders> orderList = new ArrayList<Orders>();
		try {
			con = dataSource.getConnection();
			pstmt1 = con.prepareStatement(OrdersSQL_sy.ORDERS_PAYMENT_USERINFO_JOIN_SELECT_BY_U_ID);
			pstmt1.setString(1, sUserId);
			rs1 = pstmt1.executeQuery();
			while(rs1.next()) {
				orderList.add(new Orders(rs1.getInt("o_no"),
										 rs1.getDate("o_date"),
										 rs1.getInt("o_totalPrice"),
										 rs1.getInt("o_usedPoint"),
										 new Payment(rs1.getInt("pm_no"),
												 	 rs1.getString("pm_name")
												 	 ),
										 new UserInfo(rs1.getString("u_id"),
												 	  rs1.getString("u_password"),
												 	  rs1.getString("u_name"),
												 	  rs1.getString("u_phone"),
												 	  rs1.getInt("u_point")
												 	  )
										 )
							);
			}
			pstmt2 = con.prepareStatement(OrdersSQL_sy.ORDERS_PAYMENT_USERINFO_ORDERITEM_PRODUCT_JOIN_SELECT_BY_O_NO);
			for(int i=0; i<orderList.size(); i++) {
				Orders tempOrder = orderList.get(i);
				pstmt2.setInt(1, tempOrder.getO_no());
				rs2 = pstmt2.executeQuery();
				Orders orderWithOrderItem = null;
				if(rs2.next()) {
					orderWithOrderItem = new Orders(rs2.getInt("o_no"),
													rs2.getDate("o_date"),
													rs2.getInt("o_totalPrice"),
													rs2.getInt("o_usedPoint"),
													new Payment(rs2.getInt("pm_no"),
																rs2.getString("pm_name")
																),
													new UserInfo(rs2.getString("u_id"),
																 rs2.getString("u_password"),
																 rs2.getString("u_name"),
																 rs2.getString("u_phone"),
																 rs2.getInt("u_point")
																 )
													);
					do {
						orderWithOrderItem.getOrderItemList().add(new OrderItem(rs2.getInt("oi_no"),
																				rs2.getInt("oi_qty"),
																				rs2.getInt("o_no"),
																				new Product(rs2.getInt("p_no"),
																							rs2.getString("p_name"),
																							rs2.getInt("p_price"),
																							rs2.getInt("p_discount"),
																							rs2.getString("p_desc"),
																							rs2.getString("p_img"),
																							rs2.getInt("p_click"),
																							null)
																				)
																);
					} while(rs2.next());
				}
				orderList.set(i, orderWithOrderItem);
			}
		} finally {
			if(rs1!=null) rs1.close();
			if(rs2!=null) rs2.close();
			if(pstmt1!=null) pstmt1.close();
			if(pstmt2!=null) pstmt2.close();
			if(con!=null) con.close();
		}
		
		return orderList;
	}
	
	/*
	 * 주문 상세보기 1개 검색 (특정 사용자) - orders, payment, userinfo, order_item, product 테이블 JOIN
	 */
	public Orders findDetail(int o_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Orders order = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(OrdersSQL_sy.ORDERS_PAYMENT_USERINFO_ORDERITEM_PRODUCT_JOIN_SELECT_BY_O_NO);
			pstmt.setInt(1, o_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				order = new Orders(rs.getInt("o_no"),
								   rs.getDate("o_date"),
								   rs.getInt("o_totalPrice"),
								   rs.getInt("o_usedPoint"),
								   new Payment(rs.getInt("pm_no"),
										   	   rs.getString("pm_name")
										   	   ),
								   new UserInfo(rs.getString("u_id"),
										   		rs.getString("u_password"),
										   		rs.getString("u_name"),
										   		rs.getString("u_phone"),
										   		rs.getInt("u_point")
										   		)
								   );
				do {
					order.getOrderItemList().add(new OrderItem(rs.getInt("oi_no"),
															   rs.getInt("oi_qty"),
															   rs.getInt("o_no"),
															   new Product(rs.getInt("p_no"),
																	   	   rs.getString("p_name"),
																	   	   rs.getInt("p_price"),
																	   	   rs.getInt("p_discount"),
																	   	   rs.getString("p_desc"),
																	   	   rs.getString("p_img"),
																	   	   rs.getInt("p_click"),
																	   	   null)
															   )
												);
				} while(rs.next());
			}
		} finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}
		
		return order;
	}
}