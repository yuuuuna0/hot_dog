
<%@page import="java.util.List"%>
<%@page import="com.itwill.hotdog.service.DeliveryService"%>
<%@page import="com.itwill.hotdog.domain.Delivery"%>
<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file='login_check.jspf' %>
<%
	String[] d_noStr_array=null;
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
	
	/*
	배송지 한 개 삭제하기
	function delivery_delete_item_action(formId) {
		if(window.confirm('해당 배송지을 삭제하시겠습니까?')){
			var form = document.getElementById(formId);
			form.method = 'POST';
			form.action = 'cart_delete_item_action.jsp';
			form.submit();
		}
		
	}
	*/
	
	//delivery 전체선택 및 해제
	function delivery_all_select(e){
		var delivery_no_check_list = document.getElementsByName("delivery_no_check");
		if(e.target.checked){
			for (var i = 0; i < delivery_no_check_list.length; i++) {
				delivery_no_check_list.item(i).checked=true;
			}
		}else{
			for (var i = 0; i < delivery_no_check_list.length; i++) {
				delivery_no_check_list.item(i).checked=false;
			}
		}
	}
	
	/*
	//선택된 delivery의 값
	function delete_checked_delivery(){
		var=delivery_no_list;
		var=delivery_no_check_list;
		for(var i=0;i<delivery_no_list.length;i++){
			if(e.target.checked){
				delivery_no_check_list=document.getElementsByName("delivery_no_check").value;
			}
		}
		for(var i=0;delivery_no_check_list.length;i++){
		}
	}
	*/

	

	
</script>

</head>
<body>
	<form name="orders_delivery_choose_form" style="margin:0">
	<%for (String d_noStr : d_noStr_array) {
		%>
		<input type="hidden" name="d_no" value="<%=d_noStr%>">
	  <%}%>
	</form>
	<div id="wrap">
		<br> <b><font size="3" color="gray"><%=sUser.getU_name() %>님의 배송지 선택</font></b>
		<hr size="0.5" style="margin: 0 0 0 0"  >
		<div id="deliveryList" style="margin-top: 10px">
			<table align=center width=80% border="0" cellpadding="0" cellspacing="1" bgcolor="E6ECDE">
				<tr>
					<td width=60 height=25 align="center" bgcolor="E6ECDE" class=t1>
						<input type="checkbox" name="delivery_all_check_unckeck" onchange="delivery_all_select(event);"/></td>
					<td width=300 height=25 align=center bgcolor="E6ECDE" class=t1>배송지 이름</td>
					<td width=500 height=25 align=center bgcolor="E6ECDE" class=t1>주소</td>
					<td width=100 height=25 align=center bgcolor="E6ECDE" class=t1>선택</td>
				</tr>
				<%for(Delivery delivery:deliveryList){ %>
				<form name="delivery_detail_form">
				<tr>
					<td width=60 height=26 align=center bgcolor="ffffff" class=t1>
						<input type="checkbox" name="delivery_no_check" onchange="delivery_select_deselect(event);" value="<%=delivery.getD_no() %>">
					</td>
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
				<%} %>
			</table>
		</div>
		<br/>
		<div>
			<input id="addDelivery" type="button" value="추가"  style="font-size: 7pt" 
			onclick="window.open('orders_delivery_write_form.jsp','checkForm','width=500','height=400')">
			<input id="deleteDelivery" type="button" value="선택삭제"  style="font-size: 7pt" 
			onclick="delete_checked_delivery();">
			<input id="cancle" type="button" value="취소" style="font-size: 7pt" onclick="window.close();"> 
		</div>
	</div>
</body>
</html>