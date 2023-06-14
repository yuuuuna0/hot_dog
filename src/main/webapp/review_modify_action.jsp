<%@page import="com.itwill.hotdog.domain.Review" %>
<%@page import="com.itwill.hotdog.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//post 요청인 경우 요청 데이터에 한글 문자셋으로 설정
if (request.getMethod().toLowerCase().equals("post")) {
	 
}

Review review = new Review();
ReviewService reviewService = new ReviewService();
int r_no = Integer.parseInt(request.getParameter("r_no"));
int grade = Integer.parseInt(request.getParameter("grade"));

review.setR_no(r_no);
review.setR_comment(request.getParameter("comment"));
review.setR_grade(grade);

reviewService.updateReview(review);

String pageno = "1";
if (request.getParameter("pageno") != null) {
	pageno = request.getParameter("pageno");
}

response.sendRedirect(
		String.format("review_view.jsp?r_no=%d&pageno=%s",
		review.getR_no(), pageno));

%>