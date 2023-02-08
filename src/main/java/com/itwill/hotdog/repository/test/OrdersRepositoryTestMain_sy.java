package com.itwill.hotdog.repository.test;

import java.util.List;

import com.itwill.hotdog.domain.OrderItem;
import com.itwill.hotdog.domain.Orders;
import com.itwill.hotdog.domain.Payment;
import com.itwill.hotdog.domain.Product;
import com.itwill.hotdog.domain.UserInfo;
import com.itwill.hotdog.repository.OrdersRepository;

public class OrdersRepositoryTestMain_sy {

	public static void main(String[] args) throws Exception {
		OrdersRepository ordersRepository = new OrdersRepository();
		int rowCount = 0;
		
		/*
		 * 주문 전체삭제
		 */
		/*
		rowCount = ordersRepository.deleteAll("sy0");
		System.out.println(rowCount);
		*/
		
		/*
		 * 주문 1건 삭제 (선택삭제)
		 */
		/*
		rowCount = ordersRepository.delete(3);
		System.out.println(rowCount);
		*/
		
		/*
		 * 주문 생성
		 */
		/*
		Orders orders = new Orders(0, null, 49000, 1000, new Payment(1, null), new UserInfo("sy0", null, null, null, 0));
		orders.getOrderItemList().add(new OrderItem(0, 2, 0, new Product(1, "강아지사료1", 10000, 10, "강아지사료1입니다.", "default.jpg", 0, 1)));
		orders.getOrderItemList().add(new OrderItem(0, 3, 0, new Product(4, "강아지간식1", 10000, 15, "강아지간식1입니다.", "default.jpg", 0, 2)));
		rowCount = ordersRepository.insert(orders);
		System.out.println(rowCount);
		*/
		
		/*
		 * 주문 전체검색 (특정 사용자) - orders, payment, userinfo 테이블 JOIN
		 */
		/*
		List<Orders> orderList = ordersRepository.findAll("sy0");
		for(Orders orders : orderList) {
			System.out.println(orders);
		}
		*/
		
		/*
		 * 주문 상세보기 전체검색 (특정 사용자) - orders, payment, userinfo, order_item, product 테이블 JOIN
		 */
		/*
		List<Orders> orderList2 = ordersRepository.findDetailAll("sy0");
		for(Orders orders : orderList2) {
			System.out.println(orders);
		}
		*/
		
		/*
		 * 주문 상세보기 1개 검색 (특정 사용자) - orders, payment, userinfo, order_item, product 테이블 JOIN
		 */
		/*
		Orders orders2 = ordersRepository.findDetail(5);
		System.out.println(orders2);
		*/
	}
}