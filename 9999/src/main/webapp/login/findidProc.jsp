<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	UserDAO udao = UserDAO.getInstance();
	String id = udao.findid(name,email); 
	String msg;
	if(id==null){ 
		msg="입력하신 정보로 가입된 회원은 없습니다.";
	} else{
		
		msg = "찾으시는 아이디는 "+id+" 입니다.";
	}
	System.out.println(msg);
%> 
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="findid.jsp"
</script>
