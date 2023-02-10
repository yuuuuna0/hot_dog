
<%@page import="java.util.List"%>
<%@page import="com.itwill.hotdog.service.DeliveryService"%>
<%@page import="com.itwill.hotdog.domain.Delivery"%>
<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file='login_check.jspf' %>
<%
	DeliveryService deliveryService=new DeliveryService();
	List<Delivery> deliveryList=deliveryService.findByUserId(sUserId);
	
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>배송지 선택</title>

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
	//선택한 배송지 넣기
	function sendSelectedDelivery(d_no){
		opener.document.orders_detail_f.address.value=window.document.getElementById(d_no).value;
		window.close();
	}
	

	
</script>

</head>
<body>
	<div id="wrap">
		<br> <b><font size="3" color="gray"><%=sUser.getU_name() %>님의 배송지 선택</font></b>
		<hr size="0.5" style="margin: 0 0 0 0"  >
		<div id="chk" style="margin-top: 10px">
			<table align=center width=80% border="0" cellpadding="0" cellspacing="1" bgcolor="E6ECDE">
				<tr>
					<td width=300 height=25 align=center bgcolor="E6ECDE" class=t1>배송지 이름</td>
					<td width=500 height=25 align=center bgcolor="E6ECDE" class=t1>주소</td>
					<td width=100 height=25 align=center bgcolor="E6ECDE" class=t1>선택</td>
				</tr>
				<%for(Delivery delivery:deliveryList){ %>
				<form>
				<tr>
					<td width=500 height=25 align=center bgcolor="ffffff" class=t1><%=delivery.getD_name() %></td>
					<td width=300 height=25 align=center bgcolor="ffffff" class=t1>
						<input type="hidden" readonly id="selected_delivery_<%=delivery.getD_no() %>"  value="<%=delivery.getD_address() %>" />
						<%=delivery.getD_address() %>
					</td>
					<td width=500 height=25 align=center bgcolor="ffffff" class=t1>
						<input type="button" value="선택" onclick="sendSelectedDelivery('selected_delivery_<%=delivery.getD_no() %>')"/>
					</td>
				</tr>
				</form>

				<%} %>
			
			</table>
		</div>
	</div>
</body>
</html>