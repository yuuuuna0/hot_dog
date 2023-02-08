<%@page import="com.itwill.hotdog.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int rowCount = OrdersService.getInstance().deleteAll("sy0");
%>
<%=rowCount%>