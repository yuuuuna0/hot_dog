package com.itwill.hotdog.service;
/*
 * - 쇼핑몰 제품 업무(비즈니스로직,예외처리,트랜젝션,보안,로깅)을 수행하는 클래스
 * - UI(SWING,서블릿,JSP)에서 직접접근(메쏘드호출)하는 클래스(객체)
 * - Dao를 이용해서 데이타베이스를 조작작업(CRUD)하는 클래스
 */

import java.util.List;

import com.itwill.hotdog.domain.Categories;
import com.itwill.hotdog.domain.Product;
import com.itwill.hotdog.repository.ProductRepository;

public class ProductService {
	private ProductRepository productRepository;
	public ProductService() throws Exception{
		productRepository=new ProductRepository();	
	}
	
	
	/*
	 * 상품이름으로 검색하기 기능추가
	 */
	 public List <Product> productFindByName(String p_name) throws Exception {
		 return productRepository.productFindByName(p_name);
	 }
	
	/*
	 * 전체상품보기
	 */
	public List<Product> productList() throws Exception{
		return productRepository.findAll();
	}
	public List<Product> productListByCategoryNo(int ct_no) throws Exception{
		return productRepository.findByCategoryNo(ct_no);
	}
	/*
	 * 상품상세보기
	 */
	public Product productDetail(int p_no) throws Exception{
		return productRepository.findByPrimaryKey(p_no);
	}

	public List<Categories> categoriesList() throws Exception{
		return productRepository.findAllCat();
	}
	public Categories findCategoryByCategoryNo(int ct_no) throws Exception {
		return productRepository.findCategoryByCategoryNo(ct_no);
	}
	
	/*
	 * include_common_left.jsp에서 사용하기 위해서 만든 서비스 메소드
	 */
	public List<Categories> getCategoryListOnly() throws Exception {
		return productRepository.findAllCategoriesOnly();
	}
}

