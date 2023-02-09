<%@page import="com.itwill.hotdog.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='login_check.jspf'%>
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("orders_list_orderitem.jsp");
	return;
}
String o_noStr=request.getParameter("o_no");
OrdersService ordersService=new OrdersService();
ordersService.delete(Integer.parseInt(o_noStr));
response.sendRedirect("orders_list_orderitem.jsp");
%>