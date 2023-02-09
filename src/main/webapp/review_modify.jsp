<%@page import="com.itwill.hotdog.domain.Review" %>
<%@page import="com.itwill.hotdog.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

ReviewService reviewService = new ReviewService();

Integer r_no = null;
try{
	r_no = Integer.valueOf(request.getParameter("r_no"));
}catch (Exception ex){
	
}
if(r_no==null){
	response.sendRedirect("review_list.jsp");
	return;
}

Review review = reviewService.findReviewNo(r_no);
if(review==null){
	response.sendRedirect("reveiw_list.jsp");
	return;
}

String pageno = "1";
if (request.getParameter("pageno") != null) {
	pageno = request.getParameter("pageno");
}
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰수정</title>
<script type="text/javascript">
	function reviewUpdate() {
		if (f.comment.value == "") {
			alert("내용을 입력하세요.");
			f.comment.focus();
			return false;
		}
		if (f.grade.value == "") {
			alert("평점을 입력하세요.");
			f.grade.focus();
			return false;
		}

		f.action = "review_modify_action.jsp";
		f.submit();
	}

	function reviewList() {
		f.action = "review_list.jsp";
		f.submit();
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>리뷰수정</b>
									</td>
								</tr>
							</table> <br> <!-- modify Form  -->
							<form name="f" method="post">
								<input type="hidden" name="pageno" value="<%=pageno%>" /> 
								<input type="hidden" name="r_no" value="<%=review.getR_no()%>" />
													<!-- 구매상품
									<td width=100 align=center bgcolor="E6ECDE" height="22">구매상품</td>
									 -->
								<input type="hidden" style="width: 150px" name="p_no" value="<%=review.getP_no()%>">
									<table border="0" cellpadding="0" cellspacing="1" width="600" bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">작성자</td>
										<td width=500 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="writer" value="<%=review.getU_id()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">평점</td>
										<td width=500 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="grade"></td>
									</tr>
								
									<tr>
										<td width=100 align=center bgcolor="E6ECDE">리뷰내용</td>
										<td width=500 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><textarea name="comment" class="textarea"
												style="width: 350px" rows="14"></textarea></td>
									</tr>
								</table>
							</form>
							
								<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="리뷰수정" onClick="reviewUpdate()"> &nbsp; 
									<input type="button" value="수정취소" onClick="reviewList()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
							
							
								</div>
</body>
</html>