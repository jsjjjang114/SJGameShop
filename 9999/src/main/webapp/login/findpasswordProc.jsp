<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	UserDAO udao = UserDAO.getInstance();
	String password = udao.findpassword(id,name,email);
	String msg;
	if(password==null){ 
		msg="입력하신 정보로 가입된 회원은 없습니다.";
	} else{
		
		msg = "찾으시는 비밀번호는 "+password+" 입니다.";
	}
	System.out.println(msg);
%> 
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="findpassword.jsp"
</script>
