<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>      
<%
	session.invalidate();
	response.sendRedirect("hotdog_main.jsp");
%>