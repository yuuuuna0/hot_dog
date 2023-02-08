package com.itwill.hotdog.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.hotdog.domain.Cart;
import com.itwill.hotdog.domain.OrderItem;
import com.itwill.hotdog.domain.Orders;
import com.itwill.hotdog.domain.Payment;
import com.itwill.hotdog.domain.Product;
import com.itwill.hotdog.domain.UserInfo;
import com.itwill.hotdog.repository.CartRepository;
import com.itwill.hotdog.repository.OrdersRepository;
import com.itwill.hotdog.repository.ProductRepository;

public class OrdersService {
	
	private OrdersRepository ordersRepository;
	private ProductRepository productRepository;
	private CartRepository cartRepository;
	
	public OrdersService() throws Exception {
		ordersRepository = new OrdersRepository();
		productRepository = new ProductRepository();
		cartRepository = new CartRepository();
	}
	
	/*
	 * 주문 전체삭제
	 */
	public int deleteAll(String sUserId) throws Exception {
		return ordersRepository.deleteAll(sUserId);
	}
	
	/*
	 * 주문 1건 삭제 (선택삭제)
	 */
	public int delete(int o_no) throws Exception {
		return ordersRepository.delete(o_no);
	}
	
	/*
	 * 주문 목록 - 특정 사용자의 주문내역을 전체검색
	 */
	public List<Orders> findAll(String sUserId) throws Exception {
		return ordersRepository.findAll(sUserId);
	}
	
	/*
	 * 주문+주문아이템 목록 - 특정 사용자의 주문상세내역을 전체검색
	 */
	public List<Orders> findDetailAll(String sUserId) throws Exception {
		return ordersRepository.findDetailAll(sUserId);
	}
	
	/*
	 * 주문+주문아이템 상세보기 - 특정 사용자의 주문상세내역을 1개 검색
	 */
	public Orders findDetail(int o_no) throws Exception {
		return ordersRepository.findDetail(o_no);
	}
	
	/*********************다른 파트의 Repository 필요. (Product, Cart)*********************/
	/*
	 * 주문 생성 - 상품에서 직접주문
	 */
	public int create(Orders order) throws Exception {
		Product product = productRepository.findByPrimaryKey(order.getOrderItemList().get(0).getProduct().getP_no());
		OrderItem orderItem = new OrderItem(0, order.getOrderItemList().get(0).getOi_qty(), 0, product);
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		orderItemList.add(orderItem);
		Orders newOrder = new Orders(0,
									 null,
									 orderItem.getOi_qty() * orderItem.getProduct().getP_price(),
									 order.getO_usedPoint(),
									 new Payment(order.getPayment().getPm_no(), null),
									 new UserInfo(order.getUserInfo().getU_id(), null, null, null, 0));
		newOrder.setOrderItemList(orderItemList);
		
		return ordersRepository.insert(newOrder);
	}
	
	/*
	 * 주문 생성 - 장바구니의 품목 전체주문
	 */
	public int createFromCartAll(Orders order) throws Exception {
		List<Cart> cartList = cartRepository.findByUserId(order.getUserInfo().getU_id());
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		int o_totalPrice = 0;
		for(Cart cart : cartList) {
			OrderItem orderItem = new OrderItem(0, cart.getC_qty(), 0, cart.getProduct());
			orderItemList.add(orderItem);
			o_totalPrice += orderItem.getOi_qty() * orderItem.getProduct().getP_price();
		}
		Orders newOrder = new Orders(0,
				 					 null,
				 					 o_totalPrice,
				 					 order.getO_usedPoint(),
				 					 new Payment(order.getPayment().getPm_no(), null),
				 					 new UserInfo(order.getUserInfo().getU_id(), null, null, null, 0));
		newOrder.setOrderItemList(orderItemList);
		int rowCount = ordersRepository.insert(newOrder);
		cartRepository.deleteByUserId(order.getUserInfo().getU_id());
		
		return rowCount;
	}
	
	
	/*
	 * 주문 생성 - 장바구니의 품목에서 선택주문
	 */
	public int createFromCartSelect(Orders order, String[] cart_noStr_array) throws Exception {
		
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		int o_totalPrice = 0;
		for(int i=0; i<cart_noStr_array.length; i++) {
			Cart cartItem = cartRepository.findByCartNo(Integer.parseInt(cart_noStr_array[i]));
			OrderItem orderItem = new OrderItem(0, cartItem.getC_qty(), 0, cartItem.getProduct());
			orderItemList.add(orderItem);
			o_totalPrice += orderItem.getOi_qty() * orderItem.getProduct().getP_price();
		}
		Orders newOrder = new Orders(0,
									 null,
									 o_totalPrice,
									 order.getO_usedPoint(),
									 new Payment(order.getPayment().getPm_no(), null),
									 new UserInfo(order.getUserInfo().getU_id(), null, null, null, 0));
		newOrder.setOrderItemList(orderItemList);
		int rowCount = ordersRepository.insert(newOrder);
		for(int i=0; i<cart_noStr_array.length; i++) {
			cartRepository.deleteByCartNo(Integer.parseInt(cart_noStr_array[i]));
		}
		
		return rowCount;
	}
	
}