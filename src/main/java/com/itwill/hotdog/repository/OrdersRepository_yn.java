package com.itwill.hotdog.repository;

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
import com.itwill.hotdog.domain.Payment;
import com.itwill.hotdog.domain.Product;
import com.itwill.hotdog.domain.UserInfo;
import com.itwill.hotdog.sql.OrdersSQL;

public class OrdersRepository_yn {
	
	private DataSource dataSource;
	
	public OrdersRepository_yn() throws Exception{
		Properties properties=new Properties();
		properties.load(this.getClass().getResourceAsStream("/jdbc.properties"));
		
		BasicDataSource basicDataSource=new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource=basicDataSource;
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
	public List<OrderItem> findOrderIteByOrderNo(int o_no) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrderItem> orderItemList=new ArrayList<OrderItem>();
		try {
			pstmt=con.prepareStatement(OrdersSQL.ORDERITEM_SELECT_WITH_PRODUCT_BY_O_NO);
			pstmt.setInt(1,o_no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				orderItemList.add(new OrderItem(rs.getInt("oi_no"),
												rs.getInt("oi_qty"),
												rs.getInt("o_no"),
												new Product(rs.getInt("p_no"),
															rs.getString("p_name"),
															rs.getInt("p_price"),
															rs.getInt("p_discount"),
															rs.getString("p_desc"),
															rs.getString("p_img"),
															rs.getInt("p_click"),
															rs.getInt("ct_no"))));
			}
			con.commit();
		} catch(Exception e) {
			e.printStackTrace();
			con.rollback();
			throw e;
		} finally {
			if(con!=null) {
				rs.close();
				con.close();
			}
		}
		return orderItemList;
	}
	
}
