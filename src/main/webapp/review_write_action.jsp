<%@page import="com.itwill.hotdog.domain.Review" %>
<%@page import="com.itwill.hotdog.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("review_list.jsp");
		return;
	}
	ReviewService reviewService = new ReviewService(); 
	Review review=new Review();
	int p_no = Integer.parseInt(request.getParameter("p_no"));
	int grade = Integer.parseInt(request.getParameter("grade"));
	review.setU_id(request.getParameter("writer"));
	review.setR_comment(request.getParameter("comment"));
	review.setP_no(p_no);
	review.setR_grade(grade);


	
	reviewService.createReview(review);
	response.sendRedirect("review_list.jsp");
%>
