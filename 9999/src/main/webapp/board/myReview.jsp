<%@page import="game.GameDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="game.GameBean"%>
<%@page import="list.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="list.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.btn-two {
		width:100; 
		height:30;
  		color: white; 
  		display: inline-block;
  		cursor:pointer;
  		border: 1px solid rgba(0,0,0,0.21);
  		border-bottom-color: rgba(0,0,0,0.34);
	}
	.btn-two.blue {background-color: #0080FF;}
</style>
<%@include file="../display/mall_top2.jsp"%> 
<%@include file="../display/mall_left_My.jsp"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	BoardDAO bdao = BoardDAO.getInstance(); 
	GameDAO gdao = GameDAO.getInstance();

	int pageSize=5;
	String pageNum0 = request.getParameter("pageNum");
	if(pageNum0==null){
		pageNum0 = "1"; 
	}
	int pageNum = Integer.parseInt(pageNum0);
	int startRow = (pageNum-1) * pageSize + 1;
	int endRow = pageNum * pageSize;
	
	int count = bdao.getArticleCountByWriter(username);
	int number = count - (pageNum-1) * pageSize;
	ArrayList<BoardBean> articleLists = bdao.getArticlesByWriter(startRow, endRow, username);
%>
<div style="margin-top:15">
 <h2>나의 리뷰</h2>
</div>
<table width="100%" style="border-collapse: collapse;
margin-bottom: 10px;">
<tr height="50" bgcolor="gray" style="font-size:18px;">
  <th colspan="2">번호</th>	 	
  <th colspan="2">제목</th>
  <th>구분</th>
 </tr>
<%
if(count==0){
%>
 <tr>
  <td colspan="5">게시판에 작성된 글이 없습니다.</td>
 </tr>
<%} else {
		for(int i=0;i<articleLists.size();i++){
		BoardBean bb = articleLists.get(i);
		GameBean gb = gdao.getByGnum(bb.getGnum());
		%>
<tr style="border-top:0.5px solid black;">
 <td rowspan="2" align="center"><%=number-- %></td>
 <td rowspan="2" width="110" style="border-right: 0.3px solid gray;"><img width="100" height="50" src="<%=request.getContextPath()%>/img/<%=gb.getGimage()%>"></td> 
 <td colspan="2" align="center">
  <a href="myContent.jsp?num=<%=bb.getNum()%>">
   <%=bb.getSubject() %>
  </a>
 </td>
 <td rowspan="2" align="center" style="border-left: 0.3px solid gray;"><%=bb.getWriter() %></td>
</tr> 
<tr>
 <td align="center">
 	조회수:<%=bb.getReadcount() %> | 
 	날짜:<%=sdf.format(bb.getReg_date()) %>
 </td>
</tr>
<%
		}
	} %>
	
 <tr style="border-top:0.5px solid black;">
  <td colspan="5"></td>
 </tr>	
</table>
<%
	if(count > 0){
		int pageCount = count/pageSize + ((count%pageSize!=0) ? 1:0); //
		
		int pageBlock = 5; //a태그 개수
		int startPage = ((pageNum-1)/pageBlock * pageBlock)+1; //1
		int endPage = startPage + pageBlock - 1; //3
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
		if(startPage>5){
		%>
			<a href="list.jsp?pageNum=<%=startPage-5 %>">Prev</a>
		<%		
		}
		for(int i=startPage;i<=endPage;i++){
		%>
			<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
		<%
		}
		if(endPage<pageCount){
		%>
			<a href="list.jsp?pageNum=<%=startPage+5 %>">Next</a>
		<%
		}
	}
%>
 
<%@include file="../display/mall_bot.jsp"%> 
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
	function review(userid){
		if(userid=='null'){
			var qwe = confirm("로그인이 필요한 서비스입니다.\n로그인 하시겠습니까?");
			if(qwe){
				location.href="../login/login.jsp";
			} else{
				return;
			}
		} else{
			location.href="writeForm.jsp";
		}
		
	}
</script>
