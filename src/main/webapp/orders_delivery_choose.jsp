
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
	
	//배송지 한 개 삭제하기
	function delivery_delete_item_action(formId) {
		if(window.confirm('해당 배송지을 삭제하시겠습니까?')){
			var form = document.getElementById(formId);
			form.method = 'POST';
			form.action = 'cart_delete_item_action.jsp';
			form.submit();
		}
		
	}
	

	
</script>

</head>
<body>
	<div id="wrap">
		<br> <b><font size="3" color="gray"><%=sUser.getU_name() %>님의 배송지 선택</font></b>
		<hr size="0.5" style="margin: 0 0 0 0"  >
		<div id="deliveryList" style="margin-top: 10px">
			<table align=center width=80% border="0" cellpadding="0" cellspacing="1" bgcolor="E6ECDE">
				<tr>
					<td width=300 height=25 align=center bgcolor="E6ECDE" class=t1>배송지 이름</td>
					<td width=500 height=25 align=center bgcolor="E6ECDE" class=t1>주소</td>
					<td width=100 height=25 align=center bgcolor="E6ECDE" class=t1>선택</td>
				</tr>
				<%for(Delivery delivery:deliveryList){ %>
				<form>
				<tr>
					<td width=500 height=25 align=center bgcolor="ffffff" class=t1 style="font-size: 9pt"><%=delivery.getD_name() %></td>
					<td width=300 height=25 align=center bgcolor="ffffff" class=t1  style="font-size: 9pt">
						<input type="hidden" readonly id="selected_delivery_<%=delivery.getD_no() %>"  value="<%=delivery.getD_address() %>" />
						<%=delivery.getD_address() %>
					</td>
					<td width=500 height=25 align=center bgcolor="ffffff" class=t1  style="font-size: 9pt">
						<input type="button" value="선택" style="font-size: 7pt" onclick="sendSelectedDelivery('selected_delivery_<%=delivery.getD_no() %>')"/>
					</td>
				</tr>
				</form>
				<form id="delivery_delete_form_<%=delivery.getD_no()%>">
						<input type="hidden" name="d_no" value="<%=delivery.getD_no()%>"> 
						<a href="javascript:delivery_delete_item_action('cart_delete_item_form_<%=delivery.getD_no()%>');">
							<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 28 28" class="icon--close">
								<g fill="none" fill-rule="evenodd"> 
									<path d="M0 0H28V28H0z"></path> 
									<g fill="#9B9BA0" transform="translate(6 6)" class="icon--close__group">
									<rect width="2" height="18" x="7" y="-1" rx="1" transform="rotate(-135 8 8)"></rect> 
									<rect width="2" height="18" x="7" y="-1" rx="1" transform="rotate(-45 8 8)"></rect> 
									</g>
								 </g> 
							</svg>
						</a>
				</form>
				<%} %>
			</table>
		</div>
		<br/>
		<div>
			<input id="addDelivery" type="button" value="추가"  style="font-size: 7pt" 
			onclick="window.open('orders_delivery_write_form.jsp','checkForm','width=500','height=400')">
			
			<input id="cancle" type="button" value="취소" style="font-size: 7pt" onclick="window.close();"> 
		</div>
	</div>
</body>
</html>