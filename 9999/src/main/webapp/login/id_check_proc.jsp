<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	UserDAO udao = UserDAO.getInstance();
	boolean idCheck = udao.idCheck(id); 
	String str;
	if(idCheck){
		str="x"; 
	} else{
		str="o";
	}
	out.print(str);
%>
 