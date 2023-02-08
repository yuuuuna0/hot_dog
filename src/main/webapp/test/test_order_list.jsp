<%@page import="com.itwill.hotdog.domain.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.hotdog.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<Orders> orderList = new OrdersService().findAll("sy0");
%>
<%=orderList%>