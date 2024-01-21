<%@page import="order.OrderDAO"%>
<%@page import="game.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userid = request.getParameter("userid");
	int gnum  = Integer.parseInt(request.getParameter("gnum"));
	
	OrderDAO odao = OrderDAO.getInstance();
	boolean oCheck = odao.searchData(userid,gnum); 
	String str;
	if(oCheck){
		str="x"; 
	} else{
		str="o";
	}
	out.print(str);
%>
 