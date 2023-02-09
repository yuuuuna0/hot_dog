package com.itwill.hotdog.service;

import java.util.List;

import com.itwill.hotdog.domain.Cart;
import com.itwill.hotdog.repository.CartRepository;



public class CartService {
	private CartRepository cartRepository;
	public CartService() throws Exception {
		cartRepository=new CartRepository();
	}
	/*
	 * 카트 insert
	 */
	
	public int addCart(Cart cart)throws Exception {
		if(cartRepository.countByProductNo(cart.getU_id(),cart.getProduct().getP_no()) > 0) {
			return cartRepository.updateByProductNo(cart);
		}else {
			return cartRepository.insertCart(cart);
		}
	}
	/*
	 * 카트 update
	 */
	
	public int updateCart(Cart cart)throws Exception {
		return cartRepository.updateByCartNo(cart);
	}
	/*
	 * 카트리스트 전체 보기
	 */
	public List<Cart> getCartListByUserId(String u_id) throws Exception{
		return cartRepository.findByUserId(u_id);
	}
	/*
	 * 카트아이템1개보기
	 */
	public Cart getCartItemByCartNo(int c_no) throws Exception{
		return cartRepository.findByCartNo(c_no);
	}
	
	/*
	 * 카트아이템1개삭제
	 */
	public int deleteCartItemByCartNo(int c_no) throws Exception{
		return cartRepository.deleteByCartNo(c_no);
	}
	/*
	 * 카트 리스트 전체 삭제
	 */
	public int deleteCartItemByUserId(String u_id)throws Exception {
		return cartRepository.deleteByUserId(u_id);
	}
}
	
	