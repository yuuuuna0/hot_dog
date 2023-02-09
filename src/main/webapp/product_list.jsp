<%@page import="com.itwill.hotdog.domain.Categories"%>
<%@page import="com.itwill.hotdog.domain.Product"%>
<%@page import="com.itwill.hotdog.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%
ProductService productService = new ProductService();
List<Product> productList = productService.productList();
%>
<%
boolean isLogin = false;
if (session.getAttribute("sUserId") != null) {
	isLogin = true;
}
%>
<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<script type="text/javascript">
function add_cart_popup_window(f){
	if (<%=!isLogin%>) {
		alert('로그인 하세요');
		location.href = 'user_login_form.jsp';
	} else {
		var left = Math.ceil(( window.screen.width)/5);
		var top = Math.ceil(( window.screen.height)/3); 
		console.log(left);
		console.log(top);
		var cartWin = window.open("about:blank","cartForm","width=260,height=130,top="+top+",left="+left+",location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
		f.action = 'cart_add_action_popup_window.jsp';
		f.target = 'cartForm';
		f.method = 'POST';
		f.submit();
	}
}

</script> 
<style type="text/css" media="screen">
</style>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
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
											상품리스트</b></td>
								</tr>
							</table>
<<<<<<< HEAD
=======
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
					
								<td bgcolor="ffffff" height="15">&nbsp;&nbsp;<b>카테고리 사료/간식</b></td>
								</tr>
								</table>
							<div id="f">
								<table width="100%" align="center" border="0" cellpadding="10"
									cellspacing="1" bgcolor="BBBBBB">
									<%
									int product_size=productList.size();
									int product_column_size=4;
									int product_line_count = 1;
									
									
									for (int i=0;i<productList.size();i++) {
											Product product=productList.get(i);
									%>
									<!--상품시작 -->
									<%
									 if(i%product_column_size==0){
									%>
									<tr>
									<%} %>
										<td align="center" width="25%"  bgcolor="ffffff"><a
											href="product_detail.jsp?p_no=<%=product.getP_no()%>"><img width="88px" height="88px"
												src="image/<%=product.getP_img()%>" border="0"></a><br />
												
											<br /> <b>상품명:<%=product.getP_name()%></b>
											<br /> <b></b>
>>>>>>> refs/heads/master

							<div id="f">
								<table width="100%" align="center" border="0" cellpadding="10"
									cellspacing="1" bgcolor="BBBBBB">
									<%
									int product_size=productList.size();
									int product_column_size=4;
									int product_line_count = 1;
									
									
									for (int i=0;i<productList.size();i++) {
											Product product=productList.get(i);
									%>
									<!--상품시작 -->
									<%
									 if(i%product_column_size==0){
									%>
									<tr>
									<%} %>
										<td align="center" width="25%"  bgcolor="ffffff"><a
											href="product_detail.jsp?p_no=<%=product.getP_no()%>"><img width="88px" height="65px"
												src="image/<%=product.getP_img()%>" border="0"></a><br />
												
											<br /> <b>상품명:<%=product.getP_name()%></b>
											<form style="display: inline;">
												<input type="hidden" name="p_no" value="<%=product.getP_no()%>">
												<input type="hidden" name="cart_qty" value="1">
												<img src='image/cart20.png' style="cursor:pointer;" onclick="add_cart_popup_window(this.parentElement);" align="top"/>
											</form><br> <font
											color="#FF0000">가격:<%=new DecimalFormat("#,##0").format(product.getP_price())%>원
										</font></td>
									<%if(i%product_column_size==3){%>
									</tr>
									<%} %>	
									
								   <!--상품 끝 -->
								   <%}%>	
								</table>
							</div> <br /></td>
					</tr>
				
										<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
					codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
					width="540px" height="350px">
					<param name="movie" value="image/FI_main.swf">
					<param name="play" value="true">
					<param name="loop" value="true">
					<param name="quality" value="high">
					<embed src="image/enter.png" scale="exactfit" play="true"
						loop="true" quality="high" style="margin: 10px;"
						pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"
						width="540px" height="350px"></embed>
				</object>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
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