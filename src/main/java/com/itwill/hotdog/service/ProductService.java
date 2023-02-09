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
	 * 전체상품보기
	 */
	public List<Product> productList() throws Exception{
			return productRepository.findAll();
	}
	/*
	 * 상품상세보기
	 */
	public Product productDetail(int p_no) throws Exception{
		return productRepository.findByPrimaryKey(p_no);
	}
	public Categories categoryDetail(int c_no) throws Exception{
		return productRepository.findByCategoryNumber(c_no);
	}
}
