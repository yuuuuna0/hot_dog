package com.itwill.hotdog.repository.test;
import com.itwill.hotdog.domain.Cart;

import com.itwill.hotdog.domain.Product;
import com.itwill.hotdog.repository.CartRepository;
import com.itwill.hotdog.repository.ProductRepository;
public class CartRepositoryTest {
	public static void main(String[] args) throws Exception{
		CartRepository cartRepository = new CartRepository();
		ProductRepository productRepository = new ProductRepository();
		
		System.out.println("1. countByProductNo");
		System.out.println(cartRepository.countByProductNo("sy0", 1));
		
		System.out.println("2. insertCart");
		Cart insertCart = new Cart(0, 4,"sy1",productRepository.findByPrimaryKey(4));
		System.out.println(cartRepository.insertCart(insertCart));
	   
		
		System.out.println("3. deleteByUserId");
		System.out.println(cartRepository.deleteByUserId("sy0"));
		
		System.out.println("4. deleteByCartNo");
		System.out.println(cartRepository.deleteByCartNo(4));
		
		System.out.println("5.updateByProductNo->UserId사용해서");
		Cart updateCartByProductNo = new Cart(0, 4, "sy1", productRepository.findByPrimaryKey(4));
		System.out.println(cartRepository.updateByProductNo(updateCartByProductNo));
		
		
		System.out.println("6. updateByCartNo");
		System.out.println(cartRepository.updateByCartNo(new Cart(0, 5, "sy1", null)));
		
		
		System.out.println("7. findByUserId");
		System.out.println(cartRepository.findByUserId("sy1"));
		
		System.out.println("8. findByCartNo");
		System.out.println(cartRepository.findByCartNo(5));
	
		
		
	
	}
	
	

}
