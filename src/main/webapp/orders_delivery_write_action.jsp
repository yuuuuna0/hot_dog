<%@page import="com.itwill.hotdog.service.DeliveryService"%>
<%@page import="com.itwill.hotdog.domain.Delivery"%>
<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@page import="com.itwill.hotdog.domain.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="login_check.jspf" %>
<%
   if(request.getMethod().equalsIgnoreCase("get")){
      response.sendRedirect("orders_delivery_write_form.jsp");
      return;
   }

   String deliveryName = request.getParameter("deliveryName");
   String deliveryAddress = request.getParameter("deliveryAddress");
   Delivery newDelivery=null;
   
   newDelivery = new Delivery(0, deliveryName, deliveryAddress, sUserId);
   DeliveryService deliveryService = new DeliveryService();
   int result = deliveryService.create(newDelivery);
   if(result == 1) {
      //배송지입력 성공
      response.sendRedirect("orders_delivery_choose.jsp");
   }
   if(result == 0) {
	  //배송지입력 실패
	  response.sendRedirect("orders_delivery_write_form.jsp");
   }
%>