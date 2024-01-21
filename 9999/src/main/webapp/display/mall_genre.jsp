<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="game.GameBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="game.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
</style>
<%@include file="mall_top2.jsp"%>
<%@include file="mall_left.jsp"%>
 
<%
	userid = (String)request.getAttribute("userid");
	String ggenre = request.getParameter("ggenre");
	 
	SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
	DecimalFormat df = new DecimalFormat("###,###");
	
	int pageSize=12;
	String pageNum0 = request.getParameter("pageNum");
	if(pageNum0==null){
		pageNum0 = "1"; 
	}
	int pageNum = Integer.parseInt(pageNum0);
	int startRow = (pageNum-1) * pageSize + 1;
	int endRow = pageNum * pageSize;
	
	GameDAO gdao = GameDAO.getInstance();
	int count = gdao.getConutGenre(ggenre); 
	ArrayList<GameBean> lists = gdao.getAllByGenre(startRow,endRow,ggenre); 
%> 
<br> 
<div align="left" style="margin-left: 100px;"><font size="5px">'<%=ggenre %>' 장르 게임</font></div>
<hr width="800">
<table width="800">
<tr>
<%
	int cnt = 0;
	if(lists.size()==0){
%>
		<td align="center" width="300" height="200" style="padding: 10px; font-size: 30px;">
			<span class="nog">등록된 제품이 없습니다.</span>
		</td>
	<%} else{
	for(int i=0;i<lists.size();i++){
		cnt++;
		GameBean gb = lists.get(i); %>
		<td align="center" valign="top" width="300" height="200" style="padding: 10px">
			<div><a href="mall_gameView.jsp?gnum=<%=gb.getGnum() %>"><img src="../img/<%=gb.getGimage() %>" height="150"></a></div>
			<div><%=gb.getGtitle() %></div>
			<div><font color="red" size="4px"><%=df.format(gb.getGprice()) %>원</font></div>
			<div>발매 <%=sdf.format(gb.getGrel_date()) %></div>
		</td>
<%
		if(cnt % 3 ==0){
			out.println("</tr><tr>");
		}
	}
	}%>
</tr>
</table>
<hr width="800">
<div style="width: 800; margin-bottom: 100"">
<%
	if(count > 0){
		int pageCount = count/pageSize + ((count%pageSize!=0) ? 1:0); //
		
		int pageBlock = 10;
		int startPage = ((pageNum-1)/pageBlock * pageBlock)+1; //1
		int endPage = startPage + pageBlock - 1; //3
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
		if(startPage>10){
		%>
			<a href="mall_genre.jsp?pageNum=<%=startPage-10 %>&ggenre=<%=ggenre%>">이전</a>
		<%		
		}
		for(int i=startPage;i<=endPage;i++){
		%>
			<a href="mall_genre.jsp?pageNum=<%=i %>&ggenre=<%=ggenre%>"><%=i %></a>
		<%
		}
		if(endPage<pageCount){
		%>
			<a href="mall_genre.jsp?pageNum=<%=startPage+10 %>&ggenre=<%=ggenre%>">다음</a>
		<%
		}
	}
%>
</div>
<%@include file="mall_bot.jsp"%>