<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
</script>
<body>
<div id="wrap">
<div id="head">
	<center>찾기 결과</center>
</div>
<table width="500"><tr><td><hr size='1' noshade></td></tr></table>
	<table><tr>
	<td>아이디</td><td>${find.member_id}</td></tr>
	<tr>	
	<td>비밀번호</td><td>${find.member_pw}</td></tr>
	<tr><td colspan="2">
	<input type="button" value="확인" onclick="window. close()">
	</td></tr></table>

</div>
</body>
</html>