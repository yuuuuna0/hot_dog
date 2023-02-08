<%@page import="com.itwill.hotdog.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int rowCount = new OrdersService().deleteAll("sy0");
%>
<%=rowCount%>