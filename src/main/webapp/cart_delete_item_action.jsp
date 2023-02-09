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
    	CartService cartService=new CartService();
    	cartService.deleteCartItemByCartNo(Integer.parseInt(cart_noStr));
    	response.sendRedirect("cart_view_select_update_qyt_all_check_delete_image.jsp");
    
    %>