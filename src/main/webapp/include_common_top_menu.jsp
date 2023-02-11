<%@page import="com.itwill.hotdog.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int cart_item_count=0;
	String sUserId=(String)session.getAttribute("sUserId");
	if(sUserId!=null){
		CartService cartService=new CartService();
		cart_item_count = cartService.getCartListByUserId(sUserId).size();
	}
%>		
<script type="text/javascript">
function searchByKeyword() {
	document.ff.action ='product_search_action.jsp';
	document.ff.method='POST';
	document.ff.submit();
}
</script>

<div id="menu">
	<ul>
		<li id="logo"><a href="hotdog_main.jsp"></a></li>
			<form name="ff" text-align="center" style="display: inline;">
					<input id="search" type="text" name="keyword" placeholder="검색어를 입력하세요" value="" style="width:130px;height:25px"> 
					<input type="button" value="검색" onclick="searchByKeyword();" >		
			</form>
		<%if(sUserId==null){  %>
			<li id="mypage" title="나의페이지" ><a href="user_login_form.jsp" ></a></li>
			<li id="cart" title="장바구니"><span class="w3-badge-no-login w3-green-no-login w3-margin-right">0 </span><a href="user_login_form.jsp" title="장바구니"></a></li>
			
		<%}else{ %>
			<li id="mypage" title="나의페이지" ><a href="user_view.jsp"></a></li>
			<li id="cart" title="장바구니"><span class="w3-badge w3-green w3-margin-right"><%=cart_item_count%></span><a href="cart_view_select_update_qyt_all_check_delete_image.jsp"></a></li>
			
		<%} %>
	</ul>
</div>