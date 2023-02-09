
<%@page import="com.itwill.hotdog.domain.Delivery"%>
<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file='login_check.jspf' %>
<%
	
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>배송지 선택</title>

<style type="text/css">
#wrap {
	width: 1000px;
	text-align: center;
	margin: 0 auto 0 auto;
}

#chk {
	text-align: center;
}

#cancelBtn {
	visibility: visible;
}

#useBtn {
	visibility: visible;
}
</style>

<script type="text/javascript">
	// 아이디 중복체크
	function idCheck() {
		var userId=document.getElementById("userId").value;
		if(userId==null|| userId==''){
			alert('검색할아이디를 입력하시고 중복체크를 하세요.');
			return;
		}
		document.getElementById('checkForm').action='user_id_check_form.jsp';
		document.getElementById('checkForm').method='POST';
		document.getElementById('checkForm').submit();
		
	}

	// 사용하기 클릭 시 부모창으로 값 전달 
	function sendCheckValue() {
		// 중복체크 결과인 idCheck 값을 전달한다.
		// 회원가입 화면의 ID입력란에 값을 전달
		opener.document.f.userId.value = window.document.getElementById('userId').value;
		window.close();
	}
</script>

</head>
<body>
	<div id="wrap">
		<br> <b><font size="3" color="gray"><%=sUser.getU_name() %>님의 배송지 선택</font></b>
		<hr size="0.5" style="margin: 0 0 0 0"  >
		<div id="chk" style="margin-top: 10px">
			<form id="checkForm" style="display: inline;">
			<table align=center width=80% border="0" cellpadding="0" cellspacing="1" bgcolor="E6ECDE">
				<tr>
				<td width=300 height=25 align=center bgcolor="E6ECDE" class=t1>배송지 이름</td>
				<td width=500 height=25 align=center bgcolor="E6ECDE" class=t1>주소</td>
				<td width=100 height=25 align=center bgcolor="E6ECDE" class=t1>선택</td>
				<%for(Delivery delivery:sUser.getDeliveryList()){ %>
				
				<tr>
				<td width=300 height=25 align=center bgcolor="E6E" class=t1>배송지 이름</td>
				<td width=500 height=25 align=center bgcolor="E6ECDE" class=t1>주소</td>
				<td width=100 height=25 align=center bgcolor="E6ECDE" class=t1>선택</td>
				</tr>

				<%} %>
			
			</table>
				<input type="text" name="userId" id="userId" value="<%=sUserId%>"> <input
					type="button" value="선택" onclick="idCheck()" style="font-size: 7pt">
			</form>
		</div>
	</div>
</body>
</html>