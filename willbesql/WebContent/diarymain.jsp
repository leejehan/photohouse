<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>다이어리</title>
<link rel="stylesheet" type="text/css" href="css/titleMenu.css">
<style>
@font-face{font-family:HoonWhitecatR;
		   src:url("font/HoonWhitecatR.eot");
		   src:url("font/HoonWhitecatR.woff")}
@font-face{font-family:malgun;
		   src:url("font/malgun.eot");
		   src:url("font/malgun.woff")}
body{font-family:HoonWhitecatR;}
#today{background-color:#F6F6F6;
	border:1.5px solid #8C8C8C;
	border-radius:25px;}
#diarytop{width:605px;height:100px;background-color:#fff;}
#prevmonth,#nextmonth{width:40px;height:40px;cursor:pointer;font-size:20pt;padding-top:5px;}
#yearmonth{width:80px;height:40px;font-size:20pt;padding-top:5px;}
#prevmonth,#yearmonth,#nextmonth,#today,#sidewrap,#dateclick{float:left;}
#today{height:100px; width:100px;}
.clear{clear:both;}
#dateclick{width:490px;
	margin-left:5px;
	background-color:#F6F6F6;
	border:1.5px solid #8C8C8C;
	border-radius:25px;}
#diarycontent{width:600px;height:400px;margin:0 auto;}
#contentarea{background-image: url(images/textline.gif);border:none;
	font-size:10pt;margin-top:10px;padding:0px;width:600px;height:400px;overflow:auto;}
#insertdiary,#updatediary{border:3px solid black;width:80px;height:30px;font-size:25pt;margin:auto;}
.datefont{font-size:17pt;}
#sidewrap{margin-right:5px;}
#diarybutton{margin-top:20px;}
.daybut{float:left;height:40px;width:25px;padding-top:10px;}
a:link{text-decoration:none;color:black;}
a:visited{text-decoration:none;color:black;}
a:hover{text-decoration:none;color:#aaa;}
.daybut:hover{outline:1px solid #aaa}
#todayfont{font-size:18pt;}
#insertdiary:hover{color:#aaa;border:3px solid #aaa;}
#updatediary:hover{color:#aaa;border:3px solid #aaa;}

</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){	
	if($("input[name=diaryInput]").val()!=""){
		$("#insertdiary").hide();
	}
	if($("input[name=diaryInput]").val()==""){
		$("#updatediary").hide();
	}
	
	
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
<center>
<div id="wrap">
<div id="diarytop">
	<div id="today">
			<center><p id="todayfont">${month}월${date }일<br>
			<c:if test="${sday==1 }">
				<font color="red">SUN</font></p>
			</c:if>
			<c:if test="${sday==2 }">
				MON</p>
			</c:if>
			<c:if test="${sday==3 }">
				TUE</p>
			</c:if>
			<c:if test="${sday==4 }">
				WED</p>
			</c:if>
			<c:if test="${sday==5}">
				THU</p>
			</c:if>
			<c:if test="${sday==6 }">
				FRI</p>
			</c:if>
			<c:if test="${sday==7 }">
				<font color="blue">SAT</font></p>
			</c:if>
			</center>
			<input type="hidden" name="${year }" value="${year }">
			<input type="hidden" name="${month }" value="${month }">
			<input type="hidden" name="${date }" value="${date }">
	</div>

	<div id="dateclick">
		<div id="sidewrap">
			<div id="prevmonth" onclick="prevmonth()">
				◀
			</div>
			<div id="yearmonth">
				<center>${year }. ${month }</center>
			</div>
			<div id="nextmonth" onclick="nextmonth()">
				▶
			</div>
			<div class="clear"></div>		
		</div>
		<c:forEach var="i" begin="1" end="${eday }">
			<a href="WillBeServlet?command=diarydate&year=${year}&month=${month}&date=${i}" class="datefont">
			<c:choose>
			<c:when test="${date==i}">
				<div class="daybut" border="1">${i }</div></a>
			</c:when>
			<c:otherwise>
				<div class="daybut">${i }</div></a>
			</c:otherwise>
			</c:choose>
			
		</c:forEach>
		
	</div>
	<div class="clear">
	</div>
</div>
</center>
<div id="diarycontent">
	<input type="hidden" name="diaryInput" value="${diary.diary_content}">
	<div id="contentarea" name="contentarea"><pre>${diary.diary_content}</pre></div>
</div>
<center>
<div id="diarybutton">
	<center><a href="WillBeServlet?command=insertdiary&year=${year}&month=${month}&date=${date}"><div id="insertdiary">일기쓰기</div></a></center>
	<center><a href="WillBeServlet?command=updatediary&year=${year}&month=${month}&date=${date}"><div id="updatediary">수정</div></a></center>
</div>
</div>
</center>
<script>

var date=$("input[name=${date}]").val();
var month=$("input[name=${month}]").val();
var year=$("input[name=${year}]").val();

if(date==31){
	date=1;
}else if(date==30){
	date=1;
}else if(date==29){
	date=1;
}

function prevmonth(){
	location.href="WillBeServlet?command=diaryprevmonth&year="+year+"&month="+month+"&date="+1;
}
function nextmonth(){	
	location.href="WillBeServlet?command=diarynextmonth&year="+year+"&month="+month+"&date="+1;
}

</script>
</body>
</html>