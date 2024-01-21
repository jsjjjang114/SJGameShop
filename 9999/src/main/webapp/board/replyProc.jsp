<%@page import="list.BoardBean"%>
<%@page import="list.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String username = (String)session.getAttribute("username");
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardDAO bdao = BoardDAO.getInstance();
	BoardBean bb0 = bdao.getArticleByNum(num);	
%>
<jsp:useBean id="bb" class="list.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>
<%
	bb.setWriter(username);
	bb.setRef(bb0.getRef());
	bb.setRe_step(bb0.getRe_step());
	bb.setRe_level(bb0.getRe_level());
	bb.setIp(request.getRemoteAddr());
	
	int cnt = bdao.insertReplyArticle(bb); 
	String msg;
	String url; 
	if(cnt==-1){
		msg="답글을 등록 실패했습니다.";
		url = "content.jsp?num="+num; 
	} else{
		msg = "답글이 등록되었습니다.";
		url = "list.jsp";
	}
%> 
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>"
</script>
