<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환영합니다!!</title>
<style>
	*{
		margin:0px;
		padding:0px;
		font-family:Malgun;
	}
	body{
		background-color:#EFEFEF;
	}
	A:link {text-decoration:none; color:#F6F6F6;}
	A:visited {text-decoration:none; color:#F6F6F6;} 
	A:hover {text-decoration:none; color:#FFFFFF;} 
	@font-face {
		font-family:Malgun;
		src: url("font/malgun.eot");
		src: url("font/malgun.woff");
	}
	@font-face {
		font-family:Hoon;
		src: url("font/HoonWhitecatR.eot");
		src: url("font/HoonWhitecatR.woff");
	}	
	#header{
		position:relative;
		margin:0 auto;
		width:800px;
		height:170px;
		margin-top:30px;
	}
	#logo{
		width:800px;
		height:80px;
	}
	#logo img{
		width:290px;
		height:130px;
	}
	#customer b{
		font-family:Hoon;
	}
	#customer{
		font-family:Hoon;
		font-size:20pt;
	}
	#menu6,#menu7,#menu8{		
		font-family:Hoon;
		font-size:18pt;
	}
	#boardBox{
		width:245px;
		height:25px;
		float:right;
		margin-top:-20px;		
	}
	#boardBox div{float:left;}
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
		background-color:#2ECC71;
		width:200px;
		height:200px;
		line-height:200px;
		border-radius:50%;
		text-align:center;
		font-size:18pt;
		left:50px;
		top:80px;
	}	
	#menu2{		
		background-color:#F39C12;
		width:220px;
		height:220px;
		line-height:220px;
		border-radius:50%;
		text-align:center;
		font-size:18pt;
		left:280px;
		top:100px;
	}
	#menu3{		
		background-color:#E74C3C;
		width:180px;
		height:180px;
		line-height:180px;
		border-radius:50%;
		text-align:center;
		font-size:18pt;
		left:550px;
		top:140px;
	}
	#menu4{		
		background-color:#3498DB;
		width:170px;
		height:170px;
		line-height:170px;
		border-radius:50%;
		text-align:center;
		font-size:18pt;
		left:450px;
		top:400px;
	}
	#menu5{		
		background-color:#34495E;
		width:200px;
		height:200px;
		line-height:200px;
		border-radius:50%;
		text-align:center;
		font-size:18pt;
		left:50px;
		top:380px;
	}
	#menu6:link {text-decoration:none; color:#4C4C4C;}
	#menu6:visited {text-decoration:none; color:#4C4C4C;} 
	#menu6:hover {text-decoration:none; color:#AAA;}
	#menu7:link {text-decoration:none; color:#4C4C4C;}
	#menu7:visited {text-decoration:none; color:#4C4C4C;} 
	#menu7:hover {text-decoration:none; color:#AAA;}
	#menu8:link {text-decoration:none; color:#4C4C4C;}
	#menu8:visited {text-decoration:none; color:#4C4C4C;} 
	#menu8:hover {text-decoration:none; color:#AAA;}
	.ballDeco{
		box-shadow: 3px 3px 6px rgba(0, 0, 0, 0.3);
	}
	.ballDeco:hover{
		box-shadow: 3px 3px 6px rgba(0, 0, 0, 0.6);

	}
	#menu1,#menu2,#menu3,#menu4,#menu5{
		font-style:italic;
	}
	#menu1:hover,#menu2:hover,#menu3:hover,#menu4:hover,#menu5:hover{
		font-size:19pt;
		font-style:italic;	
		background-color:#fff;
	}
	#menu1:hover{color:#2ECC71;}
	#menu2:hover{color:#F39C12;}
	#menu3:hover{color:#E74C3C;}
	#menu4:hover{color:#3498DB;}
	#menu5:hover{color:#34495E;}
</style>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	setInterval(function(){
		$("#menu1").animate({'top':20},900,'swing');
		$("#menu1").animate({'top':50},900,'swing');
		
		$("#menu2").animate({'top':130},800);
		$("#menu2").animate({'top':90},800);	
		
		$("#menu3").animate({'left':550},1000,'swing');
		$("#menu3").animate({'left':570},1000,'swing');
		
		$("#menu4").animate({'top':400},900,'swing');
		$("#menu4").animate({'top':430},900,'swing');
		
		$("#menu5").animate({'width':220, 'height':220},1100,'swing');
		$("#menu5").animate({'width':200, 'height':200},1100,'swing');		
	},10);	
});


</script>
<body>
<div id="header">
	<div id="logo"><center><img src="imgs/logo.png"></center></div>
	<div id="customer"><b>${name }</b>님 환영합니다.</div>	
	<div id="boardBox">
	<div id="board"><a href="listboard.sw" id="menu6">함께 해요</a></div>	
	<div>&nbsp;|&nbsp;</div>
	<div><a href="listboard.qt" id="menu7">문의 사항</a></div>
	<div>&nbsp;|&nbsp;</div>
	<div><a href="WillBeServlet?command=mypage" id="menu8">마이페이지</a></div>
	</div>
</div>
<div id="box">
	<div id="menuBox">
		<a href="WillBeServlet?command=diary"><div id="menu1" class="ballDeco">다이어리</div></a>
		<a href="WillBeServlet?command=schedule"><div id="menu2" class="ballDeco">스케줄</div></a>
		<a href="memo.mm"><div id="menu3" class="ballDeco">메모</div></a>
		<a href="calculator.jsp"><div id="menu4" class="ballDeco">계산기</div></a>
		<a href="WillBeServlet?command=mywallet"><div id="menu5" class="ballDeco">마이월렛</div></a>	
	</div>
</div>
</body>
</html>