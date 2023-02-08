<%@page import="com.itwill.hotdog.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='login_check.jspf' %>
<%
	String o_noStr=request.getParameter("o_no");
	if(o_noStr==null || o_noStr.equals("")){
		response.sendRedirect("orders_list.orderitem.jsp");
		return;
	}
	OrdersService ordersService=new OrdersService();
	ordersService.findDetail(Integer.parseInt("o_noStr"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

</body>
</html>