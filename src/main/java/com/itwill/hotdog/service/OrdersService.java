package com.itwill.hotdog.service;

import java.util.List;

import com.itwill.hotdog.domain.Orders;
import com.itwill.hotdog.repository.CartRepository;
import com.itwill.hotdog.repository.OrdersRepository;
import com.itwill.hotdog.repository.ProductRepository;

public class OrdersService {
	
	private static OrdersService _instance;
	
	private OrdersRepository ordersRepository;
	private ProductRepository productRepository;
	private CartRepository cartRepository;
	
	private OrdersService() throws Exception {
		ordersRepository = new OrdersRepository();
		productRepository = new ProductRepository();
		cartRepository = new CartRepository();
	}
	
	//싱글톤 패턴 적용 - 서비스객체는 한 번만 생성된다. (이후에는 재사용)
	public static OrdersService getInstance() throws Exception {
		if(_instance==null) _instance = new OrdersService();
		return _instance;
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
	
	/*
	 * 주문 생성 - 장바구니의 품목 전체주문
	 */
	
	/*
	 * 주문 생성 - 장바구니의 품목에서 선택주문
	 */
}