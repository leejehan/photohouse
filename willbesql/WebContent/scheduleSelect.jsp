<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스케줄 상세정보</title>
<link rel="stylesheet" type="text/css" href="css/titleMenu.css">
<style>
@font-face{font-family:HoonWhitecatR;
		   src:url("font/HoonWhitecatR.eot");
		   src:url("font/HoonWhitecatR.woff");}
@font-face{font-family:DxPnM;
		   src:url("DXPnM-KSCpc-EUC-H.eot");
		   src:url("DXPnM-KSCpc-EUC-H.woff");}
@font-face {font-family:Malgun;
		   src: url("font/malgun.eot");
		   src: url("font/malgun.woff");}
.button{		
	  width:160px;
      height:50px;
      line-height: 30px;
      border:0px;
      box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);    
      border-radius: initial;
      background-color: #489CFF;
      margin-left:20px;
      font-size:20pt;
      font-family:HoonWhitecatR;      
      text-align: center;
      color:#fff;
      cursor:pointer;
}
.button:focus, .button:hover{
      box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);
   }
#subject{width:200px;}
#wrap{width:800px;height:700px;margin:0 auto;}
#deleteschedule{font-family:HoonWhitecatR;font-size:20pt;}
#delwrap{float:right;}
a:link{text-decoration:none;color:black;}
a:visited{text-decoration:none;color:black;}
a:hover{text-decoration:none;color:#aaa;}

#butwrap{margin-top:50px;}


	#viewDay{
		width:700px;
		margin:0 auto;
		font-family:HoonWhitecatR;
		font-size:18pt;
		color:#111;		
	}
	#scheduleBox{width:800px;}
	#scheduleTable{
		margin:0 auto;
		width:800px;		
	}
	#scheduleTable #subject{width:200px;}
	#scheduleTable #time{width:250px;}
	#scheduleTable #work{width:350px;}
	#scheduleTable #scheduleTableheader td{
		text-align:center;
		height:50px;
		font-family:HoonWhitecatR;
		font-size:17pt;
		color:#000;		
		background-color:#F8F8F8;
		border:2.5px solid #0A82FF;
		border-radius:20px;
	}
	#scheduleTable td{
		font-family:Malgun;
		text-align:center;
		height:45px;	
	}	
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>

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

<%
	request.getAttribute("schedulelist");
	String year=(String)request.getAttribute("year");
	String month=(String)request.getAttribute("month");
	String date=(String)request.getAttribute("date");
 %>

 
<div id="viewDay"><p><%=year %>년 <%=month %>월 <%=date %>일의 스케줄</p></div>
<div id="wrap">
	<div id="scheduleBox">	
	<table id="scheduleTable">
		<tr id="scheduleTableheader">
			<td id="subject">일정제목</td><td id="time">일정시간</td><td id="work">일정내용</td>
		</tr>
		<c:forEach items="${schedulelist}" var="schedulelist">
		<tr>
			<td>${schedulelist.schedule_title}</td>
			<td>${schedulelist.schedule_time }</td>
			<td>${schedulelist.schedule_content}<div id="delwrap"><a href="WillBeServlet?command=delschedule&year=<%=year %>&month=<%=month %>&date=<%=date %>&time=${schedulelist.schedule_time }" id="deleteschedule"><img width="20" height="20" src="images/xbutton.png"></a></div></td>
		</tr>
		</c:forEach>
	</table>
	</div>
<center>
<div id="butwrap">
<input type="button" value="일정등록" onclick="insertSchedule()" class="button">
<input type="button" value="목록으로" onclick="go_schedule()"  class="button">
</div>
<div class="clear"></div>
<input type="hidden" name="<%=year%>" value="<%=year%>">
<input type="hidden" name="<%=month%>" value="<%=month%>">
<input type="hidden" name="<%=date%>" value="<%=date%>"></center>
</div>
<script>
var month=$("input[name=<%=month%>]").val();
var year=$("input[name=<%=year%>]").val();
var date=$("input[name=<%=date%>]").val();
function insertSchedule(){
	location.href="WillBeServlet?command=insertSchedule&year="+year+"&month="+month+"&date="+date;
}
function go_schedule(){
	location.href="WillBeServlet?command=schedule";
}
</script>
</body>
</html>