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
	int o_usedPoint = 0;
	int addPoint = 0;
	String pm_noStr = request.getParameter("pm_no");
	String[] cart_item_noStr_array = request.getParameterValues("cart_item_no");
	
	
	if(buyType==null) buyType="";
	if(p_noStr==null) p_noStr="";
	if(p_qtyStr==null) p_qtyStr="";
	if(p_priceStr==null) p_priceStr="";
	if(pm_noStr==null) pm_noStr="";
	if(cart_item_noStr_array==null) cart_item_noStr_array=new String[]{};
	
	CartService cartService=new CartService();
	UserInfoService userInfoService=new UserInfoService();
	ProductService productService=new ProductService();
	DeliveryService deliveryService=new DeliveryService();
	
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
	function order_create_form_submit() {
		document.orders_create_form.method = 'POST';
		document.orders_create_form.action = 'orders_create_action.jsp';
		document.orders_create_form.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="orders_create_form" method="post">
		<input type="hidden" name="buyType" value="<%=buyType%>"> 
		<input type="hidden" name="p_no" value="<%=p_noStr%>"> 
		<input type="hidden" name="p_qty" value="<%=p_qtyStr%>">
		<input type="hidden" name="o_usedPoint" value="<%=o_usedPoint%>">
		<input type="hidden" name="addPoint" value="<%=addPoint%>">
		
		<%
		for (String cart_item_noStr : cart_item_noStr_array) {
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
							<form>
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
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1><%=sUser.getU_point() %></td>
										<td width=150 height=26 align=center bgcolor="ffffff" class=t1>
											<label for="select_delivery" ></label>
											<select name="select_delivery"> required>
											<%for(Delivery deliver: sUser.getDeliveryList()){%>
												<option value="<%=deliver.getD_no()%>"><%=deliver.getD_address() %></option>>
											<%} %>
											</select>
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
									for (Cart cart : cartItemList) {
										tot_price += cart.getC_qty() * cart.getProduct().getP_price();
									%>
									<!-- cart item start -->
									<tr>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=cart.getProduct().getP_img()%></td>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1>
											<a
											href='product_detail.jsp?p_no=<%=cart.getProduct().getP_no()%>'><%=cart.getProduct().getP_name()%></a>
										</td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=cart.getC_qty()%></td>
										<td width=120 height=26 align=center bgcolor="ffffff" class=t1>
											<%=new DecimalFormat("#,###").format(cart.getC_qty() * cart.getProduct().getP_price())%>
										</td>
										<td width=150 height=26 align=center bgcolor="ffffff" class=t1>
											<input type="hidden" name="addPoint" value="<%=new DecimalFormat("#,###").format((cart.getC_qty() * cart.getProduct().getP_price())*0.05)%>">
											<%=addPoint %>
										</td>
									</tr>
									<!-- cart item end -->
									<%}%>
									<tr>
										<td width=640 colspan=3 height=26 bgcolor="ffffff" class=t1>
											<p align=right style="padding-top: 10px">
												<font color=#FF0000>총 주문 금액 :
												</font>
											</p>
										</td>
										<td width=100 colspan=2 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<%=new DecimalFormat("#,###").format(tot_price)%>원
										</td>
									</tr>
									<tr>
										<td width=640 colspan=3 height=26 bgcolor="ffffff" class=t1>
											<p align=right style="padding-top: 10px">
												<font color=#FF0000>사용 포인트 : 
												</font>
											</p>
										</td>
										<td width=100 colspan=2 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="number" style="width: 150px" name="o_usedPoint" min="0" max="<%sUser.getU_point(); %>"
											value="">
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
											<%=new DecimalFormat("#,###").format(tot_price-o_usedPoint) %>원
										</td>
									</tr>
								</table>
							</form>
							<br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp; <a
										href="javascript:order_create_form_submit();" class=m1>구매하기</a>
										&nbsp;&nbsp;<a href=product_list.jsp class=m1>계속 쇼핑하기</a>

									</td>
								</tr>
							</table></td>
					</tr>
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