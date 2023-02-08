<%@page import="com.itwill.hotdog.domain.UserInfo"%>
<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UserInfoService userInfoService = new UserInfoService();
int rowCount = userInfoService.create(new UserInfo("ts1","1111","테스트","111-111",0));
%>
<%= rowCount%>