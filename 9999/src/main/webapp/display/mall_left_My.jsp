<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#mylistfirst{
	}
	.mylist, h2{
		 overflow: hiddlen;
 		 white-space: nowrap;
 		 text-align: center;
	}
	.mylist{
		border:1px solid gray;
	}
	.mylist a:hover{
		color : red;
	}
	.zxcv{
		font-size: 20;
s	}
	.mylist a{
		text-decoration: none;
		color:gray;
	}
</style>
<tr height="80%">
	  <td></td>
	  <td valign="top" align="right" style="padding-top:50">
	   <table border=0 style="width:150; border-collapse: collapse;">
	  	<tr><td id="mylistfirst" style="text-align: left"><h2 style="text-align: left;">마이페이지 </h2></td></tr>
	  	<tr><td class="mylist"><a href="../display/update_user.jsp"><font class="zxcv">정보수정 &nbsp&nbsp&nbsp ></font></a></td></tr>
	  	<tr><td class="mylist"><a href="../display/myPage.jsp"><font class="zxcv">주문내역 &nbsp&nbsp&nbsp ></font></a></td></tr> 
	  	<tr><td class="mylist"><a href="../board/myReview.jsp"><font class="zxcv">나의리뷰 &nbsp&nbsp&nbsp ></font></a></td></tr>
	  	<tr><td class="mylist"><a href="../display/insert_game.jsp"><font class="zxcv">상품등록 &nbsp&nbsp&nbsp ></font></a></td></tr>
	   </table>
	  </td>
<td colspan="3" valign="top" align="center">