<%@page import="com.itwill.hotdog.domain.Orders"%>
<%@page import="com.itwill.hotdog.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Orders order = new OrdersService().findDetail(2);
%>
<%=order%>