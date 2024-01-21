<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	alert("로그아웃되었습니다.");
</script>    
<jsp:useBean id="gameCart" class="game.CartBean" scope="session"/>
<%
	gameCart.deleteAllCart();
	session.invalidate(); //세션 초기화
	response.sendRedirect(request.getContextPath()+"/display/mall_main.jsp");
%> 