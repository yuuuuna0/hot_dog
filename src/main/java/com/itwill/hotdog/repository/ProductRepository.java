package com.itwill.hotdog.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import javax.sql.DataSource;

import com.itwill.hotdog.common.DataSourceFactory;

import com.itwill.hotdog.domain.Categories;
import com.itwill.hotdog.domain.Product;
import com.itwill.hotdog.sql.ProductSQL;

/*
쇼핑몰에서 상품테이블과의 데이타베이스와의 작업을 전담하는 클래스
PRODUCT 테이블에 제품 검색 등의 작업을한다.
*/
public class ProductRepository {
	private DataSource dataSource;
	public ProductRepository() throws Exception{

	  dataSource=DataSourceFactory.getDataSource();

	}
	/*
	 * selelctByPK : 상품번호로 검색
	 */
	public Product findByPrimaryKey(int p_no) throws Exception{
		Product product=null;
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
		con=dataSource.getConnection();
		pstmt=con.prepareStatement(ProductSQL.PRODUCT_SELECT_BY_NO);
		pstmt.setInt(1, p_no);
		rs=pstmt.executeQuery();
		if (rs.next()) {
			product=
					new Product(
							rs.getInt("p_no"),
							rs.getString("p_name"), 
							rs.getInt("p_price"), 
							rs.getInt("p_discount"), 
							rs.getString("p_desc"), 
							rs.getString("p_img"), 
							rs.getInt("p_click"),
							null);
		}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return product;
	}
	/*
	 * selectAll : 상품전체검색
	 */
	public List<Product> findAll() throws Exception{
		List<Product> productList=new ArrayList<Product>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(ProductSQL.PRODUCT_SELECT_ALL);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				productList.add(new Product(
							rs.getInt("p_no"),
							rs.getString("p_name"), 
							rs.getInt("p_price"), 
							rs.getInt("p_discount"), 
							rs.getString("p_desc"), 
							rs.getString("p_img"), 
							rs.getInt("p_click"),
							
			new Categories(
					rs.getInt("ct_no"),
					rs.getString("ct_name"),
					rs.getString("ct_img"))
			));
			}
		}finally {
		if (con != null) {
		con.close();
		}
	}
	return productList;

}

	public Product findByCategoryNumber(int c_no) throws Exception{
		
		Product product=null;
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
		con=dataSource.getConnection();
		pstmt=con.prepareStatement(ProductSQL.PRODUCT_SELECT_BY_CNO);
		pstmt.setInt(1, c_no);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			product=
					new Product(
							rs.getInt("p_no"),
							rs.getString("p_name"), 
							rs.getInt("p_price"), 
							rs.getInt("p_discount"), 
							rs.getString("p_desc"), 
							rs.getString("p_img"), 
							rs.getInt("p_click"),
							new Categories(
									rs.getInt("ct_no"),
									rs.getString("ct_name"),
									rs.getString("ct_img"))
							);
		}
		}finally {
			if(con!=null) {
				rs.close();
				con.close();
				pstmt.close();
			}
		}
		
		return product;
	}

}



