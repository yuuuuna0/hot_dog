<%@page import="com.itwill.hotdog.domain.Cart"%>
<%@page import="com.itwill.hotdog.service.PaymentService"%>
<%@page import="com.itwill.hotdog.service.ProductService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.hotdog.domain.OrderItem"%>
<%@page import="com.itwill.hotdog.domain.Orders"%>
<%@page import="com.itwill.hotdog.service.CartService"%>
<%@page import="com.itwill.hotdog.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='login_check.jspf' %>
<%
	//주문 클릭 시 주문생성
	if(request.getMethod().equalsIgnoreCase("GET")){
  		response.sendRedirect("product_list.jsp");
  		return;
  	}

	String buyType = request.getParameter("buyType");
	String p_noStr = request.getParameter("p_no");
	String p_qtyStr = request.getParameter("p_qty");
	String p_priceStr = request.getParameter("p_price");
	String o_usedPointStr = request.getParameter("o_usedPoint");
	String pm_noStr = request.getParameter("pm_no");
	String[] cart_item_noStr_array = request.getParameterValues("cart_item_no");
	
	OrdersService ordersService=new OrdersService();
	CartService cartService=new CartService();
	ProductService productService=new ProductService();
	PaymentService paymentService=new PaymentService();
	List<OrderItem> orderItemList=new ArrayList<OrderItem>();
	List<Cart> cartList=new ArrayList<Cart>();
	Cart cartItem=null;
	OrderItem orderItem=null;
	Orders newOrders=null;
	
	
	//ordersService.create(orders);
	if(buyType.equals("direct")){
		newOrders=new Orders(0,null,(Integer.parseInt(p_qtyStr)*Integer.parseInt(p_priceStr)),Integer.parseInt(o_usedPointStr),paymentService.findByPaymentNo(Integer.parseInt(pm_noStr)),sUser);
		ordersService.create(newOrders);

	}else if(buyType.equals("cart_all")){
		cartList=cartService.getCartListByUserId(sUserId);
		int o_tot_price=0;
		int oi_tot_count=0;
		for(Cart cart: cartList){
			orderItem=new OrderItem(0,cart.getC_qty(),0,cart.getProduct());
			orderItemList.add(orderItem);
			o_tot_price+=orderItem.getOi_qty()*orderItem.getProduct().getP_price();
		}
		newOrders=new Orders(0,null,o_tot_price,(Integer.parseInt(o_usedPointStr)),paymentService.findByPaymentNo(Integer.parseInt(pm_noStr)),sUser);
		ordersService.createFromCartAll(newOrders);
	
	}else if(buyType.equals("cart_select")){
		int o_tot_price=0;
		int oi_tot_count=0;
		for(int i=0;i<cart_item_noStr_array.length;i++){
			cartItem=cartService.getCartItemByCartNo(Integer.parseInt(cart_item_noStr_array[i]));
			orderItem=new OrderItem(0,cartItem.getC_qty(),0,cartItem.getProduct());
			orderItemList.add(orderItem);
			o_tot_price+=orderItem.getOi_qty()*orderItem.getProduct().getP_price();
		}
		//newOrders=new Orders(0,null,o_tot_price,Integer.parseInt(o_usedPointStr),paymentService.findByPaymentNo(Integer.parseInt(pm_noStr)),sUser);
		newOrders=new Orders(0,null,o_tot_price,0,paymentService.findByPaymentNo(1),sUser);
		newOrders.setOrderItemList(orderItemList);
		ordersService.createFromCartSelect(newOrders, cart_item_noStr_array);
		
		for(int i=0;i<cart_item_noStr_array.length;i++){
			cartService.deleteCartItemByCartNo(Integer.parseInt(cart_item_noStr_array[i]));
		}
		
	}
	
	
	response.sendRedirect("orders_list_orderitem.jsp");
%>