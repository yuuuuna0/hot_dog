<%@page import="com.itwill.hotdog.domain.UserInfo"%>
<%@page import="com.itwill.hotdog.service.UserInfoService"%>
<%@page import="com.itwill.hotdog.service.CartService"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String sUserId=(String)session.getAttribute("sUserId");
%>	
<script type="text/javascript">
	function login_message() {
		alert('로그인하세요');
		location.href = 'user_login_form.jsp';
	}
</script>
<p>
	<strong>메 뉴</strong>
</p>
<ul>
	<%
		if(sUserId==null){
	%>
	     	<li><a href="user_login_form.jsp">로그인</a></li>
			<li><a href="user_write_form.jsp">회원가입</a></li>
			<li><a href="user_write_form_popup.jsp">회원가입[팝업]</a></li>
			<li><a href=""></a></li>
			<li><a href="javascript:login_message();">장바구니</a></li>
	<%
		}else{
			UserInfo sUser=new UserInfoService().findUser(sUserId);
		    CartService cartService=new CartService();
		  	int cart_item_count = cartService.getCartListByUserId(sUserId).size();
	%>	
		<li><a href="user_view.jsp"><%=sUser.getU_name()+"님"%></a></li>
		<li><a href="user_logout_action.jsp">로그아웃</a></li>
		<li></li>
		
		<li><a href="cart_view_select_update_qyt_all_check_delete_image.jsp">장바구니[cart]<span class="w3-badge w3-badge-menu w3-green cart_item_count"><%=cart_item_count%></span></a></li>
		<li><a href=""></a></li>
		<li><a href="orders_list_orderitem.jsp">주문목록</a></li>
		
	<%} %>
		<li><a href="product_list.jsp">상품리스트</a></li>
		<li><a href=""></a></li>
		<li><a href="board_list.jsp">게시판리스트</a></li>
		<li><a href="board_write.jsp">게시판쓰기</a></li>
		
</ul>
