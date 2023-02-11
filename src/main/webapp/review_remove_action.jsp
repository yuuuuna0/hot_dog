<%@page import="com.itwill.hotdog.exception.ReviewException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.itwill.hotdog.domain.Review" %>
<%@page import="com.itwill.hotdog.service.ReviewService"%>
<%@ include file="login_check.jspf" %>
<%
ReviewService reviewService = new ReviewService();

Integer r_no = null;
Integer pageno = null;
Integer p_no = null;

/*
try {
	r_no = Integer.valueOf(request.getParameter("r_no"));
	pageno = Integer.valueOf(request.getParameter("pageno"));
	p_no = Integer.valueOf(request.getParameter("p_no"));
	
}catch(Exception ex){
	
}
boolean result = true;
String msg = "";
if(r_no == null){
	result = false;
	msg = "게시물 삭제 완료";
} else 
	try{
		reviewService.remove(r_no);
		result = true;
		msg = "게시물 삭제 완료";
	} catch (ReviewException e){
		result = false;
		msg = "게시물 삭제 실패 :"+ e.getMessage();
	}*/

	boolean result = true;
	String msg = "";
	
	//게시글 작성자와 로그인한 유저가 같아야 삭제가능
	String u_id=request.getParameter("u_id");
	pageno = Integer.valueOf(request.getParameter("pageno"));
	p_no = Integer.valueOf(request.getParameter("p_no"));
	if(!sUserId.equals(u_id)){
		result=false;
		msg = "자신의 게시글만 지울수 있습니다.";
	}
	else{
		try {
			r_no = Integer.valueOf(request.getParameter("r_no"));
		} catch (Exception ex) {
		}
		
		/**************************************/
		if (r_no == null) {
			result = false;
			msg = "삭제실패";
		} else {
			try {
				reviewService.remove(r_no);
				result = true;
				msg = "삭제성공";
			} catch (ReviewException e) {
				result = false;
				msg = "삭제실패:" + e.getMessage();
			}
		}
	}
%>

<script type="text/javascript">
<%if (result) {%>
	alert('<%=msg%>');
	location.href='review_list.jsp?pageno=<%=pageno%>&p_no=<%=p_no%>';
<%} else {%>
	alert('<%=msg%>');
	//history.back();
	location.href='review_list.jsp?pageno=<%=pageno%>&p_no=<%=p_no%>';
<%}%>
	
</script>




