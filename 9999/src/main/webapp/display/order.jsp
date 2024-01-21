<%@page import="game.GameDAO"%>
<%@page import="order.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gameCart" class="game.CartBean" scope="session"/>
<%
	OrderDAO odao = OrderDAO.getInstance();
	GameDAO gdao = GameDAO.getInstance();
	String userid = (String)session.getAttribute("userid");
	
	String[] gnum = request.getParameterValues("gnum");
	gameCart.deletegame(gnum);
	
	int cnt = odao.insertData(userid,gnum); 
		String msg;
		String url;
	if(cnt==0){
		msg="주문 실패했습니다. 다시 시도해주세요.";
		url="mall_cartList.jsp";
	} else{ 
		gdao.updateSales(gnum);
		msg="주문성공했습니다.";
		url="mall_main.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>