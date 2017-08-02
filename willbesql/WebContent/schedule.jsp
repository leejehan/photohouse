<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스케줄</title>
<link rel="stylesheet" type="text/css" href="css/titleMenu.css">
<style>
*{margin:0px;padding:0px;}
@font-face{font-family:HoonWhitecatR;
		   src:url("font/HoonWhitecatR.eot");
		   src:url("font/HoonWhitecatR.woff")}
@font-face {font-family:Malgun;
		src: url("font/malgun.eot");
		src: url("font/malgun.woff");}
body{font-family:HoonWhitecatR;font-size:30px;}
#scheduleTable{background-color:#FFF;height:500px;}
#scheduleTable tr{border-bottom:3px solid #FF2424;}
#scheduleTable th{width:100px;height:40px;font-family:Malgun;font-size:14pt;}
#scheduleTable td{width:100px;height:100px;border:0px;}
#cal td{width:100px;height:100px;}
#sun{color:red;}
#sat{color:blue;}
.day{background-color:#FFF;border-radius:10px;font-family:Malgun;font-size:14pt;text-align:center;vertical-align:top;}
#leftbutton,#rightbutton,#cal{float:left;}
#leftbutton,#rightbutton{margin-top:250px;margin-left:20px;margin-right:20px;cursor:pointer;}
#leftbut,#rightbut{width:120px;hegiht:300px;}
#titlecon{font-size:20px;font-family:HoonWhitecatR;text-align:left;}
a:link{text-decoration:none;color:black;}
a:visited{text-decoration:none;color:black;}
a:hover{text-decoration:none;color:#aaa;}
#wrap{width:1036px;height:1000px;position:relative;top:0;right:0;bottom:0;left:0;margin:0 auto;}
#yearMonth{font-size:36pt;font-family:Malgun;font-style:italic;margin-bottom:20px;}
#now{font-size:16pt;margin-bottom:20px;}
#BorderLine td{height:2px !important;}
#BorderLine{background-color:#FF9090;border:2px solid #FF9090 !important;height:2px !important;}
#BorderTitleLine td{height:4px !important;}
#BorderTitleLine{background-color:#FF1212;border:4px solid #FF1212 !important;height:4px !important;}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
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



<%
	request.getAttribute("schedulelist");
%>
<input type="hidden" name="${year }" value="${year }">
<input type="hidden" name="${month }" value="${month }">
<div id="wrap">
<div id="leftbutton">
<img src="images/leftbu.png" onclick="prevmonth()" id="leftbut">
</div>
<div id="cal">
	<center><div id="yearMonth">${year}년${month}월</div></center>
	<div id="now">1</div>
		<table id="scheduleTable">
			<tr id="wallPaperLine">
				<th id="sun">SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th id="sat">SAT</th>
			</tr>			
			<tr id="BorderTitleLine"><td colspan="7"></td></tr>
			<tr id="wallPaperLine">
				<c:set var="line" value="0"/>
					<c:forEach var="i" begin="1" end="${sday}">
						<td>&nbsp;</td><c:set var="line" value="${line+1}"/>
					</c:forEach>
	
					<c:forEach var="j" begin="1" end="${eday}">
						<c:set var="line" value="${line+1}"/>
							<td class="day">
							<a href="WillBeServlet?command=schecon&year=${year}&month=${month}&date=${j}">${j}</a>
							<c:forEach items="${schedulelist}" var="schedulelist">
								<c:if test="${schedulelist.schedule_year eq year}">
								<c:if test="${schedulelist.schedule_Month eq month}">
								<c:if test="${schedulelist.schedule_Day eq j}">
									<c:choose>
										<c:when test="${fn:length(schedulelist.schedule_title)>7}">
											<div id="titlecon">${fn:substring(schedulelist.schedule_title,0,6)}...</div>
										</c:when>
										<c:otherwise>
											<div id="titlecon">${schedulelist.schedule_title}</div>
										</c:otherwise>
									</c:choose>
								</c:if>
								</c:if>
								</c:if>
							</c:forEach>
							</td>
						<input type="hidden" name="${date}" value="${j }">
					<c:choose>
						<c:when test="${(line%7)==0}">
			</tr>
			<tr id="wallPaperLine">
			<tr id="BorderLine"><td colspan="7"></td></tr>		
						</c:when>
					</c:choose>
				</c:forEach>
			</tr>
		</table>
</div>
<div id="rightbutton">
<img src="images/rightbu.png" onclick="nextmonth()" id="rightbut">
</div>
</div>
<script>

window.onload=function(){
	var nowdate=new Date();

	var todayyear=nowdate.getFullYear();
	var todaymonth=nowdate.getMonth()+1;
	var todaydate=nowdate.getDate();
	
	var day=document.getElementById('now');
	
	day.innerHTML='오늘 : '+todayyear+'년'+todaymonth+'월'+todaydate+'일';
}
var month=$("input[name=${month}]").val();
var year=$("input[name=${year}]").val();

function prevmonth(){
	
	location.href="WillBeServlet?command=prevmonth&year="+year+"&month="+month;
}
function nextmonth(){
	location.href="WillBeServlet?command=nextmonth&year="+year+"&month="+month;

} 





</script>
</body>
</html>