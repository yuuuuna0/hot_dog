<%@page import="com.itwill.hotdog.service.DeliveryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>    
<%
    if(request.getMethod().equalsIgnoreCase("GET")){
    		response.sendRedirect("orders_delivery_choose.jsp");
    		return;
    	}
		String[] d_noStr_array=request.getParameterValues("d_no");
		
		DeliveryService deliveryService=new DeliveryService();
		for(String d_noStr: d_noStr_array){
			deliveryService.deleteByDeliberyyNo(Integer.parseInt(d_noStr));
    		response.sendRedirect("orders_delivery_choose.jsp");
		}
    %>