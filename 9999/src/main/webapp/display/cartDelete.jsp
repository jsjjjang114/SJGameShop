<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gameCart" class="game.CartBean" scope="session"/>
<%
	String[] gnum = request.getParameterValues("chk");
	gameCart.deletegame(gnum);
	response.sendRedirect("mall_cartList.jsp");
%> 