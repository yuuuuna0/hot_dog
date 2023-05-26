<%@page import="com.itwill.hotdog.domain.UserInfo"%>
<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@page import="com.itwill.hotdog.domain.Review" %>
<%@page import="com.itwill.hotdog.service.ReviewService"%>
<%@page import="com.itwill.hotdog.domain.Product"%>
<%@page import="com.itwill.hotdog.service.ProductService"%>
<%@ include file="login_check.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<%
int p_no = Integer.parseInt(request.getParameter("p_no"));

ReviewService reviewService = new ReviewService();
Review review = new Review();%>

  
<!DOCTYPE html>
<html>

<script type="text/javascript">

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
		f.action = "review_list.jsp?p_no="+<%=p_no%>;
		f.submit();
	}
	
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
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
										<td width=500 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="hidden" style="width: 150px"
											name="p_no" value="<%=p_no%>" ></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">작성자</td>
										<td width=500 bgcolor="ffffff" style="padding-left: 10px"
											align="left">
											<input type="text" name="u_id" value="<%=sUserId %>" disabled >
									</tr> 
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">평점</td>
										<td width=500 bgcolor="ffffff" style="padding-left: 10px"
											align="left">	<select id="r_grade" name="grade">
												<option name = "r_grade" value="" selected disabled>평점을 선택하세요. 
												<option name = "r_grade" value="1">1
												<option name = "r_grade" value="2">2
												<option name = "r_grade" value="3">3
												<option name = "r_grade" value="4">4
												<option name = "r_grade" value="5">5
												<option name = "r_grade" value="6">6
												<option name = "r_grade" value="7">7
												<option name = "r_grade" value="8">8
												<option name = "r_grade" value="9">9
												<option name = "r_grade" value="10">10
											</select> 점
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