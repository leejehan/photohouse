<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style>
@font-face{font-family:HoonWhitecatR;
		   src:url("font/HoonWhitecatR.eot");
		   src:url("font/HoonWhitecatR.woff")}
body{background-color:#ddddff;}
table{height:500px;}
tr{height:60px;}
#joinbox{margin:0 auto;}
.input{
		height: auto;
		line-height: normal;
		padding: .8em .5em;
		border:0px;
		margin-top:7px;
		background-color:#FFFFFF;
		outline:1px solid #BDBDBD;
}
#buttonBox{
		margin-top:20px;
		text-align:center;
}
#button{		
		height:50px;
		width:200px;
		font-size:14pt;
		font-weight:bold;
		color:black;
		background-color:#FFFFFF;
		border:3px solid #ccbbdd;
		cursor:pointer;
}
#idcheck{height:40px;width:100px;font-size:12pt;font-weight:bold;color:black;
background-color:#fff; border:3px solid #ccbbdd;margin-left:10px;}
#email2{
    width: 100px;
    border: 1px solid #BDBDBD;
    box-shadow: none;
    appearance: none;
    -moz-appearance: none;
    -webkit-appearance: none;
    font-size: 1.0em;
    background-color: #fff;
    background-position: center right;
    background-repeat: no-repeat;
    background-size: 15px 10px;
}

#titletext{font-family:HoonWhitecatR;font-size:50px;text-weight:bold;}
#button:hover{color:#aaa;}
#idcheck:hover{color:#aaa;}

</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/joinjs.js"></script>

</head>
<body>
<%
 request.setCharacterEncoding("utf-8");
%>
<center><a href="login.jsp"><div id="titleBox"><img src="images/logo.png" width="200" height="100"></div></a>
	<div id="titletext">회 원 가 입</div></center>
	<center><div id="joinBox">
		<form action="WillBeServlet?command=insertmember" method="post" id="formm" name="formm">
		<table id="join">
			<tr><td>
			<input type="text" size="61" name="member_id" id="member_id" class="input" placeholder="아이디" ><input type="button" id="idcheck" value="중복확인" onClick="checkId()">
			<input type="hidden" name="reid"> </td></tr>
			<tr><td>
			<input type="password" size="80" name="member_pw" id="member_pw" class="input" placeholder="비밀번호" ></td></tr>
			<tr><td>
			<input type="password" size="80" name="member_pw_check" id="member_pw_check" class="input" placeholder="비밀번호 확인" ></td></tr>
			<tr><td>
			<input type="text" size="79" name="member_name" id="member_name" class="input" placeholder="이름" ></td></tr>
			<tr><td>
			<div id="radioBox"><input type="radio" size="80" name="member_gender" value="man">&nbsp;남&nbsp;
			<input type="radio" size="80" name="member_gender" value="woman">&nbsp;여&nbsp;</div></td></tr>
			<tr><td>
			<div id="phoneBox">			
			<input type="text" size="16" name="member_phone1" id="input" class="input"placeholder="연락처 ex)010">&nbsp;
			<input type="text" size="23" name="member_phone2" id="input" class="input" placeholder="1234">&nbsp;
			<input type="text" size="23" name="member_phone3" id="input" class="input" placeholder="1234"></div></td></tr>
			<tr><td><div id="textField">
			<input type="text" size="20" name="member_email1" id="input1" class="input" placeholder="이메일 아이디">&nbsp;@&nbsp;
			<input type="text" size="30" name="member_email2" id="input2" class="input" placeholder="직접 입력">
			<select id="email2" >
				<option value="" id="mail0">선택</option>
				<option value="" id="mail1">직접입력</option>
				<option value="naver.com" id="mail2">네이버</option>
				<option value="hanmail.net" id="mail3">다음</option>
				<option value="nate.com" id="mail4">네이트</option>
				<option value="gmail.com" id="mail5">구글</option>
			</select>
		
			</div></td></tr>
			<tr><td><div id="empty"></div></td></tr>
			<tr><td id="buttonBox"><center>
			<input type="button" value="가 입" id="button" onclick="joinId()"></center></td></tr>
		</table>
		</form>
	</div>
	</center>

<script>
$(document).ready(function(){
	$('#email2').change(function() {
	       var i=$('#email2 option:selected').val();
	       if(i==""){
	    	   $("#input2").focus();
	       }
	       
	       $("#input2").val(i);
	   });

}); 
</script>
</body>
</html>