<%@page import="com.itwill.hotdog.domain.Review" %>
<%@page import="com.itwill.hotdog.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
ReviewService reviewService = new ReviewService();
Review review = new Review();
%>
    
    
<!DOCTYPE html>
<html>

<script language="JavaScript">

	function reviewCreate() {
	if (f.grade.value == "") {
		alert("평점을 입력하세요.");
		f.grade.focus();
		return false;
	}

	if (f.comment.value == "") {
		alert("내용을 입력하세요.");
		f.comment.focus();
		return false;
	}

	f.action = "review_write_action.jsp";
	f.method="POST";
	f.submit();
}	
	
	function reviewList() {
		f.action = "review_list.jsp"
		f.submit();
	}
	
</script>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
</head>
<body>
<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>새 리뷰작성</b></td>
								</tr>
							</table> <br> 
							
							<!-- write Form  -->
							<form name="f" method="post">

								<table border="0" cellpadding="0" cellspacing="1" width="600"
									bgcolor="BBBBBB">
									<tr>
				
									<td width=100 align=center bgcolor="E6ECDE" height="22">구매상품</td>
										<td width=500 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="p_no" value="<%=review.getP_no()%>"></td>
									</tr>
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
							</form> <br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
									<input type="button" value="리뷰등록" onClick="reviewCreate()"> &nbsp; 
										<input type="button" value="작성취소" onClick="reviewList()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
</body>
</html>