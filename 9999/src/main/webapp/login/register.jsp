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
	[value="가입하기"]{
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
</script>

<%@include file="../display/mall_top2.jsp"%>
<%@include file="../display/mall_left.jsp"%>
	<form method="post" action="register_proc.jsp">
	<table class="retb" border=0>
	 <tr height="60">
	  <td colspan="2" align="center" valign="top" style="padding-top: 0"><span id="reg">회원가입</span></td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">아이디</td>
	  <td class="rev" valign="top">
	   <input type="text" name="id" maxlength="15" size="20" onkeyup="idcheck()">
	   <div><span id="idMsg" class="checkMsg"></span></div>
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
	   <input type="text" name="name" maxlength="15" size="20" onkeyup="namecheck()">
	   <div><span id="nameMsg" class="checkMsg"></span></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">이메일</td>
	  <td class="rev" valign="top">
	   <input type="email" name="email" maxlength="25" size="20" onkeyup="emailcheck()">
	   <div><span id="emailMsg" class="checkMsg"></span></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">생년월일</td>
	  <td class="rev" valign="top">
	   <input type="date" name="birth">
	   <div><span id="birthMsg" class="checkMsg"></span></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">구분</td>
	  <td class="rev" valign="top">
	   개인<input type="radio" name="mgroup" value="0" onclick="groupcheck()">
	   기업<input type="radio" name="mgroup" value="1" onclick="groupcheck()">
	  </td>
	 </tr>
	 <tr class="regtr">
	  <td class="rev0" valign="top">기업명</td>
	  <td class="rev" valign="top">
	   <input type="text" name="developer" size="20" onkeyup="devcheck()">
	   <div><span id="developMsg" class="checkMsg"></span></div>
	  </td>
	  <tr>
	   <td colspan="2" align="center">
	    <input id="regBtn" type="submit" value="가입하기" onclick="return writeSave()">
	   </td>
	  </tr>
	</table>
	</form>
<%@include file="../display/mall_bot.jsp"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">