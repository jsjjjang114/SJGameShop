<%@page import="user.UserBean"%>
<%@page import="user.UserDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="game.GameBean"%>
<%@page import="game.GameDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="order.OrderBean"%>
<%@page import="order.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#buyBtn{
		width: 100;
		height: 40;
		color:white;
		background-color: red;
		border-style:none;
		border-radius: 3px;
		cursor: pointer;
	}
</style>
    <jsp:useBean id="gameCart" class="game.CartBean" scope="session"/>
<%@include file="mall_top2.jsp"%>
<%@include file="mall_left.jsp"%>    
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
	DecimalFormat df = new DecimalFormat("###,###");
	
	String gnum = request.getParameter("gnum");
	
	OrderDAO odao = OrderDAO.getInstance();
	UserDAO udao = UserDAO.getInstance();
	
	UserBean ub = udao.getUserInfoById(userid);
	ArrayList<GameBean> clist = gameCart.getAllCart();
	
	int total = 0;
	
	GameDAO gdao = GameDAO.getInstance();
%>
<h2 style="margin-top:50; ">주문서</h2>
<form action="order.jsp">
<div style="padding-left: 150;">
<div style="float:left;" >
<table border=1 style="width: 500;">
	<tr><td colspan="4" style="padding: 10"><h3>주문상품</h3></td></tr>
<%

	if(gnum==null){
		for(int i=0;i<clist.size();i++){
			GameBean gb = clist.get(i);
			total += gb.getGprice();
%>			
			<tr>
			 <td width="150" align="right">
			  <img width="110" src="<%=request.getContextPath()%>/img/<%=gb.getGimage()%>">
			  <input type="hidden" name="gnum" value="<%=gb.getGnum()%>">
			 </td>
			 <td align="left" colspan="3">
			  <div><%=gb.getGtitle() %></div>
			  <br>
			  <div><%=df.format(gb.getGprice()) %>원</div>
			 </td>
			</tr>
<%
		}
	} else{
			GameBean gb = gdao.getByGnum(Integer.parseInt(gnum)); 
			total = gb.getGprice();
%>			
			<tr>
			 <td width="150" align="right">
			  <img width="110" src="<%=request.getContextPath()%>/img/<%=gb.getGimage()%>">
			  <input type="hidden" name="gnum" value="<%=gnum%>">
			 </td>
			 <td align="left" colspan="3">
			  <div style="font-size: 20"><%=gb.getGtitle() %></div>
			  <br>
			  <div><%=df.format(gb.getGprice()) %>원</div>
			 </td>
			</tr>
<%
	}
%>
</table>
<table border=1 style="width: 500;">
 <tr><td colspan="4" style="padding: 10"><h3>주문자정보</h3></td></tr>
 <tr>
  <td width="80" align="left">주문자명</td>
  <td colspan=3><%=ub.getName() %></td>
 </tr>
 <tr>
  <td align="left">이메일</td>
  <td colspan=3><%=ub.getEmail() %></td>
 </tr>
</table>
</div>
<div style="float:left;">
 <table border="1" style="width:150; height: 100;">
  <tr>
   <td valign="top" height="20"><h3>결제 금액</h3></td>
  </tr>
  <tr>
   <td align="right"><%=df.format(total) %>원</td>
  </tr>
  <tr>
   <td align="right"><input id="buyBtn" type="submit" value="주문하기" onclick="return order()">
   </td>
  </tr>
 </table>
</div>
</div>
</form>
<%@include file="mall_bot.jsp"%>