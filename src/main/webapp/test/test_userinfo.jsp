<%@page import="com.itwill.hotdog.domain.UserInfo"%>
<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UserInfoService userInfoService = new UserInfoService();
	int rowCount = userInfoService.create(new UserInfo("ts9","1111","테스트","111-111",0));
	//int rowCount = userInfoService.create(new UserInfo("ts9","1111","테스트","111-111",0));
	//int rowCount = userInfoService.login("ts9", "1234");
	//UserInfo rowCount = userInfoService.findUser("ts9");
	//int rowCount = userInfoService.update(new UserInfo("ts9","2222","바껴라","222-222",1000));
	//int rowCount = userInfoService.remove("ts9");
%>
<%= rowCount%>