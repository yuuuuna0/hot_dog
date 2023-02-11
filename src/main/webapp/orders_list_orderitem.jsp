<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.hotdog.domain.Product"%>
<%@page import="com.itwill.hotdog.domain.OrderItem"%>
<%@page import="com.itwill.hotdog.domain.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.hotdog.service.OrdersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='login_check.jspf' %>
<%
OrdersService ordersService=new OrdersService();
List<Orders> ordersList=ordersService.findDetailAll(sUserId);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>쇼핑몰 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<style type="text/css" media="screen">
</style>
<script type="text/javascript">
	function orders_delete_all_action(){
		document.orders_delete_all_form.action='orders_delete_all_action.jsp';
		document.orders_delete_all_form.method='POST';
		document.orders_delete_all_form.submit();
	}
	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
<form name="orders_delete_all_form" style="margin: 0">
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
											주문 목록</b></td>
								</tr>
							</table> <!--form-->
							<form name="f" method="post">
								<table align=center width=80%  border="0" cellpadding="0"
									cellspacing="1">
									<!-- order start -->
									<%
									for (Orders orders : ordersList) {
										List<OrderItem> orderItemList=orders.getOrderItemList();
										
									%>
									<tr>
										<td colspan="6" height=24 align=left bgcolor="E6ECDE" class=t1 >
											<span
											style="font-size: 10pt; font-style: bold;">&nbsp;<%=orders.getO_date()%></span>
											<span style="font-size: 8pt">주문번호 <%=orders.getO_no()%></span> <a href='orders_detail.jsp?o_no=<%=orders.getO_no()%>' style="font-size: 6pt">상세보기</a>
										</td>
										</td>
									</tr>
									<tr>
										<td colspan="6" height=4 align=left class=t1 >
										</td>
									</tr>
									<tr>
										<td width="5%"></td>
										<td width="95%" colspan="8" bgcolor="ffffff" class=t1>
											<!--  -->
											<table align="left" border="0" 
												cellspacing="1" bgcolor="EEEEEE">
												<tr >
													<%
													int orderItemSize = orderItemList.size();
													int remainSize=8-orderItemSize;
													for(int j=0;j<orderItemSize;j++){
														OrderItem orderItem=orderItemList.get(j);
														Product product=orderItem.getProduct();
													%>
													<!--상품시작 -->
													<td align="center" style="padding: 0px;width: 55px" bgcolor="ffffff"><a style="padding: 0px"
														href="product_detail.jsp?p_no=<%=product.getP_no()%>"><img width="50px"
															height="50px" src="image/<%=product.getP_img() %>" border="0" style="padding-top: 5px"></a> <br>
														<span style="font-size: 6pt"><b><%=product.getP_name()%></b> <br> <%=new DecimalFormat("#,###").format(orderItem.getOi_qty()*product.getP_price())%> <%=orderItem.getOi_qty()%>개</span>
													</td>
													<!--상품 끝 -->
													<%} %>
													<%
													for(int j=0;j<remainSize;j++){
													%>
													<!--상품시작 -->
													<td align="center" style="padding: 0px;width: 55px" bgcolor="ffffff">
													</td>
													<!--상품 끝 -->
													<%
													}	
													%>
													
													</tr>
											</table>
										</td>
									<tr>
										<td colspan="5" width=145 height=10 align=center
											bgcolor="ffffff" class=t1></td>
									</tr>
									<!-- order end -->
									<%
									}
									%>
									<!-- order end -->
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp;
									<a href=product_search_list.jsp
										class=m1>계속 구경하기</a>
									<a href='javascript:orders_delete_all_action();'
										class=m1>주문전체삭제</a>
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