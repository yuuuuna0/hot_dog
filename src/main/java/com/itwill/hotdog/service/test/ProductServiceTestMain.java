package com.itwill.hotdog.service.test;

import com.itwill.hotdog.service.ProductService;

public class ProductServiceTestMain {

	public static void main(String[] args) throws Exception {
		ProductService productService=new ProductService();
//		System.out.println("1.findByPrimaryKey");
//		System.out.println(productRepository.findByPrimaryKey(1));
//		System.out.println("2.findAll");
//		System.out.println(productRepository.findAll());
//		System.out.println("3.findByCategoryNumber");
//		System.out.println(productRepository.findCategoryByCategoryNo(2));	
//		System.out.println("4.findAllCat");
//		System.out.println(productRepository.findAllCat());	
//		System.out.println("5.findCategoryByCategoryNo");
//		System.out.println(productRepository.findCategoryByCategoryNo(1));
		
    //상품이름으로 검색하기 기능 추가-확인 완료
	System.out.println("7. productFindByName");
    System.out.println(productService.productFindByName("사료"));
	}

}
