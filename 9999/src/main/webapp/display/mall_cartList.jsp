<%@page import="java.text.DecimalFormat"%>
<%@page import="game.GameBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#seldel{
		text-decoration: none;
		color:gray;
		border-collapse: collapse;
		border 
	}
	#gimage{
		width: 110;
	}
	#orderBtn{
		width: 100;
		height: 25;
		color:white;
		background-color: red;
		border-style:none;
		border-radius: 3px;
		cursor: pointer;
	}
</style>
<%
	DecimalFormat df = new DecimalFormat("###,###");
%>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	$(function(){
		$("#chk_all").click(function() {
			if($("#chk_all").is(":checked")) {
				$("input[name=chk]").prop("checked", true);
			} else {
				$("input[name=chk]").prop("checked", false);
			}
		});
		
		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
			
			if(total != checked) { 
				$("#chk_all").prop("checked", false);
			} else { 
				$("#chk_all").prop("checked", true); 
			}
		});
		
		$("input[type='checkbox']").click(function(){
			var sumPrice = 0;
			/* for(var i=0; i<$("input:checkbox[name='chk']").length; i++){
				alert($("input:checkbox[name='chk']")[i].val());
			}  */
			$("input:checkbox[name='chk']").each(function(){
				if($(this).is(":checked")==true){
					sumPrice += parseInt($(this).closest('tr').find('[name="price"]').val());
				}
			});
			$("#selectedTotal").val(sumPrice);
		});
		
	});
	
	function deletegame(){
		var form = document.getElementById("cartForm");
		if(document.getElementsByName("chk").length==0){
			alert("장바구니가 비어 있습니다.");
			return
		}
		var flag=false;
		for(var i=0;i<document.getElementsByName("chk").length;i++){
			if(document.getElementsByName("chk")[i].checked==true ){
				flag=true;
			}
		}
		if(!flag){
			alert("삭제할 상품을 선택해주세요.")
			return;
		}
		form.action = "cartDelete.jsp";
		form.submit();
	}
	
	
	function order(){
		var form = document.getElementById("cartForm");
		if(document.getElementsByName("chk").length==0){
			alert("장바구니가 비어 있습니다.");
			return false;
		}
		var flag=false;
		for(var i=0;i<document.getElementsByName("chk").length;i++){
			if(document.getElementsByName("chk")[i].checked==true ){
				flag=true;
			}
		}
		if(!flag){
			alert("주문하실 상품을 선택해주세요.")
			return false;
		}
	}
	
</script>
<jsp:useBean id="gameCart" class="game.CartBean" scope="session"/>
<%	
	ArrayList<GameBean> clist = gameCart.getAllCart();
%>
<%@include file="mall_top2.jsp"%>
<%@include file="mall_left.jsp"%>
<div style="margin-top:15">
 <h2>장바구니</h2>
</div>
	<form id="cartForm" method="post" action="orderform.jsp">
	<table style="width: 800; margin-top:10; border-collapse: collapse;">
		<tr>
		 <td colspan="5" style="padding-bottom:14; border-bottom: 2px solid black; ">
		  <input type="checkbox" id="chk_all">
		  <span style="font-size: 24; margin-left: 5; margin-right: 5">전체선택</span>
		  <span style="font-size: 14; opacity: 0.7"><a id="seldel" href="javascript:deletegame()">선택삭제</a></span>
		 </td>
		</tr>
<%		 if(clist.size()==0){ %>
			<tr>
			 <td colspan="5" align="center" style="padding-top: 50; padding-bottom: 50">
			  <span>장바구니가 비어있습니다.</span>
			 </td>
			</tr>
	   <%} else {%>
		<tr style="width: 100">
		 <td></td>
		 <td colspan="2">상품</td>
		 <td>등급</td>
		 <td>가격</td>
		</tr>
		<%
		   	int sumPrice=0;
		   	for(int i=0;i<clist.size();i++){
		   		GameBean gb = clist.get(i);		
				sumPrice=gb.getGprice();
				%>
			<tr>
			 <td align="left">
		      <input type="checkbox" name="chk" value="<%=gb.getGnum()%>">
		     </td>
			 <td width="150">
			  <img id="gimage" src="<%=request.getContextPath()%>/img/<%=gb.getGimage()%>">			 
			 </td>
			 <td valign="top">
			  <span><%=gb.getGtitle()%></span>			 
			 </td>
			 <td>
			  <img width="40" src="<%=request.getContextPath()%>/img/<%=gb.getGrating()%>">			 
			 </td>
			 <td>
			  <span>￦<%=df.format(gb.getGprice()) %></span>		 
			  <input name="price" type="hidden" value="<%=gb.getGprice() %>">
			 </td>
			</tr>
		   <%} 
	 	 } %>
	 	 <tr style="border-top: 2px solid black;">
	 	  <td colspan=3 width="300"></td>
	 	  <td>
	 	  총액:
	 	  <input id="selectedTotal" readonly="readonly" style="border: 0" value=0>
	 	  원
	 	  </td>
	 	  <td><input id="orderBtn" type="submit" value="주문하기" onclick="return order()"></td>
	 	 </tr>
	</table>
	</form>
<%@include file="mall_bot.jsp"%>
