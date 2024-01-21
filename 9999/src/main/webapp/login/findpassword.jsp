<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#fptb{
		border-spacing: 10px;
	}
	[type="submit"]{
		background-color:black;
		color:white;
		width: 100px;
		border-style:none;
		border-radius: 3px;
		cursor: pointer;
	}
	td{
		font-weight: 600;
	}
</style>    
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript"></script>
<form method="post" action="findpasswordProc.jsp">
<h4>비밀번호 찾기</h4>
<p style="line-height: 0.1">회원가입 시 등록하신 아이디와 이름, 이메일을 입력해주세요.</p>
<table id="fptb" border="0">
	<tr>
	<td>아이디</td>
	<td><input type="text" name="id"></td>
	</tr>
	<tr>
	<td>이름</td>
	<td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td>Email</td>
	<td>
		<input type="text" name="email">
	</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="아이디 찾기" onclick="return findpasswordcheck()">
	</tr>
</table>
</form>