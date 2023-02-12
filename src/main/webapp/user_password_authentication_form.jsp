<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.hotdog.domain.UserInfo"%>
<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>     
<%
	UserInfoService userService=new UserInfoService();
	UserInfo user = userService.findUser(sUserId);
	System.out.println(user);
	
	String requestType = request.getParameter("requestType");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내정보</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<script type="text/javascript">
	function passwordAuthentication(password) {
		if(<%=user.getU_password()%>!=password) {
			alert('비밀번호를 확인해주세요.')
			return;
		}
		if(<%=requestType.equals("modify")%>) userModify();
		if(<%=requestType.equals("remove")%>) userRemove();
	}
	
	function userModify() {
		document.f.action = "user_modify_form.jsp";
		document.f.method = "POST";
		document.f.submit();
	}
	
	function userRemove() {
		if (confirm("정말 삭제하시겠습니까?")) {
			document.f.action = "user_remove_action.jsp";
			document.f.method='POST';
			document.f.submit();
		}
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp"/>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp"/>
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->

			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">
									<span>&nbsp;&nbsp;<b>'<%=sUser.getU_id() %>' 님</span>
									<span>&nbsp;&nbsp;>>&nbsp;&nbsp;<b>비밀번호 확인</b></span>
									</td>
								</tr>
							</table> <!-- view Form  -->
							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호 확인</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<input type="password" name="u_password" value="">
										</td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
									<input type="button" value="확인" onClick="passwordAuthentication(document.f.u_password.value)">&nbsp;
									<input type="button" value="취소" onClick="location.href='user_view.jsp';"> 
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
