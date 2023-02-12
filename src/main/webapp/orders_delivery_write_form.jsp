
<%@page import="java.util.List"%>
<%@page import="com.itwill.hotdog.service.DeliveryService"%>
<%@page import="com.itwill.hotdog.domain.Delivery"%>
<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file='login_check.jspf' %>
<%
	String deliveryName=(String)request.getAttribute("deliveryName");
	String deliveryAddress=(String)request.getAttribute("deliveryAddress");
	
	if(deliveryName==null) deliveryName="";
	if(deliveryAddress==null) deliveryAddress="";
	
	DeliveryService deliveryService=new DeliveryService();
	boolean isDuplicate=false;
	//isDuplicate=deliveryService.isDuplicateDeliveryName(sUserId,deliveryName);
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
	function addDelivery(deliveryName, deliveryAddress){
		if(deliveryName==""){
			alert("배송지명을 입력하십시요.");
			newDelivery_f.deliveryName.focus();
			return false;
		}
		if(deliveryAddress==""){
			alert("주소를 입력하십시요.");
			newDelivery_f.deliveryAddress.focus();
			return false;
		}
		<%--
		if(<%=isDuplicate%>) {
			alert("이미 존재하는 배송지 이름입니다.");
			newDelivery_f.deliveryName.focus();
			return false;
		}
		--%>
		newDelivery_f.action = "orders_delivery_write_action.jsp";
		newDelivery_f.method = "POST";
		newDelivery_f.submit();
	}
</script>

</head>
<body>
	<div id="wrap">
		<br> <b><font size="3" color="gray"><%=sUser.getU_name() %>님의 배송지 추가</font></b>
		<hr size="0.5" style="margin: 0 0 0 0"  >
		<div id="deliveryList" style="margin-top: 10px">
			<form name="newDelivery_f">
			<table align=center width=80% border="0" cellpadding="0" cellspacing="1" bgcolor="E6ECDE">
				<tr>
					<td width=300 height=25 align=center bgcolor="E6ECDE" class=t1>배송지 이름</td>
					<td width=500 height=25 align=center bgcolor="E6ECDE" class=t1>주소</td>
				</tr>
				<tr>
					<td width=500 height=25 align=center bgcolor="ffffff" class=t1 style="font-size: 9pt">
						<input type="text" name="deliveryName" value=""/></td>
					<td width=300 height=25 align=center bgcolor="ffffff" class=t1  style="font-size: 9pt">
						<input type="text" name="deliveryAddress" value=""/></td>
						<%--isDuplicate=deliveryService.isDuplicateDeliveryName(sUserId, deliveryName);--%>
				</tr>
			</table>
			</form>
		</div>
		<br/>
		<div>
			<input type="button" value="추가"  style="font-size: 7pt" onclick="addDelivery(document.newDelivery_f.deliveryName.value, document.newDelivery_f.deliveryAddress.value);"/>
			<input type="button" value="취소" style="font-size: 7pt" onclick="window.close();"/> 
		</div>
	</div>
</body>
</html>