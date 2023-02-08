<%@page import="com.itwill.hotdog.domain.Product"%>
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
       	/*
       	1.파라메타받기(cart_qty,p_no)
       	2.장바구니에 제품을담고 cart_view.jsp로redirection
       	*/
       	String c_qty=request.getParameter("c_qty");
       	String p_no=request.getParameter("p_no");
       	
       	CartService cartService=new CartService();
       	cartService.addCart(new Cart(0,Integer.parseInt(c_qty),sUserId,
       			            new Product(Integer.parseInt(p_no),null,0,0,null,null,0,0)));
       	
       	response.sendRedirect("cart_view.jsp");
     
       %>