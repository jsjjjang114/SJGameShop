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
	.btn-two2 {
		width:50;
		height:25; 
  		color: white; 
  		display: inline-block;
  		cursor:pointer;
  		border: 1px solid rgba(0,0,0,0.21);
  		border-bottom-color: rgba(0,0,0,0.34);
	}
	.btn-two.blue, .btn-two2.blue{background-color: #0080FF;}
</style>
<%
	request.setCharacterEncoding("UTF-8");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	BoardDAO bdao = BoardDAO.getInstance(); 
	GameDAO gdao = GameDAO.getInstance();	

	String searchWord = request.getParameter("searchWord");
	
	int pageSize=10;
	String pageNum0 = request.getParameter("pageNum");
	if(pageNum0==null){
		pageNum0 = "1"; 
	}
	int pageNum = Integer.parseInt(pageNum0);
	int startRow = (pageNum-1) * pageSize + 1;
	int endRow = pageNum * pageSize;
	
	int count = bdao.getArticleCount();
	int number = count - (pageNum-1) * pageSize;
	ArrayList<BoardBean> articleLists = bdao.getArticlesBySearch(startRow, endRow, searchWord); 
%>
<%@include file="../display/mall_top2.jsp"%> 
<%@include file="../display/mall_left.jsp"%>
<div style="margin-top:15">
 <h2>게임 리뷰 게시판</h2>
</div>
<div style="text-align: left">
 <h4>'<%=searchWord %>' 검색 결과</h4>
</div>
<table width="100%" style="border-collapse: collapse;
margin-bottom: 10px;">
<tr height="50" bgcolor="gray" style="font-size:18px;">
  <th colspan="2">번호</th>	 	
  <th colspan="2">제목</th>
  <th>글쓴이</th>
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
			if(bb.getRe_level()==0){
		%>
<tr style="border-top:0.5px solid black;">
 <td rowspan="2" align="center"><%=number-- %></td>
 <td rowspan="2" width="110" style="border-right: 0.3px solid gray;"><img width="100" height="50" src="<%=request.getContextPath()%>/img/<%=gb.getGimage()%>"></td> 
 <td colspan="2" align="center">
  <a href="content.jsp?num=<%=bb.getNum()%>">
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
<%} else{ %>

<tr height="33" style="border-top:0.5px solid black;">
 <td rowspan="2" align="center"><%=number-- %></td>
 <td align="left" rowspan="2" width="110">
  <a href="content.jsp?num=<%=bb.getRef() %>">본문보기</a>
 </td> 
 <td colspan="2" align="center">
  <a href="content.jsp?num=<%=bb.getNum()%>">
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

  <%}%>


<%
		}
	} %>
	
 <tr style="border-top:0.5px solid black;">
  <td colspan="5">
   <button class="btn-two blue mini" onclick="review('<%=userid%>')">리뷰등록</button>
   <button class="btn-two blue mini" onclick="location.href='list.jsp'">전체글보기</button>
  </td>
 </tr>	
 <tr>
 
  <td colspan="5" align="center" height="50">
   <div id="searchDiv2">
 	  <form action="list_search.jsp" method="post">
	   <input type="text" name="searchWord" placeholder="검색">
	   <button class="btn-two2 blue">검색</button>
	  </form>
	</div>
  </td>
 </tr>
 
</table>
<%
	if(count > 0){
		int pageCount = count/pageSize + ((count%pageSize!=0) ? 1:0); //
		
		int pageBlock = 10; //a태그 개수
		int startPage = ((pageNum-1)/pageBlock * pageBlock)+1; //1
		int endPage = startPage + pageBlock - 1; //3
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
		if(startPage>10){
		%>
			<a href="list.jsp?pageNum=<%=startPage-10 %>">Prev</a>
		<%		
		}
		for(int i=startPage;i<=endPage;i++){
		%>
			<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
		<%
		}
		if(endPage<pageCount){
		%>
			<a href="list.jsp?pageNum=<%=startPage+10 %>">Next</a>
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
