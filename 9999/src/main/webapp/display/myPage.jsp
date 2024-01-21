<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="game.GameBean"%>
<%@page import="game.GameDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="order.OrderBean"%>
<%@page import="order.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mall_top2.jsp"%>
<%@include file="mall_left_My.jsp"%>    
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
	DecimalFormat df = new DecimalFormat("###,###");
	OrderDAO odao = OrderDAO.getInstance();
	ArrayList<OrderBean> olist = odao.getMyGame(userid); 
	 
	GameDAO gdao = GameDAO.getInstance();
%>
<div style="margin-top:15">
 <h2>마이페이지</h2>
</div>
<table style="width: 800; border-collapse: collapse;">
	<tr>
	 <td colspan="5" style="padding: 10;">
	  <h3>주문내역</h3>
	 </td>
	</tr>
	<tr style="border-bottom: 1px solid black; border-top: 1px solid black;">
	 <td align="center" colspan="2" height="50">상품정보</td>
	 <td align="center">주문일자</td>
	 <td align="center">주문금액</td>
	 <td align="center">삭제</td>
	</tr>
<%
	if(olist.size()==0){
%>		<tr><td align="center" colspan="4" style="padding-top: 30"><h3>구매하신 상품이 없습니다.</h3></td></tr>
<%  } else {
		for(int i=0;i<olist.size();i++){
			OrderBean ob = olist.get(i);
			GameBean gb = gdao.getByGnum(ob.getGnum()); 
%>			
			<tr>
			 <td width="120" align="right">
			  <img width="110" src="<%=request.getContextPath()%>/img/<%=gb.getGimage()%>">
			 </td>
			 <td align="left">
			  <span><a href="mall_gameView.jsp?gnum=<%=gb.getGnum()%>"><%=gb.getGtitle() %></a></span>
			 </td>
			 <td align="center">
			  <span><%=sdf.format(ob.getOrderdate()) %></span>
			 </td>
			 <td align="center">
			  <span><%=df.format(gb.getGprice()) %>원</span>
			 </td>
			 <td align="center">
			  <span><a href="javascript:deleteGame(<%=gb.getGnum()%>)"><font color="red">제거하기</font></a></span>
			 </td>
			</tr>
<%
		}			
	}
%>
</table>
<%@include file="mall_bot.jsp"%>
<script type="text/javascript">
	function deleteGame(gnum){
		var qwe = confirm("정말로 제거하시겠습니까?");
		if(qwe){
			location.href="deleteGameProc.jsp?gnum="+gnum;
		} else{
			return;
		}
	}
</script>
