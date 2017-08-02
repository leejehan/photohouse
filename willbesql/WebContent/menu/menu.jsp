<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	*{
		margin:0px;
		padding:0px;
	}
	A:link {text-decoration:none; color:#5D5D5D;}
	A:visited {text-decoration:none; color:#5D5D5D;} 
	A:hover {text-decoration:none; color:#191919;} 
	#header{
		position:relative;
		margin:0 auto;
		width:800px;
		height:170px;
		margin-top:30px;
	}
	#header div{		
		float:left;
		margin-top:20px;
	}		
	#boardBox{
		position:absolute;
		left:600px;
		top:-20px;
	}
	#box{
		margin:0 auto;
		width:800px;
		height:600px;
	}
	#menuBox{
		position:relative;
		margin:0 auto;
		width:800px;
		height:600px;
	}
	#menuBox div{position:absolute;}
	#menu1{		
		background-color:#FFC19E;
		width:200px;
		height:200px;
		line-height:200px;
		border-radius:50%;
		text-align:center;
		font-size:15pt;
		left:50px;
		top:80px;
	}	
	#menu2{		
		background-color:#CEF279;
		width:220px;
		height:220px;
		line-height:220px;
		border-radius:50%;
		text-align:center;
		font-size:15pt;
		left:250px;
		top:180px;
	}
	#menu3{		
		background-color:#FFB2D9;
		width:180px;
		height:180px;
		line-height:180px;
		border-radius:50%;
		text-align:center;
		font-size:15pt;
		left:550px;
		top:140px;
	}
	#menu4{		
		background-color:#B2EBF4;
		width:170px;
		height:170px;
		line-height:170px;
		border-radius:50%;
		text-align:center;
		font-size:15pt;
		left:450px;
		top:400px;
	}
	#menu5{		
		background-color:#EAEAEA;
		width:200px;
		height:200px;
		line-height:200px;
		border-radius:50%;
		text-align:center;
		font-size:15pt;
		left:50px;
		top:380px;
	}
</style>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	setInterval(function(){
		$("#menu1").animate({'top':20},900,'swing');
		$("#menu1").animate({'top':50},900,'swing');
		
		$("#menu2").animate({'top':220},800);
		$("#menu2").animate({'top':200},800);	
		
		$("#menu3").animate({'left':550},1000,'swing');
		$("#menu3").animate({'left':570},1000,'swing');
		
		$("#menu4").animate({'top':400},900,'swing');
		$("#menu4").animate({'top':430},900,'swing');
		
		$("#menu5").animate({'width':220, 'height':220},1100,'swing');
		$("#menu5").animate({'width':200, 'height':200},1100,'swing');		
	},1000);	
});


</script>
<body>
<div id="header">
	<div id="customer">
	${member.member_id }님 환영합니다.</div>
	<div id="boardBox">
	<div id="board"><a href="listboard.sw?id='test'">함께 해요</a></div>
	<%-- <div id="board"><a href="listboard.sw?id=${member.member_id } ">함께 해요</a></div> --%>
	<div>&nbsp;&nbsp;|&nbsp;&nbsp;</div>
	<div><a href="question.sw">문의 사항</a></div>
	</div>
</div>
<div id="box">
	<div id="menuBox">
		<div id="menu1"><a href="diary.sw">다이어리</a></div>
		<div id="menu2"><a href="schedule.sw">스케줄</a></div>
		<div id="menu3"><a href="memo.sw">메모</a></div>
		<div id="menu4"><a href="calculator.sw">계산기</a></div>
		<div id="menu5"><a href="myWaller.sw">마이월렛</a></div>
	</div>
</div>
</body>
</html>