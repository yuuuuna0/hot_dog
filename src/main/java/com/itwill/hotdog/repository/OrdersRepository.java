package com.itwill.hotdog.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.hotdog.domain.Orders;
import com.itwill.hotdog.domain.Payment;
import com.itwill.hotdog.domain.UserInfo;
import com.itwill.hotdog.sql.OrdersSQL;
import com.itwill.hotdog.sql.OrdersSQL_sy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.hotdog.domain.OrderItem;
import com.itwill.hotdog.domain.Orders;
import com.itwill.hotdog.sql.OrdersSQL;

public class OrdersRepository {
	
	private DataSource dataSource;
	
	public OrdersRepository() throws Exception {
		Properties properties = new Properties();
		properties.load(getClass().getResourceAsStream("/jdbc.properties"));
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClass"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
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
	 * 주문 생성
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
	 * 주문 상세보기 전체검색 (특정 사용자) - orders, order_item, payment, product, userinfo 테이블 JOIN
	 */
	public List<Orders> findDetailAll(String sUserId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ArrayList<Orders> orderList = new ArrayList<Orders>();
		try {
			
		} finally {
			// TODO: handle finally clause
		}
		
		return null;
	}
	
	/*
	 * 주문 상세보기 1개 검색 (특정 사용자) - orders, order_item, product, payment 테이블 JOIN
	 */

	public Orders findDetail(int o_no) throws Exception {
		
		
		return null;
	}
}