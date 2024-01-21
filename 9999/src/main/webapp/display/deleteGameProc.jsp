<%@page import="order.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = (String)session.getAttribute("userid");
	int gnum = Integer.parseInt(request.getParameter("gnum"));
	
	OrderDAO odao = OrderDAO.getInstance();
	int cnt = odao.deleteGame(userid,gnum);
	String msg;
	if(cnt==-1){
		msg = "삭제실패했습니다.";
	} else{
		msg="삭제되었습니다."; 
	}
%> 
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="myPage.jsp"; 
</script>