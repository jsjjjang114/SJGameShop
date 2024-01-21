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
		width: 800;
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
	[value="등록하기"]{
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
	UserDAO udao = UserDAO.getInstance();
	UserBean ub = udao.getUserInfoById(userid); 
%>
	<form method="post" action="insert_gameProc.jsp" enctype="multipart/form-data">
	<table class="retb" border=0>
	 <tr height="60">
	  <td colspan="2" align="center" valign="top" style="padding-top: 0"><span id="reg">상품등록</span></td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">게임명</td>
	  <td class="rev" valign="top">
	   <input type="text" name="gtitle" placeholder="게임명">
	   <div></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">게임이미지</td>
	  <td class="rev" valign="top">
	   <input id="isFile" type="file" name="gimage">
	   <div></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">가격</td>
	  <td class="rev" valign="top">
	   <input type="text" name="gprice" placeholder="가격">
	   <div></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">장르</td>
	  <td class="rev" valign="top">
	   <select id="multiselect_gamePlatform" multiple="multiple" name="ggenre">
 	 	<option value="액션">액션</option>
  		<option value="RPG">RPG</option>
  		<option value="어드벤처">어드벤처</option>
  		<option value="음악">음악</option>
 		<option value="스포츠">스포츠</option>
  		<option value="레이싱">레이싱</option>
  		<option value="퍼즐">퍼즐</option>
  		<option value="보드">보드</option>
  		<option value="기타">기타</option>
		</select>
	   <div></div>
	  </td>
	 </tr>
	 
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">발매일</td>
	  <td class="rev" valign="top">
	   <input type="date" name="grel_date">
	   <div></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">등급</td>
	  <td class="rev" valign="top">
	   <select name="grating">
	   	<option value="all.gif">전체이용가
	   	<option value="over12.gif">12세이용가
	   	<option value="over15.gif">15세이용가
	   	<option value="over18.gif">18세이용가
	   </select>
	   <div></div>
	  </td>
	 </tr>
	 
	 <tr class="regtr">
	  <td class="rev0" valign="top">플랫폼</td>
	  <td class="rev" valign="top">
	   <input type="radio" name="platform" value="pc">PC
	   <input type="radio" name="platform" value="nintendoswitch">Nintendo Switch
	   <input type="radio" name="platform" value="playstation">PlayStation
	  </td>
	 </tr>
	 <tr class="regtr">
	  <td class="rev0" valign="top">기업명</td>
	  <td class="rev" valign="top">
	   <input type="text" name="developer" value="<%=ub.getDeveloper() %>" size="20" readonly>
	   <div></div>
	  </td>
	 <tr class="regtr">
	  <td class="rev0" valign="top" height="100">상세정보</td>
	  <td class="rev" valign="top">
	   <textarea name="gcontent" rows="5" cols="40" placeholder="내용을 입력해주세요."></textarea>
	   <div></div>
	  </td>
	  <tr>
	   <td colspan="2" align="center">
	    <input id="regBtn" type="submit" value="등록하기" onclick="return writeSave3()">
	   </td>
	  </tr>
	</table>
	</form>
<%@include file="../display/mall_bot.jsp"%>

<link rel="stylesheet" href="../js/bootstrap-multiselect.css">
<script type="text/javascript" src="../js/bootstrap-multiselect.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">