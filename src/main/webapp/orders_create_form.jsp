<%@page import="com.itwill.hotdog.domain.Payment"%>
<%@page import="com.itwill.hotdog.service.PaymentService"%>
<%@page import="com.itwill.hotdog.domain.Delivery"%>
<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.hotdog.domain.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.hotdog.domain.OrderItem"%>
<%@page import="com.itwill.hotdog.domain.Product"%>
<%@page import="com.itwill.hotdog.service.DeliveryService"%>
<%@page import="com.itwill.hotdog.service.ProductService"%>
<%@page import="com.itwill.hotdog.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='login_check.jspf' %>
<%
//1. GET방식 redirection
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("product_list.jsp");
		return;
	}
	String buyType = request.getParameter("buyType");
	String p_noStr = request.getParameter("p_no");
	String p_qtyStr = request.getParameter("p_qty");
	String p_priceStr = request.getParameter("p_price");
	//int o_usedPoint = 0;
	//int addPoint = 0;
	String[] cart_item_noStr_array = request.getParameterValues("cart_item_no");
	
	
	if(buyType==null) buyType="";
	if(p_noStr==null) p_noStr="";
	if(p_qtyStr==null) p_qtyStr="";
	if(p_priceStr==null) p_priceStr="";
	if(cart_item_noStr_array==null) cart_item_noStr_array=new String[]{};
	
	CartService cartService=new CartService();
	UserInfoService userInfoService=new UserInfoService();
	ProductService productService=new ProductService();
	DeliveryService deliveryService=new DeliveryService();
	PaymentService paymentService=new PaymentService();
	
	List<Cart> cartItemList=new ArrayList<Cart>();
	
	if(buyType.equals("direct")){
		Product product=productService.productDetail(Integer.parseInt(p_noStr));
		cartItemList.add(new Cart(0,Integer.parseInt(p_qtyStr),sUserId,product));
	}else if(buyType.equals("cart_all")){
		cartItemList=cartService.getCartListByUserId(sUserId);
	}else if(buyType.equals("cart_select")){
		for(String cart_item_noStr : cart_item_noStr_array){
			cartItemList.add(cartService.getCartItemByCartNo(Integer.parseInt(cart_item_noStr)));
		}
	}
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>쇼핑몰 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<style type="text/css" media="screen">
/*
form > table tr td{
	border: 0.1px solid black;
}
*/
</style>
<script type="text/javascript">
	//주문하기 버튼 클릭
	function order_create_form_submit() {
		if(document.orders_detail_f.address.value=="") {
			alert("배송지를 선택하세요.");
			return false;
		}
		if(document.orders_create_form.o_usedPoint.value=="") {
			alert("포인트를 사용하세요.");
			return false;
		}
		if(document.orders_create_form.pm_no.value=="") {
			alert("결제수단을 선택하세요.");
			return false;
		}
		document.getElementByName
		document.orders_create_form.add_point.value=document.orders_detail_f.add_point.value
		document.orders_create_form.method = 'POST';
		document.orders_create_form.action = 'orders_create_action.jsp';
		document.orders_create_form.submit();
	}
	//포인트 사용하기
	function changePoint(tot_price){
		var u_point=<%=userInfoService.findUser(sUserId).getU_point()%>;	//가지고 있는 포인트
		var v_point =parseInt(document.getElementById("use_point").value);	//사용할 포인트(input 입력값)
		if(v_point>u_point){	//입력값이 사용가능보다 클 때
			alert('최대 사용 가능한 값은'+u_point+'p 입니다.');
			v_point=u_point;
			document.getElementById("use_point").value=v_point;
		}
		if(v_point>tot_price){	//입력값이 총 결제금액보다 클 때
			alert('최대 사용 가능한 값은'+tot_price+'p 입니다.');
			v_point=tot_price;
			document.getElementById("use_point").value=v_point;
		}
		if(v_point==null){
			v_point=0;
		}
		u_point-=v_point;
		var result_price=tot_price-v_point
		document.getElementById("result_price").innerHTML=priceToString(result_price);
		//document.orders_create_form.new_u_point.value=u_point;
		document.orders_create_form.o_usedPoint.value=v_point;
	}
	
	function priceToString(price) {
	    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	//배송지 선택하기 띄우기
	function orders_delivery_choose(){
		var left = Math.ceil(( window.screen.width)/5);
		var top = Math.ceil(( window.screen.height)/5);
		window.open("orders_delivery_choose.jsp","checkForm","width=500,height=400,top="+top+",left="+left+",resizable = no,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
	}
	//결제수단 고르기
	function selectPayment(){
		document.orders_create_form.pm_no.value = document.orders_detail_f.paymentType.value;
	}
	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="orders_create_form" method="post">
		<input type="hidden" name="buyType" value="<%=buyType%>"/> 
		<input type="hidden" name="p_no" value="<%=p_noStr%>"/> 
		<input type="hidden" name="p_qty" value="<%=p_qtyStr%>"/>
		<input type="hidden" name="o_usedPoint" value=""/>
		<input type="hidden" name="pm_no" value=""/>
		<input type="hidden" name="add_point" value=""/>
		
		<%-- <input type="hidden" name="addPoint" value="<%=addPoint%>"/> --%>
		<%for (String cart_item_noStr : cart_item_noStr_array) {
		%>
		<input type="hidden" name="cart_item_no" value="<%=cart_item_noStr%>">
	  <%}%>
	</form>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
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
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>쇼핑몰 -
											주문/결제폼</b></td>
								</tr>
							</table> <!--form-->
							<form name='orders_detail_f'>
								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<caption style="text-align: left;">구매자정보</caption>
									<tr>
										<td width=150 height=25 align=center bgcolor="E6ECDE" class=t1>아이디</td>
										<td width=112 height=25 align=center bgcolor="E6ECDE" class=t1>이름</td>
										<td width=166 height=25 align=center bgcolor="E6ECDE" class=t1>전화번호</td>
										<td width=50 height=25 align=center bgcolor="E6ECDE" class=t1>포인트</td>
										<td width=150 height=25 align=center bgcolor="E6ECDE" class=t1>배송지</td>
										
									</tr>
									<tr>
										<td width=150 height=26 align=center bgcolor="ffffff" class=t1><%=sUser.getU_id()%></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=sUser.getU_name()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=sUser.getU_phone()%></td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1><%=new DecimalFormat("#,###").format(userInfoService.findUser(sUserId).getU_point()) %></td>
										<td width=150 height=26 align=center bgcolor="ffffff" class=t1>
											<input type="text" readonly name="address" value=""/>
											<input type="button" value="선택하기" onclick="orders_delivery_choose();"/>
										</td>
									</tr>
								</table>

								<br />

								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<caption style="text-align: left;">주문제품목록</caption>
									<tr style="border: 0.1px solid">
										<td width=290 height=25 bgcolor="E6ECDE" align=center class=t1>제품이미지</td>
										<td width=290 height=25 bgcolor="E6ECDE" align=center class=t1>제품명</td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1>수량</td>
										<td width=120 height=25 bgcolor="E6ECDE" align=center class=t1>가격</td>
										<td width=150 height=25 bgcolor="E6ECDE" align=center class=t1>적립포인트</td>
									</tr>
									<%
									int tot_price = 0;
									int add_point=0;
									for (Cart cart : cartItemList) {
										tot_price += cart.getC_qty() * cart.getProduct().getP_price();
									%>
									<!-- cart item start -->
									<tr>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>
										<img width="88px" height="65px" src="image/<%=cart.getProduct().getP_img()%>" border="0">
										</td>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1>
											<a
											href='product_detail.jsp?p_no=<%=cart.getProduct().getP_no()%>'><%=cart.getProduct().getP_name()%></a>
										</td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=cart.getC_qty()%></td>
										<td width=120 height=26 align=center bgcolor="ffffff" class=t1>
											<%=new DecimalFormat("#,###").format(cart.getC_qty() * cart.getProduct().getP_price())%>
										</td>
										<td width=150 height=26 align=center bgcolor="ffffff" class=t1>
											<%=new DecimalFormat("#,###").format((cart.getC_qty() * cart.getProduct().getP_price())*0.05)%>
										</td>
									</tr>
									<!-- cart item end -->
									<%}%>
									<input type="hidden" name="add_point" value="<%=tot_price*5/100%>"/>
									<tr>
										<td width=640 colspan=3 height=26 bgcolor="ffffff" class=t1>
											<p align=right style="padding-top: 10px">
												<font color=#FF0000>총 주문 금액 :
												</font>
											</p>
										</td>
										<td width=100 colspan=2 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<span id="tot_price"><%=new DecimalFormat("#,###").format(tot_price)%>원</span>
										</td>
									</tr>
									<tr>
										<td width=640 colspan=3 height=26 bgcolor="ffffff" class=t1>
											<p align=right style="padding-top: 10px">
												<font color=#FF0000>사용 포인트 : 
												</font>
											</p>
										</td>
										<td width=100 colspan=2 height=26 bgcolor="ffffff" align="left" class=t1>
											&nbsp;&nbsp;<input type="text" name="use_point" id="use_point" value=0 />
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="button" value="사용하기" onclick="changePoint(<%=tot_price%>);"/>
										</td>
									</tr>
									<tr>
										<td width=640 colspan=3 height=26 bgcolor="ffffff" class=t1>
											<p align=right style="padding-top: 10px">
												<font color=#FF0000>최종 금액 : 
												</font>
											</p>
										</td>
										<td width=100 colspan=2 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<span id="result_price"><%=new DecimalFormat("#,###").format(tot_price) %></span>
											<span>원</span>
										</td>
									</tr>
									<tr>
										<td width=640 colspan=3 height=26 bgcolor="ffffff" class=t1>
											<p align=right style="padding-top: 10px">
												<font color=#FF0000>결제수단 : 
												</font>
											</p>
										</td>
										<td colspan=2>
										<select data-trigger="" name="paymentType" style="width:150px;height:30px" onchange="selectPayment();">
											<option value="">결제수단</option>
										<%for(Payment payment:paymentService.findAll()){ %>
											<option  value="<%=payment.getPm_no() %>"><%=payment.getPm_name() %></option>
										<%} %>
										</select>
										</td>
									</tr>
								</table>
							</form>
							<br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp; 
										<a href="javascript:order_create_form_submit();" class=m1>구매하기</a>
										&nbsp;&nbsp;
										<a href=product_search_list.jsp class=m1>계속 쇼핑하기</a>
									</td>
								</tr>
							</table>
				
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>