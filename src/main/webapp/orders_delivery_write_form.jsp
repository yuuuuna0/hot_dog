
<%@page import="java.util.List"%>
<%@page import="com.itwill.hotdog.service.DeliveryService"%>
<%@page import="com.itwill.hotdog.domain.Delivery"%>
<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file='login_check.jspf' %>
<%
	Delivery newDelivery=new Delivery(0,"","",sUserId);	
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>배송지 추가하기</title>

<style type="text/css">
#wrap {
	width: 500px;
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
	//배송지 추가하기
	function addDelivery(){
		var deliveryName=document.delivery_f.deliveryName.value;
		var deliveryName=document.delivery_f.deliveryAddress.value;
		if(deliveryName==null || diliveryName==""){
			alert("배송지명을 입력하십시요.");
			delivery_f.deliveryName.focus();
			return false;
		}
		if(deliveryAddress==null || deliveryAddress==""){
			alert("주소를 입력하십시요.");
			delivery_f.deliveryName.focus();
			return false;
		}
		DeliveryService deliveryService=new DeliveryService();
		isDuplicate=deliveryService.isDuplicateDeliveryName(sUserId,deliveryName);
		if(isDuplicate){
			alert("중복되는 배송지명입니다.");
			delivery_f.deliveryName.focus();
		}
		delivery_f.action = "order_delivery_write_action.jsp";
		delivery_f.method = "POST";
		delivery_f.submit();
	}
</script>

</head>
<body>
	<div id="wrap">
		<br> <b><font size="3" color="gray"><%=sUser.getU_name() %>님의 배송지 추가</font></b>
		<hr size="0.5" style="margin: 0 0 0 0"  >
		<div id="deliveryList" style="margin-top: 10px">
			<table align=center width=80% border="0" cellpadding="0" cellspacing="1" bgcolor="E6ECDE">
				<tr>
					<td width=300 height=25 align=center bgcolor="E6ECDE" class=t1>배송지 이름</td>
					<td width=500 height=25 align=center bgcolor="E6ECDE" class=t1>주소</td>
				</tr>
				<form name="delivery_f">
				<tr>
					<td width=500 height=25 align=center bgcolor="ffffff" class=t1 style="font-size: 9pt"></td>
						<input type="text" name="deliveryName" value=="" />
					<td width=300 height=25 align=center bgcolor="ffffff" class=t1  style="font-size: 9pt">
						<input type="text" name="selected_delivery value="" />
					</td>
				</tr>
				</form>
			</table>
		</div>
		<br/>
		<div>
			<input id="addDeilivey" type="button" value="추가"  style="font-size: 7pt" onclick="addDelivery();">
			<input id="cancle" type="button" value="취소" style="font-size: 7pt" onclick="window.close();"> 
		</div>
	</div>
</body>
</html>