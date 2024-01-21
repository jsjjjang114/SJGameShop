<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = (String)session.getAttribute("userid");
%>
<jsp:useBean id="ub" class="user.UserBean"/>
<jsp:setProperty property="*" name="ub"/>
<%
	UserDAO udao = UserDAO.getInstance();
	int cnt = udao.updateUser(userid,ub); 
	String msg;
	String url;
	if(cnt==-1){
		msg="회원정보 수정 실패했습니다.";
		url="update_user.jsp";
	} else{ 
		msg="회원정보를 수정했습니다.";
		url="myPage.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>