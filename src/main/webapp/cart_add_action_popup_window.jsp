<%@page import="com.itwill.hotdog.domain.Product"%>
<%@page import="com.itwill.hotdog.domain.Cart"%>
<%@page import="com.itwill.hotdog.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<%


	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("product_list.jsp");
		return;
	}
	
	String c_qty=request.getParameter("c_qty");
	String p_no=request.getParameter("p_no");
	
	CartService cartService=new CartService();
	
	cartService.addCart(new Cart(0,Integer.parseInt(c_qty),sUserId,
			            new Product(Integer.parseInt(p_no),null,0,0,null,null,0,0)));
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
<div style="width:180px ;margin:0 auto;padding: 0px">
	<img src="http://pics.gmkt.kr/pc/ko/item/vip/img_cartplus_n.png" width="25px" height="25px"
		alt="장바구니이미지">
	<strong>상품을 담았습니다.</strong>
	<div  style="margin-top: 5px;margin-left: auto;margin-right: auto;padding: 5px" >
		<div  style="margin: 0 auto;padding: 0px 20px">
			<button onclick="window.close();opener.location.reload();" style="font-size: 6pt">
				계속 쇼핑
			</button>
			<!-- 
			<button onclick="window.close();opener.location.href='cart_view_select_update_qyt_image.jsp';">
				장바구니로
			</button> 
			-->
			<button onclick="window.close();opener.location.href='cart_view.jsp';" style="font-size: 6pt">
				장바구니
			</button>
		</div>
	</div>
</div>
</body>
</html>
