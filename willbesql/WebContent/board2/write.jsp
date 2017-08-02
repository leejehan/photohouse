<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>문의 사항</title>
<link rel="stylesheet" type="text/css" href="css/boardtitleMenu.css">
<style>
	*{margin:0px; padding:0px;font-family:Malgun;}
	#clear{clear:both;}
	A:link {text-decoration:none; color:#5D5D5D;}
	A:visited {text-decoration:none; color:#5D5D5D;} 
	A:hover {text-decoration:none; color:#191919;}
	@font-face{
		font-family:Hoon;
		src:url("font/HoonWhitecatR.eot");
		src:url("font/HoonWhitecatR.woff");
	}
	@font-face {
		font-family:DXPnM;
		src: url("font/DXPnM-KSCpc-EUC-H.eot");
		src: url("font/DXPnM-KSCpc-EUC-H.woff");
	}
	@font-face {
		font-family:Malgun;
		src: url("font/malgun.eot");
		src: url("font/malgun.woff");
}
	#boardHeader{
		width:900px;
		height:50px;
		margin:0 auto;
		margin-top:20px;		
	}
	#boardHeader_title{
		width:108px;
		font-size:20pt;
		font-family:Hoon;
		margin:0 auto;		
	}
	#boardBody{
		width:900px;
		min-height:750px;	
		margin:0 auto;
		margin-top:20px;
		border:3px Dashed #C6FFFF;		
		border-radius:100px;
	}
	#boardBody #boardBody_form{
		width:700px;
		margin:0 auto;
		padding-top:20px;

	}
	#boardBody #boardBody_form #formTable{
		border:0px solid black;
	}
	#boardBody_form table{margin-top:40px;}
	#boardBody_form table tr td{
		height:30px;
	}
	#textTr{height:430px;}
	.titleName{
		font-size:15pt;
		font-family: Hoon; 
		width:70px; 
		border:1px;
	}
	.inputType{
		border: 1px solid transparent;
		box-sizing: border-box;
		-moz-box-sizing: border-box;
		height: 25px;
		outline: none;
		width:300px;
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.4);
	}
	#writerId{width:180px;}
	#textBoxTr{
		height:10px;
	}
	#textBox{
		resize:none;
		width:700px;
		min-height:400px;
		background-image: url(imgs/textline.gif);
	}
	#regitButton{
		float:right;
		background-color: #489CFF;
		color:#fff;        
		font-size: 15pt;
		font-family: Hoon;    
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);    
		border-radius: initial;
		width: 120px;
		height: 30px;
		position:relative;
		border:0px;
		cursor:pointer;   	
	}
	.inputType:focus, .inputType:hover{
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);	
	}
	#regitButton:focus, #regitButton:hover{
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);	
	}
			
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
</div>
<!-- 타이틀메뉴 틀 끝 -->

<div id="boardHeader">
	<div id="boardHeader_title">문의 사항</div>
</div>
<div id="boardBody">
	<div id="boardBody_form">
		<form name="write" action="write_input.qt" method="post"
		enctype="multipart/form-data" onsubmit="return Check()">
			<table id="formTable">
				<tr><td class="titleName">작성자</td>
				<td><input type="text" id="writerId" class="inputType" name="id" value="${write_id.member_id }" readonly="readonly"/>
				</td></tr>

				<tr><td class="titleName">파일첨부</td>
				<td><input type="file" id="file" name="userFile" ></td>
				</tr>

				<tr><td class="titleName">제목</td>
				<td><input type="text" class="inputType" class="inputType" maxlength="25" name="title">
				</td></tr>

				<tr><td colspan="2" class="titleName">글 쓰기</td></tr>
				<tr id="textTr"><td colspan="2"><textarea id="textBox" class="inputType" wrap="virtual" name="contents"></textarea>
				</td></tr>

				<tr><td colspan="2" ><br><input type="submit" id="regitButton" value="등록"></td></tr>
			</table>			
		</form>		
	</div>
</div>

<script>
function Check(){	
	if (write.title.value.length < 1) {
		alert("글 제목을 입력하세요.");
		write.title.focus(); 
		return false;
	}
	if (write.contents.value.length < 1) {
		alert("글 내용을 입력하세요.");
		write.content.focus(); 
		return false;
	}
}
</script>		
</body>
</html>