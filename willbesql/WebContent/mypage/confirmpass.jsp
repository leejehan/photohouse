<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/titleMenu.css">
<style>
@font-face{font-family:HoonWhitecatR;
		   src:url("font/HoonWhitecatR.eot");
		   src:url("font/HoonWhitecatR.woff")}
@font-face{font-family:malgun;
		   src:url("font/malgun.eot");
		   src:url("font/malgun.woff")}
body{font-family:HoonWhitecatR;}

#subut{width:70px;height:30px;background-color:#fff;cursor:pointer;border:2px solid black;}
a:link{text-decoration:none;color:black;}
a:visited{text-decoration:none;color:black;}
a:hover{text-decoration:none;color:#aaa;}
</style>
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
<center>
<h2>비밀번호 확인</h2>
<form method="post" action="WillBeServlet?command=deletemember">
	<table>
		<tr>
		<td>
		비밀번호
		</td>
		<td>
		<input type="password" name="pass" id="pass" size="20">
		</td>
		</tr>
		<tr>
			<td colspan="2"><center><input type="submit" value="회원 탈퇴" id="subut"></center></td>
		</tr>	
	</table>
</form>
</center>
</body>
</html>