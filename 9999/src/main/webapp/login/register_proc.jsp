<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Date birth = Date.valueOf(request.getParameter("birth"));
	Timestamp birth0 = new Timestamp(birth.getTime());
%>
<jsp:useBean id="ub" class="user.UserBean"/>
<jsp:setProperty property="name" name="ub"/>
<jsp:setProperty property="id" name="ub"/>
<jsp:setProperty property="password" name="ub"/>
<jsp:setProperty property="email" name="ub"/>
<jsp:setProperty property="mgroup" name="ub"/>
<jsp:setProperty property="developer" name="ub"/>
<% 
	ub.setBirth(birth0);
	UserDAO udao = UserDAO.getInstance();
	int cnt = udao.insertData(ub);  
	String msg;
	String url;
	if(cnt==-1){
		msg = "가입실패했습니다";
		url = "register.jsp";
	} else{
		msg = "회원가입되었습니다.";
		url = "login.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>"
</script>