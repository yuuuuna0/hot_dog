<%@page import="com.itwill.hotdog.service.DeliveryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>    
<%
    if(request.getMethod().equalsIgnoreCase("GET")){
   		response.sendRedirect("orders_delivery_choose.jsp");
   		return;
   	}
	String d_noStr = request.getParameter("d_no");
	DeliveryService deliveryService=new DeliveryService();
	deliveryService.deleteByDeliberyyNo(Integer.parseInt(d_noStr));
	response.sendRedirect("orders_delivery_choose.jsp");
%>