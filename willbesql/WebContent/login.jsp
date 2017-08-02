<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>willbe에 오신걸 환영합니다!</title>
<style>
@font-face{font-family:HoonWhitecatR;
		   src:url("font/HoonWhitecatR.eot");
		   src:url("font/HoonWhitecatR.woff")}
#bodyback{background-color:#cccccc;}
#wrap{width:500px;height:500px;position:absolute;top:0;right:0;bottom:0;left:0;margin:auto;}
#mainname,#submain{text-align:center;}
#subname{position:absolute;top:-50px;left:-50px;}
#joinform{float:right;}
a{text-decoration:none;}
#subt{font-family:HoonWhitecatR;font-size:30px;}
#joinclick,#findclick{font-family:HoonWhitecatR;font-size:25px;}
#joinclick:hover,#findclick:hover{
	color:#AAA;
}
#findclick{cursor:pointer;}
.input{	
		width:300px;			
		height: auto; /* 높이 초기화 */
		line-height: normal; /* line-height 초기화 */
		padding: .8em .5em; /* 여백 설정 */ 
		border:1.5px solid #BDBDBD;
		margin-top:7px;
		background-color:#FFFFFF;
		outline:none;		
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
		border:3px solid #ddbbcc;
		cursor:pointer;
}
#blank{height:15px;}
a:link{text-decoration:none;color:black;}
a:visited{text-decoration:none;color:black;}
a:hover{text-decoration:underline;color:black;}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
function findid(){
	var url = "WillBeServlet?command=find";
	window.open( url, "_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=300,top=300, left=300");
}
</script>
<script>
$(document).ready(function(){
	var rand=Math.random()*10;
	rand=parseInt(rand+1);
	
	
	switch(rand){
	case 1:
		$("#bodyback").css("background-color","#ffdddd");
		$("#button").css("border","3px solid #ddbbcc");
		break;
	case 2:
		$("#bodyback").css("background-color","#ffdddd");
		$("#button").css("border","3px solid #ddbbcc");
		break;
	case 3:
		$("#bodyback").css("background-color","#ffe5dd");
		$("#button").css("border","3px solid #eed4cc");
		break;
	case 4:
		$("#bodyback").css("background-color","#ffe5dd");
		$("#button").css("border","3px solid #eed4cc");
		break;
	case 5:
		$("#bodyback").css("background-color","#ddeecc");
		$("#button").css("border","3px solid #bbddbb");
		break;
	case 6:
		$("#bodyback").css("background-color","#ddeecc");
		$("#button").css("border","3px solid #bbddbb");
		break;
	case 7:
		$("#bodyback").css("background-color","#cceee5");
		$("#button").css("border","3px solid #bbccdd");
		break;
	case 8:
		$("#bodyback").css("background-color","#cceee5");
		$("#button").css("border","3px solid #bbccdd");
		break;
	case 9:
		$("#bodyback").css("background-color","#ddddff");
		$("#button").css("border","3px solid #ccbbdd");
		break;
	case 10:
		$("#bodyback").css("background-color","#ddddff");
		$("#button").css("border","3px solid #ccbbdd");		
		break;
	}
})
</script>
</head>
<body id="bodyback">
<div id="wrap">
	<div id="mainname"><img src="images/logo.png"></div>
	<div id="subname"><p id="subt">당신의 계획을 도와줄수있는...</p></div>
	<div id="loginform">
		<form action="WillBeServlet?command=login" method="post">
		<table align="center">
		<tr>
			<td><center><input type="text" size="40" name="id" class="input" placeholder="아이디" ></center></td>
		</tr>
		<tr>		
			<td><center><input type="password" size="40" name="pw" class="input" placeholder="비밀번호" ></center></td>
		</tr>
		<tr><td id="blank"></td></tr>
		<tr>
			<td colspan="2" align="center" id="buttonBox"><center><input type="submit" value="LOGIN" id="button"></center></td>
		</tr>
		</table>
		</form>
	</div>
	<div id="joinform"><br><br><a href="WillBeServlet?command=join" id="joinclick">회원가입을 하고싶다면 클릭!</a>
		<br><a onclick="findid()" id="findclick">아이디/비밀번호를 잊어버리셧다면?클릭!</a>		
	</div>
</div>
</body>
</html>