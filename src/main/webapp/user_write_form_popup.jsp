<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = request.getParameter("msg");
	if(msg==null){
		msg="";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>사용자 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<style type="text/css" media="screen">
</style>
<script type="text/javascript">
	function userCreate() {
		if (document.f.userId.value == "") {
			alert("사용자 아이디를 입력하세요.");
			document.f.userId.focus();
			return false;
		}
		if (document.f.password.value == "") {
			alert("비밀번호를 입력하세요.");
			document.f.password.focus();
			return false;
		}
		if (document.f.password2.value == "") {
			alert("비밀번호확인을 입력하세요.");
			f.password2.focus();
			return false;
		}
		if (document.f.name.value == "") {
			alert("이름을 입력하세요.");
			f.name.focus();
			return false;
		}
		if (document.f.phone.value == "") {
			alert("전화번호를 입력하세요.");
			f.phone.focus();
			return false;
		}
		if (document.f.password.value != f.password2.value) {
			alert("비밀번호와 비밀번호확인은 일치해야 합니다.");
			f.password.focus();
			f.password.select();
			return false;
		}
		document.f.action = "user_write_action.jsp";
		document.f.method='POST';
		document.f.submit();
	}

	/*
	아이디중복체크
	*/
	function openIdCheck(){
		var left = Math.ceil(( window.screen.width)/5);
		var top = Math.ceil(( window.screen.height)/5); 
		let idCheckWindow = window.open("user_id_check_form.jsp","checkForm","width=430,height=200,top="+top+",left="+left+",resizable = no,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
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
				<table width=0 border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>사용자 관리
											- 회원 가입</b></td>
								</tr>
							</table> 
							<!-- write Form  -->
							<form name="f">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">사용자
											아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input onclick="openIdCheck();" type="text" style="width: 150px" name="userId" value="" readonly="readonly">&nbsp;&nbsp;
											<input type="button" value="아이디중복검사" onclick="openIdCheck();">
											<font color="red"><%=msg%></font>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="password" style="width: 150px" name="password"
											value="">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호
											확인</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="password" style="width: 150px" name="password2"
											value="">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="name"
											value="">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">전화번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="phone"
											value="">
										</td>
									</tr>
								</table>
							</form> <br />

							<table border=0 cellpadding=0 cellspacing=1>
								<tr>
									<td align=center>
									<input type="button" value="회원 가입" onclick="userCreate();"> &nbsp; 
									<input type="button" value="취소" onClick="location.href='hotdog_main.jsp'">
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
