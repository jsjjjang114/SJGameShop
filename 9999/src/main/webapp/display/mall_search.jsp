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
	request.setCharacterEncoding("UTF-8");
	userid = (String)request.getAttribute("userid");
	String searchWord = request.getParameter("searchWord");
	
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

	
	String searchWord0 = searchWord.replace(" ", ""); 
	
	System.out.println(searchWord0);
	
	GameDAO gdao = GameDAO.getInstance();
	int count = gdao.getCountSearch(searchWord0); 
	ArrayList<GameBean> lists = gdao.getAllByTitle(startRow,endRow,searchWord0); 
%>
<br> 
<div align="left" style="margin-left: 100px;"><font size="5px">'<%=searchWord %>' 검색 결과</font></div>
<hr width="800">
<table width="800">
<tr>
<%
	int cnt=0;
	if(lists.size()==0){
%>
		<td align="center" width="300" height="200" style="padding: 10px; font-size: 30px;">
			<b>등록된 제품이 없습니다.</b>
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
			<a href="mall_search.jsp?pageNum=<%=startPage-10 %>&searchWord=<%=searchWord0%>">이전</a>
		<%		
		}
		for(int i=startPage;i<=endPage;i++){
		%>
			<a href="mall_search.jsp?pageNum=<%=i %>&searchWord=<%=searchWord0%>"><%=i %></a>
		<%
		}
		if(endPage<pageCount){
		%>
			<a href="mall_search.jsp?pageNum=<%=startPage+10 %>&searchWord=<%=searchWord0%>">다음</a>
		<%
		}
	}
%>
</div>
<%@include file="mall_bot.jsp"%>