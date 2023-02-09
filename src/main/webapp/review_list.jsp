<%@page import="com.itwill.hotdog.service.ReviewService"%>
<%@page import="com.itwill.hotdog.common.util.PageMaker"%>
<%@page import="com.itwill.hotdog.domain.ReviewListPageMakerDto" %>
<%@page import="com.itwill.hotdog.domain.PageInputDto" %>
<%@page import="com.itwill.hotdog.domain.Review" %>
<%@page import="com.itwill.hotdog.repository.ReviewRepository" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! public String getCommentString(Review review){
	StringBuilder comment = new StringBuilder();
	String c = review.getR_comment();
	if (c.length() > 70) {
		c = String.format("%s...", c.substring(0, 70)); //글자수 길면 ...으로 짤려보이게
	}
	comment.append(c);
	return comment.toString();
}
%>    

<%
ReviewService reviewService = new ReviewService();

//요청페이지번호 (1번)	
String pageno = request.getParameter("pageno");
if(pageno==null||pageno.equals("")){
	pageno="1";
}

	//게시물조회
	ReviewListPageMakerDto reviewListPage = null;
	
	try {
		reviewListPage = reviewService.findReviewList(Integer.parseInt(pageno));
	} catch(NumberFormatException e) {
		response.sendRedirect("review_list.jsp?pageno=1");
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 상품후기 </title>
<script type="text/javascript">
	function reviewCreate() {
		location.href = "review_write.jsp";
	}
</script>
</head>
<body>
	<div id = "content">
	<table border=0 cellpadding=0 cellspacing=0>
	<tr bgcolor="#FFFFFF">
		<td height = "20" class="t1" align="right" valign="bottom">
		총 <font color="#FF0000"><%=reviewListPage.pageMaker.getTotCount()%></font>
		건 | 현재페이지(<font color="#FF0000"><%=reviewListPage.pageMaker.getCurPage()%></font>
		/ <font color="#0000FF"><%=reviewListPage.pageMaker.getTotPage()%></font>)
	</td>
	<tr>
	</table><br>
	<from name="f" method="post" action="">
	<table border ="0" cellpadding="0" cellspacion="1" width="600" bgcolor="BBBBBB">
		<tr>
			<td width=400 align="center" bgcolor="E6ECDE"> 상품후기 </td>
			<td width=30 align="center" bgcolor="E6ECDE"> 평점 </td>
			<td width=70 align="center" bgcolor="E6ECDE"> 아이디 </td>
			<td width=90 align="center" bgcolor="E6ECDE"> 작성일 </td>
		</tr>
 		<%for (Review review : reviewListPage.postList){%>
		<tr>
			<td width=400 bgcolor="ffffff" style="padding-left: 10">
			<a href='review_view.jsp?r_no=<%=review.getR_no()%>&pageno=<%=reviewListPage.pageMaker.getCurPage()%>'><%=this.getCommentString(review)%></a></td>		
			<td width=30 bgcolor="ffffff" align="center"><%=review.getR_grade()%></td>
			<td width=70 bgcolor="ffffff" align="center"><%=review.getU_id() %></td>
			<td width=90 bgcolor="ffffff" style="padding-left: 10"><%=review.getR_date().toString().substring(0,10) %></td>
		</tr>
 			<% } %>
	</table>
</from><br>
		<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
							     
										<%-- 
										 <%if(reviewListPage.pageMaker.getCurBlock() > 1) {%>    
											<a href="./review_list.jsp?pageno=<%=reviewListPage.pageMaker.getBlockBegin()-PageMaker.BLOCK_SCALE%>">◀◀</a>&nbsp;&nbsp;
										 <%}%> 
										 --%>
										 
										 <%if(reviewListPage.pageMaker.getPrevPage()>0) {%>    
											<a href="./review_list.jsp?pageno=<%=reviewListPage.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
										 <%}%>
										
										<%
											for (int i = reviewListPage.pageMaker.getBlockBegin(); i <= reviewListPage.pageMaker.getBlockEnd(); i++) {
										 	if (reviewListPage.pageMaker.getCurPage() == i) {
										%>
										 <font color='red'><strong><%=i%></strong></font>&nbsp;
										<%} else {%>
										<a href="./review_list.jsp?pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
										<%
										   }
										  }%>
										  
										  
										 <%if(reviewListPage.pageMaker.getNextPage() <= reviewListPage.pageMaker.getTotPage()){%>
										  <a href="./review_list.jsp?pageno=<%=reviewListPage.pageMaker.getNextPage()%>">▶&nbsp;</a>
										 <%}%>
										<%-- 							 
										  <%if(reviewListPage.pageMaker.getTotBlock() > reviewListPage.pageMaker.getCurBlock()){%>
										  <a href="./review_list.jsp?pageno=<%=reviewListPage.pageMaker.getBlockBegin()+PageMaker.BLOCK_SCALE%>">▶▶&nbsp;</a>
										 <%}%>
										 --%>
										
									</td>
								</tr>
							</table> 
							
							<!-- 리뷰작성 button -->
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="right"><input type="button" value="리뷰작성"
										onclick="reviewCreate();" /></td>
								</tr>
							</table>

	</div>
</body>
</html>