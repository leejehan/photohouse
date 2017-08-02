<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
@font-face{font-family:HoonWhitecatR;
		   src:url("font/HoonWhitecatR.eot");
		   src:url("font/HoonWhitecatR.woff")}
body{font-family:HoonWhitecatR;}



   @font-face {
      font-family:Malgun;
      src: url("font/malgun.eot");
      src: url("font/malgun.woff");
   }
   A:link {text-decoration:none; color:#5D5D5D;}
   A:visited {text-decoration:none; color:#5D5D5D;} 
   A:hover {text-decoration:none; color:#191919;}
   #titleBox{
      width:1100px;
      height:180px;
      margin:0 auto;
      margin-top:20px;
   }
   #titleBox *{font-family:HoonWhitecatR;}
   #logoImg{
      width:115px;
      height:55px;
      position:relative;
      top:-10px;
   }
   #logoImg:hover{opacity:0.8;}
   #titleMenu1,#titleMenu2{

   }   
   #titleMenu1 *{font-size:18pt;}
   #titleMenu1 tr td,#titleMenu2 tr td{

   }
   #clientID{width:150px;text-align:right;}
   #clientID b{font-size:16pt;}
   #blank{width:450px;}
   #MenuBox{
      width:900px;
      margin:0 auto;
      margin-top:20px;
   }
   #titleMenu2 *{
      font-family:Malgun;
      font-style:italic;
      font-size:18pt;
      color:#fff;
      align:center;
   }
   #titleMenu2 tr td{
      width:180px;
      height:45px;
      text-align:center;
   }
   #menu1{background-color:#2ECC71;}
   #menu2{background-color:#F39C12;}
   #menu3{background-color:#E74C3C;}
   #menu4{background-color:#34495E;}
   #menu5{background-color:#3498DB;}
   #menu1:hover,#menu2:hover,#menu3:hover,#menu4:hover,#menu5:hover{
      background-color:#fff;
      box-shadow: 3px 3px 6px rgba(0, 0, 0, 0.4);
      color:#2ECC71;
   }
   #menu1:hover a{color:#2ECC71;}
   #menu2:hover a{color:#F39C12;}
   #menu3:hover a{color:#E74C3C;}
   #menu4:hover a{color:#34495E;}
   #menu5:hover a{color:#3498DB;}
   #titleMenu1 tr td:hover a{color:#AAA}
	
	
	
	

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
		border:3px solid black;
		cursor:pointer;
}
#button:hover{border:3px solid #aaa}
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
<script>
function updateId(){
	if(document.formm.member_id.value==""){
		alert("아이디를 입력하세요.");
		document.formm.member_id.focus();
		
	}else if(document.formm.member_pw.value==""){
		alert("비밀번호를 입력해주세요.");
		document.formm.member_pw.focus();
	}else if((document.formm.member_pw.value!=document.formm.member_pw_check.value)){
		alert("비밀번호가 일치하지 않습니다.");
		document.formm.member_pw.focus();
	}else if(document.formm.member_name.value==""){
		alert("이름을 입력해주세요");
		document.formm.member_name.focus();
	}else if(document.formm.member_gender.value==""){
		alert("성별을 체크해주세요.");
	}else if((document.formm.member_phone1.value||document.formm.member_phone2.value||document.formm.member_phone3.value)==""){
		alert("핸드폰 번호를 입력해주세요");
		document.formm.member_phone1.focus();
	}else if(document.formm.member_email1.value==""){
		alert("메일을 입력해주세요.");
		document.formm.member_email1.focus();
	}else{
		alert("정보를 수정했습니다!");
		document.formm.action="WillBeServlet?command=updateuser";
		document.formm.submit();
	}
}
</script>
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
	<div id="titletext">회원 정보 수정</div></center>
	<center><div id="joinBox">
		<form action="WillBeServlet?command=updateuser" method="post" id="formm" name="formm">
		<table id="join">
			<tr><td>
			<input type="text" size="79" name="member_id" id="member_id" class="input" value="${id}" readonly="readonly">
			<input type="hidden" name="reid"> </td></tr>
			<tr><td>
			<input type="password" size="79" name="member_pw" id="member_pw" class="input" placeholder="비밀번호" ></td></tr>
			<tr><td>
			<input type="password" size="79" name="member_pw_check" id="member_pw_check" class="input" placeholder="비밀번호 확인" ></td></tr>
			<tr><td>
			<input type="text" size="79" name="member_name" id="member_name" class="input" value="${name }" readonly="readonly" ></td></tr>
			<tr><td>
			<div id="radioBox"><input type="radio" size="80" name="member_gender" value="man">&nbsp;남&nbsp;
			<input type="radio" size="79" name="member_gender" value="woman">&nbsp;여&nbsp;</div></td></tr>
			<tr><td>
			<div id="phoneBox">			
			<input type="text" size="16" name="member_phone1" id="input" class="input"placeholder="연락처 ex)010">&nbsp;
			<input type="text" size="24" name="member_phone2" id="input" class="input" placeholder="1234">&nbsp;
			<input type="text" size="24" name="member_phone3" id="input" class="input" placeholder="1234"></div></td></tr>
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
			<input type="button" value="수 정" id="button" onclick="updateId()"></center></td></tr>
		</table>
		</form>
	</div>
	</center>
</body>

</body>
</html>