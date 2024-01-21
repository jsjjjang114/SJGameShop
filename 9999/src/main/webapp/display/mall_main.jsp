<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="game.GameBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="game.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
a{
		text-decoration: none;
		color: black;
}	

</style>
<%@include file="mall_top2.jsp"%>
<%@include file="mall_left.jsp"%>

<%
	userid = (String)request.getAttribute("userid");
	 
	SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
	DecimalFormat df = new DecimalFormat("###,###");
	
	GameDAO gdao = GameDAO.getInstance();
	ArrayList<GameBean> lists = gdao.getAll();
	ArrayList<GameBean> lists2 = gdao.getAllBySales(); 
%>
<br>
<div align="left" style="margin-left: 100px;">
 <font size="5px">새로운상품</font>
 <font size="3px" color="gray" style="float: right; margin-right: 150"><a href="mall_new.jsp">더보기</a></font>
</div>
<hr width="800">
<table width="800">
<tr>
<%
	int count = 0;
	if(lists.size()==0){
%>
		<td align="center" width="300" height="200" style="padding: 10px; font-size: 30px;">
			<b>등록된 제품이 없습니다.</b>
		</td>
	<%} else{
	for(int i=0;i<lists.size();i++){
		count++;
		GameBean gb = lists.get(i); %>
		<td align="center" valign="top" width="300" height="200" style="padding: 10px">
			<a href="mall_gameView.jsp?gnum=<%=gb.getGnum() %>">
			<div><img src="../img/<%=gb.getGimage() %>" height="150"></div>
			<div><%=gb.getGtitle() %></div>
			</a>
			<div><font color="red" size="4px"><%=df.format(gb.getGprice()) %>원</font></div>
			<div>발매 <%=sdf.format(gb.getGrel_date()) %></div>
		</td>
<%
		if(count % 3 ==0){
			out.println("</tr><tr>");
		}
		if(i==8){
			break;
		}
	}
	}%>
</tr>
</table>
<br>
<div align="left" style="margin-left: 100px;"><font size="5px">인기상품</font>
<font size="3px" color="gray" style="float: right; margin-right: 150"><a href="mall_best.jsp">더보기</a></font>
</div>
<hr width="800">
<table width="800">
<tr>
<%
	count = 0;
	if(lists2.size()==0){
%>
		<td align="center" width="300" height="200" style="padding: 10px; font-size: 30px;">
			<b>등록된 제품이 없습니다.</b>
		</td>
	<%} else{
		int wid = 300-((lists2.size()%3)*100);
	for(int i=0;i<lists2.size();i++){
		count++;
		GameBean gb = lists2.get(i); %>
		<td align="center" valign="top" width="<%=wid %>" height="200" style="padding: 10px">
			<div><a href="mall_gameView.jsp?gnum=<%=gb.getGnum() %>"><img src="../img/<%=gb.getGimage() %>" height="150"></a></div>
			<div><%=gb.getGtitle() %></div>
			<div><font color="red" size="4px"><%=df.format(gb.getGprice()) %>원</font></div>
			<div>발매 <%=sdf.format(gb.getGrel_date()) %></div>
		</td>
<%
		if(count % 3 ==0){
			out.println("</tr><tr>");
		}
		if(i==8){
			break;
		}
	}
	}%>
</tr>
</table>
<%@include file="mall_bot.jsp"%>