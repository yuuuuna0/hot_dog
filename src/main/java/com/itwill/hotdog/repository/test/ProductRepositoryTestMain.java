
package com.itwill.hotdog.repository.test;

import java.awt.List;

import com.itwill.hotdog.repository.ProductRepository;

public class ProductRepositoryTestMain {

	
	public static void main(String[] args) throws Exception {
		ProductRepository productRepository=new ProductRepository();
		
//		System.out.println("1.findByPrimaryKey");
//		System.out.println(productRepository.findByPrimaryKey(1));
//		System.out.println("2.findAll");
//		System.out.println(productRepository.findAll());
//		System.out.println("3.findByCategoryNumber");
//		System.out.println(productRepository.findByCategoryNumber(2));	
//		System.out.println("4.findAllCat");
//		System.out.println(productRepository.findAllCat());	
//		System.out.println("5.findCategoryByCategoryNo");
//		System.out.println(productRepository.findCategoryByCategoryNo(1));	
		
		//상품 이름으로 검색하기 기능 추가-확인완료
		System.out.println("6. productFindByName");
		System.out.println(productRepository.productFindByName("껌"));
//		List<Product> findProduct =ProductRepository.productFindByName("껌");
//		System.out.println(findProduct);
		
		}
		

}

