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

	public ProductRepository() throws Exception {

		dataSource = DataSourceFactory.getDataSource();

	}
	
	/*
	 * 상품 이름으로 검색하는 기능 추가
	 */
	public List <Product> productFindByName(String p_name) throws Exception {

		List <Product> productList = new ArrayList<>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_BY_NAME);
		pstmt.setString(1, p_name);
		ResultSet rs = pstmt.executeQuery();

		if(rs.next()) {
			do {
				Product product =new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"),
						rs.getInt("p_discount"), rs.getString("p_desc"), rs.getString("p_img"), rs.getInt("p_click"),
						null);

				productList.add(product);

			} while(rs.next());
		}
		return productList;
	}
	
	
	
	/*
	 * selelctByPK : 상품번호로 검색
	 */
	public Product findByPrimaryKey(int p_no) throws Exception {
		Product product = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_BY_NO);
			pstmt.setInt(1, p_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				product = new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"),
						rs.getInt("p_discount"), rs.getString("p_desc"), rs.getString("p_img"), rs.getInt("p_click"),
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
	public List<Product> findAll() throws Exception {
		List<Product> productList = new ArrayList<Product>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productList.add(new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"),
						rs.getInt("p_discount"), rs.getString("p_desc"), rs.getString("p_img"), rs.getInt("p_click"),
						new Categories(rs.getInt("ct_no"), rs.getString("ct_name"), rs.getString("ct_img"),null)));
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return productList;

	}
	
	/*
	 * List<Product> findByCategoryNo: 카테고리 넘버로 productList검색
	 */
	public List<Product> findByCategoryNo(int ct_no) throws Exception {
		List<Product> productList = new ArrayList<Product>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_BY_CNO);
			pstmt.setInt(1,ct_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productList.add(new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"),
						rs.getInt("p_discount"), rs.getString("p_desc"), rs.getString("p_img"), rs.getInt("p_click"),
						null));
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return productList;

	}
	/*
	 * List<Categories> findAllCat: 카테고리 전체검색
	 */
	public List<Categories> findAllCat() throws Exception {
		List<Categories> categoriesList = new ArrayList<Categories>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				categoriesList.add(new Categories(rs.getInt("ct_no"), rs.getString("ct_name"), rs.getString("ct_img"),null));
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return categoriesList;

	}
	/*
	 * Categories findByCategoryNumber: 카테고리 넘버로 categories검색
	 */
	public Categories findCategoryByCategoryNo(int ct_no) throws Exception {
		Categories category = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.CATEGORY_SELECT_BY_CTNO);
			pstmt.setInt(1, ct_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				category=new Categories(rs.getInt("ct_no"), rs.getString("ct_name"), rs.getString("ct_img"),null);
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return category;

	}
	
	public List<Categories> findAllCategoriesOnly() throws Exception {
		List<Categories> categoriesList = new ArrayList<Categories>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(ProductSQL.CATEGORIES_SELECT_ONLY);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				categoriesList.add(new Categories(rs.getInt("ct_no"), rs.getString("ct_name"), rs.getString("ct_img"),null));
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return categoriesList;

	}
	
	
}
