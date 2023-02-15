<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@page import="com.itwill.hotdog.domain.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   if(request.getMethod().equalsIgnoreCase("get")){
      response.sendRedirect("user_write_form.jsp");
      return;
   }

   String userId = request.getParameter("userId");
   String password = request.getParameter("password");
   String name = request.getParameter("name");
   String phone = request.getParameter("phone");
   
   UserInfo newUser = null;
   try {
      newUser = new UserInfo(userId,password,name,phone,0);
      System.out.println(newUser);
      UserInfoService userService = new UserInfoService();
      int result = userService.create(newUser);
      if(result == 1){
         // 회원가입 성공.
         response.sendRedirect("user_login_form.jsp");
      } 
   } catch (Exception e) {
      e.printStackTrace();
      response.sendRedirect("user_write_form.jsp");
   }
   
   
   
%>