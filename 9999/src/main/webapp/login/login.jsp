<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#logtb{
		width: 70%;
		padding-top: 100;
		text-align: center;
		border-spacing: 15;
	}
	.logbox{
		width:300;
		height: 40;
	}
	input::placeholder {
 		font-size: 20px;
	} 
	input[type=submit]{
		width: 300;
		height: 40;
		background-color: red;
		border-style:none;
		border-radius: 3px;
		cursor: pointer;
	}
	[value="로그인"]{
		font-size: 15;
		font: 700;
		color: white;
	}
a{
		text-decoration: none;
		color: black;
}	
</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function findpasswordpopup(){
		var url="findpassword.jsp";
		var name = "비밀번호 찾기"
		var option = "width=550,height=250,top=100,left=200,location=no";
		window.open(url,name,option);
		
	}
	function findidpopup(){
		var url="findid.jsp";
		var name = "아이디 찾기"
		var option = "width=550,height=250,top=100,left=200,location=no";
		window.open(url,name,option);
		
	}
</script>



<%@include file="../display/mall_top2.jsp"%> 
<%@include file="../display/mall_left.jsp"%> 
	<form method="post" action="login_proc.jsp">
	<table id="logtb" border=0>
		<tr>
		 <td><font size="6px">로그인</font></td>
		</tr>
		<tr>
		 <td><input class="logbox" type="text" name="id" placeholder="아이디"></td>
		</tr>
		<tr>
		 <td><input class="logbox" type="password" name="password" placeholder="비밀번호"></td>
		</tr>
		<tr>
		 <td><input type="submit" value="로그인" onclick="return logincheck()"></td>
		</tr>
		<tr>
		 <td> 
		  <a href="register.jsp">회원가입</a> | 
		  <a href="javascript:findidpopup()">아이디찾기</a> | 
		  <a href="javascript:findpasswordpopup()">비밀번호찾기</a>
		 </td>
		</tr>
	</table>
	</form>
<%@include file="../display/mall_bot.jsp"%>