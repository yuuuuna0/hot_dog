package com.itwill.hotdog.service.test;

import com.itwill.hotdog.domain.Cart;
import com.itwill.hotdog.service.CartService;
import com.itwill.hotdog.service.ProductService;

public class CartServiceTest {

	public static void main(String[] args) throws Exception {
		CartService cartService = new CartService();
		ProductService productService = new ProductService();
		
		Cart addCart = new Cart(0, 1, "sy0", productService.productDetail(1));
		System.out.println("1-1. addCart_insertCart");
		System.out.println(cartService.addCart(addCart));
		System.out.println("1-2. addCart_updateByProductNo");
		System.out.println(cartService.addCart(addCart));
		
		System.out.println("2. updateByCartNo");
		System.out.println(cartService.updateCart(new Cart(12, 3, "sy1", null)));
		
		System.out.println("3-1. deleteCartItem_ByUserId");
		System.out.println(cartService.deleteCartItemByUserId("sy0"));
		System.out.println("3-2. deleteCartItem_ByCartNo");
		System.out.println(cartService.deleteCartItemByCartNo(6));
		
		System.out.println("4-1. getCartListByUserId");
		System.out.println(cartService.getCartListByUserId("sy1"));
		System.out.println("4-2. getCartLIstByCartNo");
		System.out.println(cartService.getCartItemByCartNo(5));
		
		
		
	}

}