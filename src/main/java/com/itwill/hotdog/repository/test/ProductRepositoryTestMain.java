
package com.itwill.hotdog.repository.test;

import com.itwill.hotdog.repository.ProductRepository;

public class ProductRepositoryTestMain {

	
	public static void main(String[] args) throws Exception {
		ProductRepository productRepository=new ProductRepository();
		System.out.println("1.findByPrimaryKey");
		System.out.println(productRepository.findByPrimaryKey(1));
		System.out.println("2.findAll");
		System.out.println(productRepository.findAll());
		System.out.println("3.findByCategoryNumber");
		System.out.println(productRepository.findByCategoryNumber(2));	
		}

}

