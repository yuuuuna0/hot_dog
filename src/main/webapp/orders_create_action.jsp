<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@page import="com.itwill.hotdog.domain.Product"%>
<%@page import="com.itwill.hotdog.domain.Payment"%>
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
	//String p_priceStr = request.getParameter("p_price");
	String o_usedPointStr = request.getParameter("o_usedPoint");
	String pm_noStr = request.getParameter("pm_no");
	String add_pointStr=request.getParameter("add_point");
	String[] cart_item_noStr_array = request.getParameterValues("cart_item_no");
	
	OrdersService ordersService=new OrdersService();
	CartService cartService=new CartService();
	ProductService productService=new ProductService();
	PaymentService paymentService=new PaymentService();
	UserInfoService userInfoService=new UserInfoService();
	List<OrderItem> orderItemList=new ArrayList<OrderItem>();
	List<Cart> cartList=new ArrayList<Cart>();
	Cart cartItem=null;
	OrderItem orderItem=null;
	Orders newOrders=null;
	
	//기존포인트 - (사용포인트+적립포인트) 반영한 값을 user에 넣어줌
	int new_u_point=sUser.getU_point()+Integer.parseInt(add_pointStr)-Integer.parseInt(o_usedPointStr);
	userInfoService.updatPoint(sUserId, new_u_point);
	
	
	//상품에서 직접 주문시 필요한 값을 Orders객체에 넣어서 전달해야 한다.
	if(buyType.equals("direct")){
		newOrders = new Orders(0,
							   null,
							   Integer.parseInt(p_qtyStr) * productService.productDetail(Integer.parseInt(p_noStr)).getP_price(),
							   Integer.parseInt(o_usedPointStr),
							   paymentService.findByPaymentNo(Integer.parseInt(pm_noStr)),
							   sUser);
		orderItem = new OrderItem(0,
								  Integer.parseInt(p_qtyStr),
								  0,
								  new Product(Integer.parseInt(p_noStr), null, productService.productDetail(Integer.parseInt(p_noStr)).getP_price(), 0, null, null, 0, null));
		orderItemList.add(orderItem);
		newOrders.setOrderItemList(orderItemList);
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
		Payment payment=paymentService.findByPaymentNo(Integer.parseInt(pm_noStr));
		newOrders=new Orders(0, null, 0, Integer.parseInt(o_usedPointStr), payment, sUser);
		ordersService.createFromCartSelect(newOrders, cart_item_noStr_array);
		
		for(int i=0;i<cart_item_noStr_array.length;i++){
			cartService.deleteCartItemByCartNo(Integer.parseInt(cart_item_noStr_array[i]));
		}
		
	}
	
	response.setHeader("Refresh", "0; URL=hotdog_main.jsp"); 
	return;
	//response.sendRedirect("hotdog_main.jsp");
%>