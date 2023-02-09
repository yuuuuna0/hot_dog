<%@page import="com.itwill.hotdog.domain.ReviewListPageMakerDto"%>
<%@page import="com.itwill.hotdog.domain.Review" %>
<%@page import="com.itwill.hotdog.service.ReviewService"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Integer r_no=null;
	int pageno=1;
	try{
		r_no=Integer.parseInt(request.getParameter("r_no"));
		pageno=Integer.parseInt(request.getParameter("pageno"));
	}catch(Exception e){
		
	}
	if(r_no==null){
		//목록으로이동
		response.sendRedirect("review_list.jsp?pageno="+pageno);
		return;
	}
	
	ReviewService reviewService = new ReviewService();
	Review reviews = new Review();
	
	Review review = reviewService.findReviewNo(r_no);
	if(review==null){
		response.sendRedirect("review_list.jsp?pageno="+pageno);
		return;
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기</title>

<script language="JavaScript">

	function reviewList() {
		f.action = "review_list.jsp?pageno="+<%=pageno%>;
		f.submit();
	}
	
	function reviewReplyCreate() {

		if (f.recomment.value == "") {
			alert("내용을 입력하세요.");
			f.recomment.focus();
			return false;
		}

		f.action = "review_reply_write_action.jsp";
		f.method="POST";
		f.submit();
		}	
	
	function reviewUpdate() {
		document.f.action = "review_modify.jsp";
		document.f.submit();
	}
	
	function reviewRemove() {
		if (confirm("정말 삭제하시겠습니까?")) {
			document.f.action = "review_remove_action.jsp";
			document.f.submit();
		}
	}
	
</script>
</head>
<body>
	<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b> 상품후기 상세보기 </b>
									</td>
								</tr>
							</table> <br>
							<!-- view Form  -->
							<form name="f" method="post">
								<input type="hidden" name="r_no" value="<%=review.getR_no()%>">
								<input type="hidden" name="pageno" value="<%=pageno%>">
								<table border="0" cellpadding="0" cellspacing="1" width="600"
									bgcolor="BBBBBB">
									<tr>
									<!-- 구매상품
									<td width=100 align=center bgcolor="E6ECDE" height="22">구매상품</td>
									 -->
										<td width=500 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="hidden" style="width: 150px"
											name="p_no" value="<%=review.getP_no()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">작성자</td>
										<td width=500 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=review.getU_id()%></td>
									</tr>

									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">평점</td>
										<td width=500 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=review.getR_grade()%></td>
									</tr>
									
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품후기</td>
										<td width=500 bgcolor="ffffff" height="180px"
											style="padding-left: 10px" align="left"><%= review.getR_comment().replace("\n","<br/>")%><br />

									</tr>
									<tr>
									<!-- 	<td width=100 align=center bgcolor="E6ECDE" height="22">댓글작성자</td> -->
										<td width=500 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="hidden" style="width: 150px"
											name="rewriter" value="sy1"></td>
									</tr>
									
									<tr>
										<td width=100 align=center bgcolor="E6ECDE">댓글</td>
										<td width=500 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><textarea name="recomment" class="textarea"
												style="width: 500px" rows="14"></textarea></td>
									</tr>
									
								</table>

							</form> <br>
									<table width=600 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
										<input type="button" value="댓글달기" onClick="reviewReplyCreate()"> &nbsp; 
										<input type="button" value="리뷰수정" onClick="reviewUpdate()"> &nbsp; 
										<input type="button" value="리뷰삭제" onClick="reviewRemove()"> &nbsp; 
										<input type="button" value="목록보기" onClick="reviewList()"></td>
										</tr>
							</table></td>
							
							</tr>
							</table>	
						</div>				
</body>
</html>