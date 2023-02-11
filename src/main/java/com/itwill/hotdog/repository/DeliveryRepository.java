package com.itwill.hotdog.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import com.itwill.hotdog.common.DataSourceFactory;
import com.itwill.hotdog.domain.Delivery;
import com.itwill.hotdog.sql.DeliverySQL;

public class DeliveryRepository {
	private DataSource dataSource;
	
	public DeliveryRepository() throws Exception{
	  dataSource=DataSourceFactory.getDataSource();
	}
	
	//1. 배송지입력
	public int insert(Delivery delivery) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(DeliverySQL.DELIVERY_INSERT);
			pstmt.setString(1, delivery.getD_name());
			pstmt.setString(2, delivery.getD_address());
			pstmt.setString(3, delivery.getU_id());
			pstmt.executeUpdate();
			con.commit();
		} catch(Exception e) {
			e.printStackTrace();
			con.rollback();
		}finally {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}
		return 0;
	}
	//2. 한 회원의 배송지 전체 삭제
	public int deletAllByUser(String sUserId) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(DeliverySQL.DELIVERY_DELETE_ALL_BY_U_ID);
			pstmt.setString(1, sUserId);
			pstmt.executeUpdate();
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
		} finally {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}
		return 0;
	}	
	//3. 한 회원의 배송지 하나 삭제
	public int deletByDeliveryNo(int d_no) throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(DeliverySQL.DELIVERY_DELETE_BY_D_NO);
			pstmt.setInt(1, d_no);
			pstmt.executeUpdate();
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
		} finally {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}
		return 0;
	}
	//4. 회원별 배송지 리스트
	public List<Delivery> findDeliveryListByUser(String sUserId) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Delivery> deliveryList=new ArrayList<Delivery>();
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(DeliverySQL.DELIVERY_SELECT_ALL_BY_U_ID);
			pstmt.setString(1, sUserId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				deliveryList.add(new Delivery(rs.getInt("d_no"),
											  rs.getString("d_name"),
											  rs.getString("d_address"),
											  rs.getString("u_id")));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}
		return deliveryList;
	}
	//5. 배송지 번호로 배송지 정보 찾기
	public Delivery findByDeliveryNo(int d_no) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Delivery finddelivery=null;
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(DeliverySQL.DELIVERY_SELECT_BY_D_NO);
			pstmt.setInt(1, d_no);
			rs=pstmt.executeQuery();
			finddelivery=new Delivery(rs.getInt("d_no"),
					  			  rs.getString("d_name"),
					  			  rs.getString("d_address"),
					  			  rs.getString("u_id"));
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}
		return finddelivery;
	}
	//6. 배송지 수정
	public Delivery updateByDeliveryNo(int d_no)  throws Exception {
		Connection con=null;
		PreparedStatement pstmt=null;
		Delivery finddelivery=null;
		try {
			pstmt=con.prepareStatement(DeliverySQL.DELIVERY_UPDATE_BY_D_NO);
			pstmt.setString(1,"d_name");
			pstmt.setString(2, "d_address");
			pstmt.setInt(3, d_no);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}
		return null;
	}
	//7. 사용자의 배송지명이 존재하는지의 여부를 판별
	public boolean existedDeliveryName(String sUserId, String d_name) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		boolean isExisted = false;
		try {
			con = dataSource.getConnection();
			pstmt=con.prepareStatement(DeliverySQL.DELIVERY_SELECT_ALL_BY_U_ID);
			pstmt.setString(1, sUserId);
			pstmt.setString(2, d_name);
			rs=pstmt.executeQuery();
			rs.next();
			int count=rs.getInt("cnt");
			if(count==1) {
				isExisted=true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}
		return isExisted;
	}
}
