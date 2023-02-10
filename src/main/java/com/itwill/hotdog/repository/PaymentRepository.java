package com.itwill.hotdog.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.itwill.hotdog.common.DataSourceFactory;
import com.itwill.hotdog.domain.Payment;
import com.itwill.hotdog.sql.PaymentSQL;

public class PaymentRepository {
	private DataSource dataSource;
	public PaymentRepository() throws Exception {
		dataSource=DataSourceFactory.getDataSource();
	}
	
	//1. 결제수단 모두 불러오기
	public List<Payment> findAllPayment() throws Exception{
		Connection con=dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Payment> paymentList=new ArrayList<Payment>();
		try {
			pstmt=con.prepareStatement(PaymentSQL.PAYMENT_SELECT_ALL);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				paymentList.add(new Payment(rs.getInt("pm_no"),
											rs.getString("pm_name")));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}
		return paymentList;
	}
	
	//2. 결제수단 번호로 결제수단 불러오기 
	public Payment finByPaymentNo(int pm_no) throws Exception{
		Connection con=dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Payment findPayment=null;
		try {
			pstmt=con.prepareStatement(PaymentSQL.PAYMENT_SELECT_BY_PM_NO);
			pstmt.setInt(1, pm_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			findPayment=new Payment(rs.getInt("pm_no"),
									 rs.getString("pm_name"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}
		return findPayment;
	}
}
