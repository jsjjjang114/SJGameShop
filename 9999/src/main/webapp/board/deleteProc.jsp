<%@page import="list.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO bdao = BoardDAO.getInstance();
	int cnt = bdao.deleteArticle(num); 
	String msg;
	if(cnt==-1){
		msg = "삭제실패했습니다.";
	} else{
		msg="삭제되었습니다.";
	}
%>  
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="myReview.jsp"; 
</script>