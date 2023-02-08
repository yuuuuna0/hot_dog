<%@page import="com.itwill.hotdog.domain.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.hotdog.domain.OrderItem"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.hotdog.domain.UserInfo"%>
<%@page import="com.itwill.hotdog.domain.Payment"%>
<%@page import="com.itwill.hotdog.domain.Orders"%>
<%@page import="com.itwill.hotdog.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Orders order = new Orders(0, null, 0, 10000, new Payment(1, null), new UserInfo("sy0", null, null, null, 0));
OrderItem orderItem = new OrderItem(0, 3, 0, new Product(1, null, 0, 0, null, null, 0, 0));
List<OrderItem> orderItemList = new ArrayList<OrderItem>();
orderItemList.add(orderItem);
order.setOrderItemList(orderItemList);
int rowCount = new OrdersService().create(order);
%>
<%=rowCount%>