<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메모</title>
<link rel="stylesheet" type="text/css" href="css/titleMenu.css">
<style>
	*{margin:0px; padding:0px;font-family:DXPnM;}
	#clear{clear:both;}
	a:link{text-decoration:none;color:#000;}
	a:visited{text-decoration:none;color:#000;}
	a:hover{text-decoration:none;color:#aaa;}
	#memoBox{
		width:900px;
		margin:0 auto;
		margin-top:20px;		
	}
	#welcome{
		float:left;
		width:250px;			
	}
	#regitButton{
		float:right;
		width:50px;
		height:50px;
		cursor:pointer;			
	}
	#plusButton{
		width:48px;
		height:48px;}
	#memoBody{
		width:900px;
		height:900px;
		overflow:auto;						
	}
	#inputBox{
		float:left;
		width:270px;
		height:270px;
	}
	#memoArea1{
		width:260px;
		height:260px;
		background-image: url(imgs/textLinePink.png);
	}
	#memoArea2{
		width:260px;
		height:260px;
		background-image: url(imgs/textLineYellow.png);
	}
	.buttonStyle1{
		background-color:transparent;
		border:0px;
		position:relative;
		left:170px;
		top:-45px;
	}
	.buttonStyle1 img{
		width:40px;
		height:40px;
	}
	.buttonStyle2{
		background-color:transparent;
		border:0px;
		position:relative;
		left:170px;
		top:-45px;		
	}
	#deleteButton img{
		width:40px;
		height:40px;
	}
	
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	//$("#memoBody").append("<div id='inputBox'><form action='' method='post'><textarea name='memo' id='memoArea1'/>"
	var count=0;
	$("#regitButton").click(function(e){
		count++;
		if(count%2==0){
			$("#memoBody").append("<div id='inputBox'><form action='memoRegit.mm' method='post'><textarea name='memo' id='memoArea1'/>"
			+"<button type='submit' class='buttonStyle1' id='inputButton'><img src='imgs/pencil.png'></button>"
			+ "<a href='#' class='buttonStyle2' id='deleteButton'><img src='imgs/delete.png'></a></form></div>");
		}else{
			$("#memoBody").append("<div id='inputBox'><form action='memoRegit.mm' method='post'><textarea name='memo' id='memoArea2'/>"
			+"<button type='submit' class='buttonStyle1' id='inputButton'><img src='imgs/pencil.png'></button>"
			+ "<a href='#' class='buttonStyle2' id='deleteButton'><img src='imgs/delete.png'></a></form></div>");
		}
	});

});

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
<div id="memoBox">
	<div id="memoHead">		
		<div id="regitButton"><img src="imgs/plus.png" id="plusButton"></div>		
	</div>
	<div id="clear"></div>		
	<div id="memoBody">	
		<c:forEach items="${memoList}" var="i" begin="0" end="${cnt}">
			<c:choose>
			 <c:when test="${i.memo_color eq 'p' }">			
				<div id='inputBox'><form action='memoModify.mm' method='post'><textarea name='memo' id='memoArea1'>${i.memo_contents} </textarea>
				<input type="hidden" name="memoNum" value="${i.memo_num }">
				<button type='submit' class='buttonStyle1' id='inputButton'><img src='imgs/pencil.png'></button>
				<a href='memoDelete.mm?memoNum=${i.memo_num} ' class='buttonStyle2' id='deleteButton'><img src='imgs/delete.png'></a></form>
				</div>
			 </c:when>
			 <c:otherwise>
			 	<div id='inputBox'><form action='memoModify.mm' method='post'><textarea name='memo' id='memoArea2'>${i.memo_contents} </textarea>
				<input type="hidden" name="memoNum" value="${i.memo_num }">
				<button type='submit' class='buttonStyle1' id='inputButton'><img src='imgs/pencil.png'></button>
				<a href='memoDelete.mm?memoNum=${i.memo_num} ' class='buttonStyle2' id='deleteButton'><img src='imgs/delete.png'></a></form>
				</div>	
			 </c:otherwise>	
			</c:choose>			
		</c:forEach>
	</div>
</div>
</body>
</html>