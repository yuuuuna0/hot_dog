<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>    
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("user_main.jsp");
	return;	
}
try{
	UserInfoService userService=new UserInfoService();
	int removeRowCount=userService.remove(sUserId);
	response.sendRedirect("user_logout_action.jsp");
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("user_error.jsp");
}	
%>