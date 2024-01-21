<%@page import="order.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="gameCart" class="game.CartBean" scope="session"/>
<%
	String userid = (String)session.getAttribute("userid");
	OrderDAO odao = OrderDAO.getInstance();
	int gnum = Integer.parseInt(request.getParameter("gnum"));
	boolean flag0 = odao.searchData(userid,gnum);
	boolean flag1 = false;
	
	
	if(flag0){%>
<script type="text/javascript">
	alert("이미 구매하신 상품입니다.");
	location.href="mall_gameView.jsp?gnum=<%=gnum%>";
</script>
	
<%	} else{
		flag1 = gameCart.addCart(gnum);
	}
	String msg;
	String url; 
	if(flag1){
		msg="장바구니에 추가했습니다.";
		url="mall_cartList.jsp";
	} else{
		msg="이미 장바구니에 있는 상품입니다.";
		url="mall_gameView.jsp?gnum="+gnum;
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>