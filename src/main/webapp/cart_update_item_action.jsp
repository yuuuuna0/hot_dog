<%@page import="com.itwill.hotdog.domain.Cart"%>
<%@page import="com.itwill.hotdog.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>    
<%
    if(request.getMethod().equalsIgnoreCase("GET")){
    		response.sendRedirect("product_list.jsp");
    		return;
    	}
    	String cart_noStr=request.getParameter("cart_no");
    	String cart_qtyStr=request.getParameter("cart_qty");
    	CartService cartService=new CartService();
    	
    	Cart cart = new Cart(Integer.parseInt(cart_noStr),Integer.parseInt(cart_qtyStr),null,null);
    	if(cart_qtyStr.equals("0")){
    		cartService.deleteCartItemByCartNo(Integer.parseInt(cart_noStr));
    	}else{
    		cartService.updateCart(cart);
    	}
    	
    	response.sendRedirect("cart_view_select_update_qyt_all_check_delete_image.jsp");
    	
    %>