<%@page import="order.OrderBean"%>
<%@page import="order.OrderDAO"%>
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
<%@include file="../display/mall_left.jsp"%>
<%
	
	OrderDAO odao = OrderDAO.getInstance();
	ArrayList<OrderBean> lists = odao.getMyGame(userid);
	GameDAO gdao = GameDAO.getInstance();	

%>
<div style="margin-top:15">
 <h2>게임 리뷰 게시판</h2>
</div>
<form action="writeProc.jsp" method="post">
<table border="1" width="800" >
<tr>
  <th bgcolor="#D3D3D3">제목</th>
  <td><input type="text" name="subject" placeholder="제목을 입력해주세요."></td>
  <th bgcolor="#D3D3D3">
  보유한게임
  </th>
  <td>
   <select name="gnum">
<%	for(int i=0;i<lists.size();i++){
		OrderBean ob = lists.get(i);
		GameBean gb = gdao.getByGnum(ob.getGnum());
	%>
	<option value="<%=gb.getGnum()%>"><%=gb.getGtitle()%></option>
<% } 
%>
   </select> 
  </td>
 </tr>
 <tr>
  <td colspan="4">
   <textarea style="width: 100%" name ="content" rows="15" cols="60"
   placeholder="내용을 입력해주세요."></textarea>
  </td>
 </tr>
 <tr>
  <td colspan="4" align="right">
   <input class="btn-two blue mini" type="submit" value="등록" onclick="return writechk()">
   <button type="button" class="btn-two blue mini" onclick="history.back(-1)">취소</button>
  </td>
 </tr>	
</table>
</form>

 
<%@include file="../display/mall_bot.jsp"%> 
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
	function writechk(){
		if($("[name='subject']").val()==""){
			alert('제목을 입력해주세요.');
			$("[name='subject']").focus();
			return false;
		}
		if($("[name='content']").val()==""){
			alert('내용을 입력해주세요.');
			$("[name='content']").focus();
			return false;
		}
	}
</script>