<%@page import="com.itwill.hotdog.domain.Review" %>
<%@page import="com.itwill.hotdog.service.ReviewService"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//Review 객체를 생성하고 입력된데이타를 읽어서 객체에저장
	Review review = new Review();
	ReviewService reviewService = new ReviewService();
//댓글의 대상글번호를 읽어서 변수에 저장
	if(request.getParameter("r_no")==null){
		response.sendRedirect("review_list.jsp");
		return;
	}
	int r_no = Integer.parseInt(request.getParameter("r_no"));
	review = reviewService.findReviewNo(r_no);
	

	/*
	원글boardno
	*/
	review.setR_no(Integer.parseInt(request.getParameter("r_no")));
	/*
	답글 데이타
	*/
	int p_no = Integer.parseInt(request.getParameter("p_no"));
	review.setU_id(request.getParameter("rewriter"));
	review.setR_comment(request.getParameter("recomment"));
	review.setP_no(p_no);

	reviewService.createReply(review);
	String pageno = "1";
	if (request.getParameter("pageno") != null) {
		pageno = request.getParameter("pageno");
	}
	
	response.sendRedirect(
			String.format("review_view.jsp?r_no=%d&pageno=%s",
			review.getR_no(), pageno));

%>