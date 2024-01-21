<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap');
#maintb{
	width:100%; 
	height: 100%; 
	border-collapse: collapse;
	font-family: 'Nanum Gothic', sans-serif;
}
#searchDiv{
	height: 40px;
	width: 520px;
	border: 1px solid black;
	background: #fff;
}
#searchBtn{
	width: 50px;
	height: 100%;
	border: 0px;
	background: white;
	outline: none;
	float:right;
	color: #fff;
	cursor: pointer;
}
#form-control{
	font-size:16px;
	width: 325px;
	padding: 10px;
	border:0px;
	outline: none;
	float:left;
}

input::placeholder {
  font-size: 14px;
}
.alink{
		text-decoration: none;
		color: black;
} 
.nog{
	color:gray;
}
a{
	text-decoration: none;
	color:black;
}
</style>
<%
	String userid = (String)session.getAttribute("userid");
	String username = (String)session.getAttribute("username");
	String cPath = request.getContextPath();
	String myPage;
	String myCart;
	if(userid==null){
		myPage = cPath+"/login/login.jsp";
		myCart = cPath+"/login/login.jsp";
	} else {
		myPage = cPath+"/display/myPage.jsp";
		myCart = cPath+"/display/mall_cartList.jsp";
	}
%>
<body>
<table id="maintb">
	<tr height="70px">
	 <td width="100" rowspan="2" colspan="2" ></td>
	 
	 <td width="100px" height="80px" rowspan="2">
	  <a href="<%=request.getContextPath() %>/display/mall_main.jsp"><img src="<%=cPath %>/img/logo.png" width="200px"></a>
	 </td>
	 <td valign="middle" width="550px" style="overflow: hiddlen;
 		 white-space: nowrap; position: relative; padding-left: 50;" rowspan=2>
 	  <div id="searchDiv">
 	  <form action="../display/mall_search.jsp" method="post">
	   <input id="form-control" type="text" name="searchWord" placeholder="검색">
	   <button id="searchBtn"><img src="<%=cPath %>/img/search.png" width="100%" height="100%"></button>
	  </form>
	  </div>
	 </td>
	 <td width="150" align="center" style=" overflow: hiddlen;
 		 white-space: nowrap;">
<% if(userid==null){ %> 
	  <a class="alink" href="../login/login.jsp">로그인</a> | 
	  <a class="alink" href="../login/register.jsp">회원가입</a>
<% } else { %>
		<span><%=username %>
		<a href="../login/logout.jsp"><img src="../img/logoutBtn.png" width="20px" height="20px"></a>
		</span>
	<%}%>
	 </td>
	 <td rowspan="2" width="380"></td>
	 <tr  style="border-bottom: 0.5px solid gray">
	  <td style="padding: 0; overflow: hiddlen;
 		 white-space: nowrap;" align="center" valign="top">
	   <a href="<%=myPage%>"><img src="<%=cPath %>/img/mypage.png" width="30px" height="30px"></a>
	   <a href="<%=myCart%>"><img src="<%=cPath %>/img/cart.png" width="30px" height="30px"></a>
	  </td>
	 </tr>
	 
	 <tr height="50" style="border-top: 0.5px solid gray; border-bottom: 0.5px solid gray;">
	  <td></td>
	  <td></td>
	  <td colspan="3">
	   <div style="display:flex; justify-content: space-evenly;">
	    <div><a class="alink" href="../display/mall_platform.jsp?platform=pc">PC</a></div>|
	    <div><a class="alink"  href="../display/mall_platform.jsp?platform=nintendoswitch">Nintendo Switch</a></div>|
	    <div><a class="alink"  href="../display/mall_platform.jsp?platform=playstation">PlayStation</a></div>
	   </div>
	  </td>
	  <td>
	  </td>
	 </tr>
	 
	  
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">