<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@page import="com.itwill.hotdog.domain.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>     
<%
	if(request.getMethod().equals("GET")){
		response.sendRedirect("hotdog_main.jsp");
		return;
	}
	try{
		request.setCharacterEncoding("UTF-8");
		String password=request.getParameter("u_password");
		String name=request.getParameter("u_name");
		String phone=request.getParameter("u_phone");
		UserInfo user=new UserInfo(sUserId,password,name,phone,0);
		UserInfoService userService=new UserInfoService();
		int updateRowCount=userService.update(user);
		
		response.sendRedirect("user_view.jsp");
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("user_error.jsp");
	}
	
%>






