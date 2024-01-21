<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="game.GameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.mylist, h2{
		 overflow: hiddlen;
 		 white-space: nowrap;
 		 text-align: center;
	}
	.cateliul a{
		text-decoration: none;
		color:gray; 
	} 
	.cateli ul, .cateliul li{
	 margin:0px; padding:5px;
	 }
	#categ{
		text-align: left;
		width:180;
		border:1px solid;
	}
	ul, li{
		list-style: none;
	}
	ul ul{
		display:none;
	}
	ul li:focus > ul{
		display:block;
	}
	a{
		text-decoration: none;
		color:black;
	}
	.cvb{
		cursor: pointer;
	}
</style>
<%
	GameDAO gdao2 = GameDAO.getInstance();
	LinkedHashSet<String> dlist = gdao2.getAllDev();   
%>
<tr height="80%">
	  <td></td>
	  <td valign="top" align="right" style="padding-top:50; overflow: hiddlen;
 		 white-space: nowrap;">
	    <div id="categ">
	     <h3>카테고리</h3>
	      <div> 
	      
	       <ul class="cateul">
	       	<li class="cateli">
	       	 <span class="cvb">장르</span>
	       	 <ul class="cateliul">
	       	<%String[] ggenreArr = {"액션","rpg","어드벤처","음악","스포츠","레이싱","퍼즐","보드","기타"};
	       	  for(int i=0;i<ggenreArr.length;i++){ %>
	       	  <li><a href="<%=request.getContextPath() %>/display/mall_genre.jsp?ggenre=<%=ggenreArr[i]%>"><%=ggenreArr[i]%></a></li>
	       <% } %>
	       	 </ul>
	       	</li>
	       </ul>
	       
	       <ul class="cateul">
	        <li class="cateli">
	         <span class="cvb">개발사</span>
	         <ul class="cateliul">
	          <%
	           Iterator<String> iter = dlist.iterator();
	           while(iter.hasNext()){
	           	String dev = iter.next(); %>
	         	<li><a href="<%=request.getContextPath() %>/display/mall_dev.jsp?developer=<%=dev%>"><%=dev%></a></li>  
	         <%}%>
	         </ul>
	        </li>
	       </ul> 
	       
	      </div>
	      <h3><a href="../board/list.jsp">게임리뷰</a></h3>
		</div>
	  </td>
<td width="1000" colspan="3" valign="top" align="center" style=" overflow: hiddlen;
 		 white-space: nowrap;">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(".cvb").toggle(function(){
		$(this).next(".cateliul").css("display","block");
	},function(){
		$(this).next(".cateliul").css("display","none");
	});
</script>