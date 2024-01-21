<%@page import="game.GameDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String configFolder=config.getServletContext().getRealPath("img"); 
	int maxsize = 1024*1024*10; 
	String encoding = "UTF-8"; 

	System.out.println(configFolder);
	MultipartRequest mr = null;
	mr = new MultipartRequest(request,configFolder,maxsize,encoding,new DefaultFileRenamePolicy());
	
	GameDAO gdao = GameDAO.getInstance();
	boolean flag = gdao.searchgame(mr);
	String msg;
	String url;
	if(flag){
		msg="이미 등록되어있는 게임명입니다.";
		url="insert_game.jsp";
	} else{
		int cnt = gdao.insertGame(mr); 
		if(cnt==-1){
			msg="등록실패했습니다.";
			url="insert_game.jsp";
		} else{
			msg="제품을 등록했습니다.";
			url="myPage.jsp";
		}
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>"
</script>