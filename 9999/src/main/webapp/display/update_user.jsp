<%@page import="java.text.SimpleDateFormat"%>
<%@page import="user.UserBean"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#reg{
		font-size: 30;
	}
	.retb{
		padding-top:50px;
		width: 70%;
		height: 300px;
		font-family: sans-serif;
		font:bold;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.rev0{ 
		padding-left:150;
		width:50%;
		font-size: 17;
	}
	.regtr{ 
		height: 42;
	}
	.checkMsg{
		color:red;
		font-size: 13;
		opacity: 0.8;
	}
	#regBtn{
		width: 100;
		height: 50;
		background-color: red;
		border-style:none;
		border-radius: 3px;
		cursor: pointer;
	}
	[value="수정하기"]{
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
<script type="text/javascript" src="../login/script.js"></script>
<script type="text/javascript">
</script>

<%@include file="mall_top2.jsp"%>
<%@include file="mall_left_My.jsp"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	UserDAO udao = UserDAO.getInstance();
	UserBean ub = udao.getUserInfoById(userid); 
%>
	<form method="post" action="update_proc.jsp">
	<table class="retb" border=0>
	 <tr height="60">
	  <td colspan="2" align="center" valign="top" style="padding-top: 0"><span id="reg">회원정보수정</span></td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">아이디</td>
	  <td class="rev" valign="top">
	   <input type="text" name="id" value="<%=userid%>" disabled="disabled">
	   <div></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">비밀번호</td>
	  <td class="rev" valign="top">
	   <input type="password" name="password" maxlength="20" size="20" onkeyup="pwcheck()">
	   <div><span id="pwMsg" class="checkMsg"></span></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">비밀번호 확인</td>
	  <td class="rev" valign="top">
	   <input type="password" name="passwordCheck" maxlength="20" size="20" onkeyup="repassword_keyup()">
	   <div><span id="pwCkMsg" class="checkMsg"></span></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">이름</td>
	  <td class="rev" valign="top">
	   <input type="text" name="name" value="<%=ub.getName()%>" disabled="disabled">
	   <div></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">이메일</td>
	  <td class="rev" valign="top">
	   <input type="email" name="email" value="<%=ub.getEmail() %>" maxlength="25" size="20" onkeyup="emailcheck()">
	   <div><span id="emailMsg" class="checkMsg"></span></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">생년월일</td>
	  <td class="rev" valign="top">
	   <input type="text" name="birth" value="<%=sdf.format(ub.getBirth())%>" disabled="disabled">
	   <div></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">구분</td>
	  <td class="rev" valign="top">
	   개인<input type="radio" name="mgroup" value="0" onclick="groupcheck()" 
	   <%if(ub.getMgroup()==0){%>checked<%}%>>
	   기업<input type="radio" name="mgroup" value="1" onclick="groupcheck()"
	   <%if(ub.getMgroup()==1){%>checked<%}%>>
	  </td>
	 </tr>
	 <tr class="regtr">
	  <td class="rev0" valign="top">기업명</td>
	  <td class="rev" valign="top">
	   <input type="text" name="developer" value="<%=ub.getDeveloper() %>" size="20" onkeyup="devcheck()">
	   <div><span id="developMsg" class="checkMsg"></span></div>
	  </td>
	  <tr>
	   <td colspan="2" align="center">
	    <input id="regBtn" type="submit" value="수정하기" onclick="return writeSave2()">
	   </td>
	  </tr>
	</table>
	</form>
<%@include file="../display/mall_bot.jsp"%>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">