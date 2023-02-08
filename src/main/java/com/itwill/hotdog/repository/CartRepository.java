package com.itwill.hotdog.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.hotdog.domain.Cart;
import com.itwill.hotdog.domain.Product;
import com.itwill.hotdog.sql.CartSQL;

public class CartRepository {

		private DataSource dataSource;
		public CartRepository() throws Exception{
			Properties properties = new Properties();
			properties.load(this.getClass().getResourceAsStream("/jdbc.properties"));
			/*** Apache DataSource ***/
			BasicDataSource basicDataSource = new BasicDataSource();
			basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
			basicDataSource.setUrl(properties.getProperty("url"));
			basicDataSource.setUsername(properties.getProperty("username"));
			basicDataSource.setPassword(properties.getProperty("password"));
			dataSource = basicDataSource;
	}

	/*
	 * cart에 제품이 존재하는지 확인하기
	 
	 * 1. update -> cart에 상품 존재할 시(1) update
	  
	 */
	public int countByProductNo(String u_id, int p_no) throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			pstmt = con.prepareStatement(CartSQL.CART_COUNT_BY_USERID_PRODUCT_NO);
			pstmt.setString(1, u_id);
			pstmt.setInt(2, p_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}finally {
			if(con != null) {
				con.close();
			}
		}
		return count;
	}
		
		
	/*
	 * 2. insert ->cart에 제품 존재 안할 시(0) 새로 추가
	 */
	
	public int insertCart(Cart cart) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		int insertRowCount = 0;
		
		try {
			pstmt = con.prepareStatement(CartSQL.CART_INSERT);
			pstmt.setInt(1, cart.getC_qty());
			pstmt.setString(2, cart.getU_id());
			pstmt.setInt(3, cart.getProduct().getP_no());
			insertRowCount = pstmt.executeUpdate();
			
		}finally {
			if(con != null) {
				con.close();
			}
		}
		return insertRowCount;
}
	
	
	/*
	 * 3. delete- 카트 상품 전체 삭제
	 */
	public int deleteByUserId(String u_id) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		int deleteRowCount = 0;
		
		try {
			pstmt = con.prepareStatement(CartSQL.CART_DELETE_BY_USERID);
			pstmt.setString(1, u_id);
			deleteRowCount = pstmt.executeUpdate();
		}finally {
			if(con != null) {
				con.close();
			}
		}
		return deleteRowCount;
	}
	
	/*
	 * 3. delete-카트에 담긴 상품 중 한가지 삭제
	 */
	public int deleteByCartNo(int c_no) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		int deleteRowCount=0;
		
		try {
			pstmt = con.prepareStatement(CartSQL.CART_DELETE_BY_CART_NO);
			pstmt.setInt(1, c_no);
			deleteRowCount = pstmt.executeUpdate();
		}finally {
			if(con != null) {
				con.close();
			}
		}
		return deleteRowCount;
	}
		
	
	/*
	 * 4. update -상품 페이지에서 장바구니에 추가 (수량 변경)
	 */
	public int updateByProductNo(Cart cart) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		
		try {
			pstmt = con.prepareStatement(CartSQL.CART_UPDATE_BY_PRODUCT_NO_USERID);
			pstmt.setInt(1, cart.getC_qty());
			pstmt.setString(2, cart.getU_id());
			pstmt.setInt(3, cart.getProduct().getP_no());
			updateRowCount = pstmt.executeUpdate();
		}finally {
			if(con != null) {
				con.close();
			}
		}
		return updateRowCount;
	}	
	

	/*
	 * 4. update - 카트에서 수량 변경
	 */
	public int updateByCartNo(Cart cart) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		
		try {
			pstmt = con.prepareStatement(CartSQL.CART_UPDATE_BY_CART_NO);
			pstmt.setInt(1, cart.getC_qty());
			pstmt.setInt(2, cart.getC_no());
			updateRowCount = pstmt.executeUpdate();
		}finally {
			if(con != null) {
				con.close();
			}
		}
		return updateRowCount;
	}
	
	
	/*
	 * 5. List-카트 전체 목록보기[전체주문]
	 */
	
	public List<Cart> findByUserId(String userId) throws Exception{
		List<Cart> cartList=new ArrayList<Cart>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		con=dataSource.getConnection();
		
		try {  
		pstmt=con.prepareStatement(CartSQL.CART_SELECT_BY_USERID);
		pstmt.setString(1, userId);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			cartList.add(new Cart( rs.getInt("c_no"),
							       rs.getInt("c_qty"),
							       rs.getString("u_id"),
							       new Product(rs.getInt("p_no"),
							    		       rs.getString("p_name"),
							    		       rs.getInt("p_price"),
							    		       rs.getInt("p_discount"),
							    		       rs.getString("p_desc"),
							    		       rs.getString("p_img"),
							    		       rs.getInt("p_click"),
							    		       rs.getInt("ct_no"))		
							       ));
		}
		}finally {
			if(con!=null) {
				rs.close();
				pstmt.close();
				con.close();
			}
		}
		return cartList;
		
	}
	/*
	 * 5. List- 카트 일부 목록보기 [선택주문]
	 */

	public Cart findByCartNo(int cart_no) throws Exception {

		Cart cart = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		con = dataSource.getConnection();
		
		try {
		pstmt = con.prepareStatement(CartSQL.CART_SELECT_BY_CART_NO);
		pstmt.setInt(1, cart_no);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			cart = new Cart( rs.getInt("c_no"), 
					         rs.getInt("c_qty"), 
					         rs.getString("u_id"),
					         new Product(rs.getInt("p_no"),
					    		       rs.getString("p_name"),
					    		       rs.getInt("p_price"),
					    		       rs.getInt("p_discount"),
					    		       rs.getString("p_desc"),
					    		       rs.getString("p_img"),
					    		       rs.getInt("p_click"),
					    		       rs.getInt("ct_no")
			));
		}
		}finally {
			if(con!=null) {
				rs.close();
				pstmt.close();
				con.close();
			}
		}
		return cart;
	}
}
