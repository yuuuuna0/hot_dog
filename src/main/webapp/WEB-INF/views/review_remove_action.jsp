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




