package com.itwill.hotdog.service.test;

import com.itwill.hotdog.service.ProductService;

public class ProductServiceTestMain {

	public static void main(String[] args) throws Exception {
		ProductService productService=new ProductService();
    System.out.println("1.productList");
    System.out.println(productService.productList());
    System.out.println("2.productListByCategoryNo");
    System.out.println(productService.productListByCategoryNo(2));
    System.out.println("3.productDetail");
    System.out.println(productService.productDetail(3));
    System.out.println("4.categoryDetail");
    System.out.println(productService.categoriesDetail(1));
    System.out.println("5.categoriesList");
    System.out.println(productService.categoriesList());
    System.out.println("6.findCategoryByCategoryNo");
    System.out.println(productService.findCategoryByCategoryNo(1));
	}

}
