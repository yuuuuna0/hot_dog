<%@page import="com.itwill.hotdog.domain.Cart"%>
<%@page import="com.itwill.hotdog.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>   
<%	
    if(request.getMethod().equalsIgnoreCase("GET")){
    		response.sendRedirect("product_list.jsp");
    		return;
    	}
		
		String cart_no=request.getParameter("cart_no");
    	String cart_qty=request.getParameter("cart_qty");
    	
    	CartService cartService=new CartService();
    	Cart cart=new Cart(Integer.parseInt(cart_no),Integer.parseInt(cart_qty),null,null);
    	
    	if(cart_qty.equals("0")){
    		cartService.deleteCartItemByCartNo(Integer.parseInt(cart_no));
    	}else{
    		cartService.updateCart(cart);
    	}
    	response.sendRedirect("cart_view_select_update_qty.jsp");
    	
    	/*
    	response.sendRedirect("cart_view_select_update_qyt_all_check_delete_image.jsp");
    	*/
    %>