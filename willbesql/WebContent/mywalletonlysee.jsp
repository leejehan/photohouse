<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이월렛</title>
<link rel="stylesheet" type="text/css" href="css/titleMenu.css">
<style>
	a:link{text-decoration:none;color:black;}
	a:visited{text-decoration:none;color:black;}
	a:hover{text-decoration:none;color:black;}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){

	
});
</script>
</head>
<body>
<!-- 타이틀메뉴 틀 시작 -->
<div id="titleBox">
	<table id="titleMenu1">
		<tr>
			<td id="clientID"><b>${name }</b>님의 </td>
			<td><a href="menu.jsp"><img src="imgs/logo.png" id="logoImg"/></a></td>
			<td id="blank"></td>
			<td><a href="listboard.sw">함께해요</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
			<td><a href="listboard.qt">문의사항</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
			<td><a href="WillBeServlet?command=mypage">마이페이지</a></td>
		</tr>
	</table>
	<div id="MenuBox">
		<table id="titleMenu2">
			<tr>
				<td id="menu1"><a href="WillBeServlet?command=diary">다이어리</a></td>
				<td id="menu2"><a href="WillBeServlet?command=schedule">스케줄</a></td>
				<td id="menu3"><a href="memo.mm">메모</a></td>
				<td id="menu4"><a href="WillBeServlet?command=mywallet">마이월렛</a></td>
				<td id="menu5"><a href="calculator.jsp">계산기</a></td>
			</tr>
		</table>
	</div>
</div>
<!-- 타이틀메뉴 틀 끝 -->



<%
	request.getAttribute("walletlist");

%>
<center>



<h2><a href="WillBeServlet?command=walletprev&year=${year}&month=${month-1}">◀</a>&nbsp;&nbsp;${year }년&nbsp;&nbsp;${month } 월&nbsp;&nbsp;
<a href="WillBeServlet?command=walletnext&year=${year}&month=${month+1}">▶</a>
</h2>
<fieldset style="border: 2px solid #f3bb4a; width: 700px; height: 300" >
<table>
<tr>
<td align=center width="200">
일자
</td>
<td align=center width="200">
내역
</td>
<td align=center width="200">
내용
</td>
<td align=center width="200">
금액
</td>
<td align=center width="200">
잔액	
</td>
</tr>
<tr>

<td colspan="4" align=center id="datedata">
	
</td>
</tr>

<c:forEach items="${walletlist}" var="walletlist">

<tr id="walldata">
<td><center>${walletlist.wallet_month}.${walletlist.wallet_day}</center></td>
<td><center>${walletlist.wallet_value}</center></td><td><center>${walletlist.wallet_content }</center></td>
<td><center><fmt:formatNumber value="${walletlist.wallet_inout}" pattern="#,###"/>원</center></td>
<td><center><fmt:formatNumber value="${walletlist.wallet_sum}" pattern="#,###"/>원</center></td>
</tr>
</c:forEach>
</table>
</fieldset>
</center>
</body>
</html>