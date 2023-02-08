package com.itwill.hotdog.service.test;

import com.itwill.hotdog.service.ProductService;

public class ProductServiceTest {

	public static void main(String[] args) throws Exception {
		ProductService productService=new ProductService();
    System.out.println("1.productList");
    System.out.println(productService.productList());
    System.out.println("2.productDetail");
    System.out.println(productService.productDetail(1));
    System.out.println(productService.productDetail(2));
	}

}
