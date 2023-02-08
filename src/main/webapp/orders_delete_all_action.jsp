<%@page import="com.itwill.hotdog.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='login_check.jspf'%>
<% //1. 전체 주문 삭제
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("order_list.jsp");
	return;
}

OrdersService ordersService=new OrdersService();
ordersService.deleteAll(sUserId);
response.sendRedirect("order_list.jsp");

%>
