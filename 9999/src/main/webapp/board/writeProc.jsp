<%@page import="list.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String username = (String)session.getAttribute("username");
	 
%>
<jsp:useBean id="bb" class="list.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>
<%
	BoardDAO bdao = BoardDAO.getInstance();
	bb.setIp(request.getRemoteAddr());
	int cnt = bdao.insertArticle(bb,username);
	String msg;
	String url; 
	if(cnt==-1){
		msg="리뷰 등록에 실패했습니다.";
		url = "writeForm.jsp";
	} else{
		msg = "리뷰가 등록되었습니다.";
		url = "list.jsp";
	}
%> 
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>"
</script>
