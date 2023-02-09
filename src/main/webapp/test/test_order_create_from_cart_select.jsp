<%@page import="com.itwill.hotdog.domain.UserInfo"%>
<%@page import="com.itwill.hotdog.domain.Payment"%>
<%@page import="com.itwill.hotdog.domain.Orders"%>
<%@page import="com.itwill.hotdog.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Orders order = new Orders(0, null, 0, 20000, new Payment(2, null), new UserInfo("sy1", null, null, null, 0));
String[] cart_noStr_array = {"1", "2"};
int rowCount = new OrdersService().createFromCartSelect(order, cart_noStr_array);
%>
<%=rowCount%>