<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<link rel="stylesheet" type="text/css" href="css/titleMenu.css">
<style>
@font-face{font-family:HoonWhitecatR;
		   src:url("font/HoonWhitecatR.eot");
		   src:url("font/HoonWhitecatR.woff")}
@font-face{font-family:malgun;
		   src:url("font/malgun.eot");
		   src:url("font/malgun.woff")}
body{font-family:HoonWhitecatR;}


a:link{text-decoration:none;color:#000;}
a:visited{text-decoration:none;color:#000;}
a:hover{text-decoration:none;color:#aaa;}

#deletemember,#updatemember{font-size:30pt;margin-top:100px;}
#aa img:hover{opacity:0.6;}


</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
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
<center>
<div id="menu">
	<div id="deletemember">
		<a href="WillBeServlet?command=deleteconfirm" id="aa"><img src="images/deleteOk.png"></a>
		<a href="WillBeServlet?command=deleteconfirm">회원탈퇴</a>
	</div>
	<div id="updatemember">
		<a href="WillBeServlet?command=updatemember" id="aa"><img src="images/modify.png"></a>
		<a href="WillBeServlet?command=updatemember">정보수정</a>
	</div>
</div>

</center>
</body>
</html>