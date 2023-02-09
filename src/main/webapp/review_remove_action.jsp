<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.itwill.hotdog.domain.Review" %>
<%@page import="com.itwill.hotdog.service.ReviewService"%>

<%
	ReviewService reviewService = new ReviewService();
	Integer r_no = null;
	Integer pageno = null;
	
	try {
		r_no = Integer.valueOf(request.getParameter("r_no"));
		pageno = Integer.valueOf(request.getParameter("pageno"));
	} catch (Exception ex) {
	}
	boolean result = true;
	String msg = "";
	if (r_no == null) {
		result = false;
		msg = "삭제실패";
	} else {
		try {
			reviewService.remove(r_no);
			result = true;
			msg = "삭제성공";
		} catch (Exception e) {
			result = false;
			msg = "삭제실패:" + e.getMessage();
		}
	}
%>
<script type="text/javascript">
<%if (result) {%>
	alert('<%=msg%>');
	location.href='review_list.jsp?pageno=<%=pageno%>';
<%} else {%>
	alert('<%=msg%>');
	//history.back();
	location.href='review_list.jsp?pageno=<%=pageno%>';
<%}%>
	
</script>




