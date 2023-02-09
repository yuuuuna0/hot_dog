package com.itwill.hotdog.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import com.itwill.hotdog.common.DataSourceFactory;
import com.itwill.hotdog.domain.OrderItem;
import com.itwill.hotdog.domain.Orders;
import com.itwill.hotdog.domain.Payment;
import com.itwill.hotdog.domain.Product;
import com.itwill.hotdog.domain.UserInfo;
import com.itwill.hotdog.sql.OrdersSQL;

public class OrdersRepository_yn {
	
	private DataSource dataSource;
	
	public OrdersRepository_yn() throws Exception{
	  dataSource=DataSourceFactory.getDataSource();
	}
	
	//1. 주문 생성
	public int insertOrder(Orders orders) throws Exception {
		Connection con=null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		try {
			con=dataSource.getConnection();
			con.setAutoCommit(false);
			//transaction 시작
			//order 삽입
			pstmt1=con.prepareStatement(OrdersSQL.ORDERS_INSERT);
			pstmt1.setInt(1,orders.getO_totalPrice());
			pstmt1.setInt(2,orders.getO_usedPoint());
			pstmt1.setInt(3,orders.getPayment().getPm_no());
			pstmt1.setString(4, orders.getUserInfo().getU_id());
			pstmt1.executeUpdate();
			//orderItem 삽입
			pstmt2=con.prepareStatement(OrdersSQL.ORDERITEM_INSERT);
			for(OrderItem orderItem:orders.getOrderItemList()) {
				pstmt2.setInt(1, orderItem.getOi_qty());
				pstmt2.setInt(2, orderItem.getProduct().getP_no());
				pstmt2.executeUpdate();
			}
			//transaction 종료
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
			throw e;
		} finally {
			if(con!=null) {
				con.close();
			}
		}
		return 0;
	}
	
	//2. 회원 아이디로 주문 전체 삭제
	public int deleteByUserId(String sUserId) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(OrdersSQL.ORDERS_DELETE_BY_U_ID);
			pstmt.setString(1, sUserId);
			pstmt.executeUpdate();
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
			throw e;
		} finally {
			if(con!=null) {
				con.close();
			}
		}
		return 0;
	}
	
	//3. 주문번호로 해당 주문 삭제
	public int deleteByOrdersNo(int o_no) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			pstmt=con.prepareStatement(OrdersSQL.ORDERS_DELETE_BY_O_NO);
			pstmt.setInt(1, o_no);
			pstmt.executeUpdate();
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
			throw e;
		} finally {
			if(con!=null) {
				con.close();
			}
		}
		return 0;
	}
	
	//4. 회원의 주문내역 전체 출력
	public List<Orders> findAllOrdersByUserId(String sUserId) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Orders> ordersList=new ArrayList<Orders>();
		try {
			pstmt=con.prepareStatement(OrdersSQL.ORDERS_SELECT_WITH_PAYMENT_WITH_USERINFO_BY_U_ID);
			pstmt.setString(1, sUserId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ordersList.add(new Orders(rs.getInt("o_no"),
										  rs.getDate("o_date"),
										  rs.getInt("o_totalPrice"),
										  rs.getInt("o_usedPoint"),
										  new Payment(rs.getInt("pm_no"),
												  	  rs.getString("pm_name")),
										  new UserInfo(rs.getString("u_id"),
												  	   rs.getString("u_password"),
												  	   rs.getString("u_name"),
												  	   rs.getString("u_phone"),
												  	   rs.getInt("u_point"))));
			}
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
			throw e;
		} finally {
			if(con!=null) {
				rs.close();
				con.close();
			}
		}
		return ordersList;
	}
	
	//5. 주문번호로 해당 주문아이템리스트 보기
	public List<Orders> findOrderWithOrderItemByOrderNo(String sUserId) throws Exception{
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		List<Orders> ordersList = new ArrayList<Orders>();
		try {
			con = dataSource.getConnection();
			pstmt1 = con.prepareStatement(OrdersSQL.ORDERS_SELECT_WITH_PAYMENT_WITH_USERINFO_BY_U_ID);
			pstmt1.setString(1, sUserId);
			rs1 = pstmt1.executeQuery();
			while(rs1.next()) {
				ordersList.add(new Orders(rs1.getInt("o_no"),
										 rs1.getDate("o_date"),
										 rs1.getInt("o_totalPrice"),
										 rs1.getInt("o_usedPoint"),
										 new Payment(rs1.getInt("pm_no"),
												 	 rs1.getString("pm_name")),
										 new UserInfo(rs1.getString("u_id"),
												 	  rs1.getString("u_password"),
												 	  rs1.getString("u_name"),
												 	  rs1.getString("u_phone"),
												 	  rs1.getInt("u_point"))));
			}
			pstmt2 = con.prepareStatement(OrdersSQL.ORDERS_SELECT_WITH_ORDERITEM_WITH_PRODUCT_BY_O_NO);
			for(int i=0; i<ordersList.size(); i++) {
				Orders tempOrder = ordersList.get(i);
				pstmt2.setInt(1, tempOrder.getO_no());
				rs2 = pstmt2.executeQuery();
				Orders ordersWithOrderItem = null;
				if(rs2.next()) {
					ordersWithOrderItem = new Orders(rs2.getInt("o_no"),
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
						ordersWithOrderItem.getOrderItemList().add(new OrderItem(rs2.getInt("oi_no"),
																				rs2.getInt("oi_qty"),
																				rs2.getInt("o_no"),
																				new Product(rs2.getInt("p_no"),
																							rs2.getString("p_name"),
																							rs2.getInt("p_price"),
																							rs2.getInt("p_discount"),
																							rs2.getString("p_desc"),
																							rs2.getString("p_img"),
																							rs2.getInt("p_click"),
																							null
																							)
																				)
																);
					} while(rs2.next());
				}
				ordersList.set(i, ordersWithOrderItem);
			}
		} finally {
			if(rs1!=null) rs1.close();
			if(rs2!=null) rs2.close();
			if(pstmt1!=null) pstmt1.close();
			if(pstmt2!=null) pstmt2.close();
			if(con!=null) con.close();
		}
		
		return ordersList;
	}
	
}
