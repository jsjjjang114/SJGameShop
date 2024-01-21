<%@page import="java.text.SimpleDateFormat"%>
<%@page import="game.GameBean"%>
<%@page import="game.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&family=Roboto+Mono:wght@700&display=swap');
	#gvtb{
		margin-top:20;
		border-collapse: collapse; 
		width:800;
		font-family: 'Noto Sans KR', sans-serif; 
	}
	.gvBtn{ 
		width:120;
		height: 40;
		margin:0 10px 0 0;
	}
	#gvBtn1{
		font-size: 15px;
		background-color: white;
		border-style: solid;
		border-width:0.5px;
		border-radius: 5px;
	}
	#gvBtn2{
		color:white;
		font-size: 15px;
		background-color: red;
		border-style: none;
		border-radius: 5px;
	}
	input[type=button]{
		cursor: pointer;
	}
	a{
		text-decoration: none;
		color:black;
	}
</style>
<script type="text/javascript">
	function addCart(userid,gnum){
		if(userid=='null'){
			var yn = confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?');
			if(yn){
				location.href="../login/login.jsp";
			} 
		} else{
			location.href="cartAdd.jsp?gnum="+gnum;			
		}
 							
	}
	
	function buyNow(userid,gnum){
		var flag = false;
		$.ajax({
			url : "ordercheck.jsp",
			async: false,
			data : ({
				userid : userid,
				gnum : gnum
			}),
			success : function(data){
				if($.trim(data)=="x"){
					alert("이미 구매한 상품입니다.");
					flag=true;
				} 
			}
		});
		
		if(flag){
			return;
		}
		
		if(userid=='null'){
			var yn = confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?');
			if(yn){
				location.href="../login/login.jsp";
			} 
		} else{
			location.href="orderform.jsp?gnum="+gnum;			
		}
 							
	}
</script>
<%@include file="mall_top2.jsp"%>
<%@include file="mall_left.jsp"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	int gnum = Integer.parseInt(request.getParameter("gnum"));
	GameDAO gdao = GameDAO.getInstance(); 
	GameBean gb = gdao.getByGnum(gnum); 

%>
	<form>
	 <table id="gvtb" border=0>
	  <tr>
	   <td rowspan="8" width="500" height="400"><img height="200" src="<%=request.getContextPath()%>/img/<%=gb.getGimage()%>"></td>
	  </tr>
	  <tr style="border-bottom: 1px solid gray;">
	   <td>타이틀명</td>
	   <td><%=gb.getGtitle() %></td>
	  </tr>
	  <tr>
	   <td>가격</td>
	   <td><%=gb.getGprice() %></td>
	  </tr>
	  <tr> 
	   <td>개발사</td>
	   <td><%=gb.getGdeveloper() %></td>
	  </tr>
	  <tr> 
	   <td>기종</td>
	   <td><%=gb.getPlatform() %></td>
	  </tr>
	  <tr> 
	   <td>출시일</td>
	   <td><%=sdf.format(gb.getGrel_date()) %></td>
	  </tr>
	  <tr> 
	   <td>장르</td>
	   <td><%=gb.getGgenre() %></td>
	  </tr>
	  <tr> 
	   <td>등급</td>
	   <td><img width="50" height="60" src="<%=request.getContextPath()%>/img/<%=gb.getGrating() %>"></td>
	  </tr>
	  <tr>
	   <td colspan="3" align="right" style="padding-right: 80; padding-bottom:30; ">
	    <input id="gvBtn1" class="gvBtn" type="button" value="장바구니 담기" onclick="addCart('<%=userid%>','<%=gb.getGnum()%>')">
	    <input id="gvBtn2" class="gvBtn" type="button" value="바로 구매하기" onclick="buyNow('<%=userid%>','<%=gb.getGnum()%>')">
	   </td>
	  </tr>
	  <tr>
	   <td colspan="3" style=" border-top: 1px solid black; padding-top:30">
	   	<h3>상품상세</h3>
	    <%=gb.getGcontent() %>
	   </td>
	  </tr>
	 </table>
	</form>
<%@include file="mall_bot.jsp"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&family=Roboto+Mono:wght@700&display=swap" rel="stylesheet">