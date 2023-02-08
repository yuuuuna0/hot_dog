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
	orderItemList.add(new OrderItem(0,(Integer.parseInt(p_qtyStr)*Integer.parseInt(p_priceStr)),0,productService.productDetail(Integer.parseInt(p_noStr))));
	Orders orders=null;
	
	
	//ordersService.create(orders);
	if(buyType.equals("direct")){
		orders=new Orders(0,null,(Integer.parseInt(p_qtyStr)*Integer.parseInt(p_priceStr)),Integer.parseInt(o_usedPointStr),paymentService.findByPaymentNo(Integer.parseInt(pm_noStr)),sUser);
		ordersService.create(orders);
	}else if(buyType.equals("cart_all")){
		orders=new Orders();
		
	}else if(buyType.equals("cart_select")){
		
	}
	
	
	response.sendRedirect("order_list.jsp");
%>