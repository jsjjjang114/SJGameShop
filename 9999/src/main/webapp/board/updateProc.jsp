<%@page import="list.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	 
%>
<jsp:useBean id="bb" class="list.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>
<%
	BoardDAO bdao = BoardDAO.getInstance();
	int cnt = bdao.updateArticle(bb,num); 
	String msg;
	if(cnt==-1){ 
		msg = "리뷰 수정에 실패하였습니다.";
	} else{
		msg="리뷰가 수정되었습니다.";
	}
%> 
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="myContent.jsp?num=<%=num%>"; 
</script>