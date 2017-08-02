<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@font-face{font-family:HoonWhitecatR;
		   src:url("font/HoonWhitecatR.eot");
		   src:url("font/HoonWhitecatR.woff")}

#head{font-family:HoonWhitecatR;font-size:30pt;}
#button{		
		height:50px;
		width:100px;
		font-size:14pt;
		font-weight:bold;
		color:black;
		background-color:#FFFFFF;
		border:3px solid black;
		cursor:pointer;
		color:black;
}
.input{
		height: auto;
		line-height: normal;
		padding: .8em .5em;
		border:0px;
		margin-top:7px;
		background-color:#FFFFFF;
		outline:1px solid #BDBDBD;
}
#button:hover{color:#aaa;border:3px solid #aaa;}

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
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
function findid(){
	if(document.formm.find_name.value==""){
		alert("이름을 입력해주세요");
		document.formm.find_name.focus();
		return false;
	}else if(document.formm.find_email1.value==""){
		alert("메일을 입력해주세요.");
		document.formm.find_email1.focus();
		return false;
	}
}
</script>
<script>
$(document).ready(function(){
	$(document).ready(function(){
		$('#email2').change(function() {
		       var i=$('#email2 option:selected').val();
		       if(i==""){
		    	   $("#input2").focus();
		       }
		       
		       $("#input2").val(i);
		   });

	}); 
}); 
</script>
</head>
<body>
<center>
<div id="wrap">
<div id="head">
	<center>아이디 / 비밀번호 찾기!</center>
</div>
<table width="500"><tr><td><hr size='1' noshade></td></tr></table>
<form action="WillBeServlet?command=find_input" method="post" name="formm">
	<table><tr>
	<td><input type="text" name="find_name" size="50" class="input" placeholder="이름"></td></tr>
	<tr>	
	<td><input type="text" name="find_email1" size="13" id="input1" class="input" placeholder="이메일 아이디">
		&nbsp;@&nbsp;&nbsp;<input type="text" name="find_email2" size="13" id="input2" class="input" placeholder="직접입력">
	<select id="email2" >
				<option value="" id="mail0">선택하세요</option>
				<option value="" id="mail1">직접입력</option>
				<option value="naver.com" id="mail2">네이버</option>
				<option value="hanmail.net" id="mail3">다음</option>
				<option value="nate.com" id="mail4">네이트</option>
				<option value="gmail.com" id="mail5">구글</option>
	</select></td></tr>
	<tr height="40">
		<td></td>
	</tr>
	<tr>
		<td colspan="2"><center><input type="submit" value="찾기" id="button" onclick="return findid()">&nbsp;<input type="button" value="닫기" id="button" onclick="window.close()"></center></td>
	</tr>
	</table>
</form>

</div>
</center>
</body>
</html>