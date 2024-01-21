<%@page import="java.text.SimpleDateFormat"%>
<%@page import="game.GameBean"%>
<%@page import="list.BoardBean"%>
<%@page import="list.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#contb{
		text-align: center;
		font-size: 17px;
	}
	#contb th{
		background-color: gray;
	} 
	.coninfo{
		font-size:13px;
		margin-top: 2px;
		margin-left: 10px;
	
	}
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
<%@include file="../display/mall_left.jsp"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분");
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardDAO bdao = BoardDAO.getInstance();
	GameDAO gdao = GameDAO.getInstance();
	
	
	BoardBean bb = bdao.getArticleByNum(num);
	GameBean gb = gdao.getByGnum(bb.getGnum());
%>
<div style="margin-top:15">
 <h2>게임 리뷰 게시판</h2>
</div>
<table border="1" width="100%">

 <tr>
  <td bgcolor="#D3D3D3">
   <div id="subj" style="padding: 5px; font-size: 20px;">
    <%=bb.getSubject() %>
   </div>
  </td>
 </tr>
 
 <tr>
     <td> 
      <div class="coninfo"><span>작성일시:<%=sdf2.format(bb.getReg_date()) %></span></div>
      <div class="coninfo"><span>조회수:<%=bb.getReadcount() %></span></div>
      <div class="coninfo"><span>이메일:asd@asd.com</span></div>
      <div class="coninfo"><span>ip:<%=bb.getIp() %></span></div>
     </td>
    </tr>
 <tr>
  <td align="center">
  
   <div style="margin-top:20">
   <img src="<%=request.getContextPath()%>/img/<%=gb.getGimage()%>"
   width="400" height="220">
   <table border="1" width="400" id="contb">
    <tr><th colspan=2>제목</th><td colspan=2><%=gb.getGtitle() %></td></tr>
    <tr>
     <th>개발사</th><td><%=gb.getGdeveloper() %></td>
     <th>출시일</th><td><%=sdf.format(gb.getGrel_date()) %></td>
    </tr>
    <tr>
     <th>장르</th><td><%=gb.getGgenre() %></td>
     <th>기종</th><td><%=gb.getPlatform() %></td>
    </tr>
    <tr>
     <th>등급</th><td><img width="30" src="<%=request.getContextPath()%>/img/<%=gb.getGrating()%>"></td>
     <th>작성자</th><td><%=bb.getWriter() %></td>
    </tr>
   </table>
   </div>
   
   
  <div style="margin-top:20; border-top:0.7px solid gray; text-align: left">
   <p style="margin:10px; font-size: 15px; font-family: monospace;">
    <%=bb.getContent() %>
   </p>
  </div>
 </tr>
 <tr>
  <td align="right">
<%	if(bb.getRe_level()!=0){ %>
   <button class="btn-two blue mini" onclick="location.href='content.jsp?num=<%=bb.getRef()%>'">본문보기</button>	
  <%} %>
<%	if(bb.getRe_level()<2){ %>
   <button class="btn-two blue mini" onclick="reply('<%=userid%>')">답글쓰기</button>
 <% } %>
   <button class="btn-two blue mini" onclick="location.href='list.jsp'">목록</button>
  </td>
 </tr>
</table>
<%@include file="../display/mall_bot.jsp"%> 
<script type="text/javascript">
	function reply(userid){
		if(userid=='null'){
			var qwe = confirm("로그인이 필요한 서비스입니다.\n로그인 하시겠습니까?");
			if(qwe){
				location.href="../login/login.jsp";
			} else{
				return;
			}
		} else{
			location.href="replyForm.jsp?num=<%=num%>";
		}
	}
</script>