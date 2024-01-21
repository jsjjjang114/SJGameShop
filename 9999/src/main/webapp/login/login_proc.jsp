<%@page import="user.UserBean"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	UserDAO udao = UserDAO.getInstance();
	UserBean ub = udao.getUserInfo(id,password); 
	
	String viewPage;
	if(ub==null){ 
		viewPage = request.getContextPath()+"/login/login.jsp";
%>
		<script type="text/javascript">
			alert("가입된 아이디가 아니거나 비밀번호가 틀립니다.");
		</script>
<%
	} else{ 
		viewPage = request.getContextPath()+"/display/mall_main.jsp";
		session.setAttribute("userid", ub.getId());
		session.setAttribute("userno", ub.getNo());
		session.setAttribute("username", ub.getName());
	}
%>
<script type="text/javascript">
	location.href="<%=viewPage%>";
</script>
