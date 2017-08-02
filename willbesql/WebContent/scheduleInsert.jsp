<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>스케줄입력</title>
<link rel="stylesheet" type="text/css" href="css/titleMenu.css">
<style>
	*{margin:0px;padding:0px;}
	a:link{text-decoration:none;color:black;}
	a:visited{text-decoration:none;color:black;}
	a:hover{text-decoration:none;color:#aaa;}
	@font-face{font-family:HoonWhitecatR;
		   src:url("font/HoonWhitecatR.eot");
		   src:url("font/HoonWhitecatR.woff");}
	@font-face{font-family:malgun;
		   src:url("font/malgun.eot");
		   src:url("font/malgun.woff");}
	#viewDay{
		width:700px;
		margin:0 auto;
		font-family:HoonWhitecatR;
		font-size:20pt;
		color:#111;		
		margin-bottom:40px;
	}
	#scheduleBox{
		width:400px;
		margin:0 auto;
	}
	#scheduleBox *{font-family:malgun;}
	#schedulTable{
	}
	#schedulTable tr td{
		border-bottom:8px solid white;
	}
	.firstTd{
		width:100px;
		text-align:center;
		font-size:13pt;
		font-style:italic;
	}
	#titleSubject{
		height:40px;
		width:300px;
		border:0px;
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);
	}
	#titleSubject:hover,#titleSubject:focus{
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);
	}
	#TimeSelect select{
		width:146.5px;
		border:0px;
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);		
	}
	#TimeSelect select:hover,#TimeSelect select:focus{
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);
	}
	#contents{
		width:299px;
		height:250px;
		overflow:auto;
		resize:none;
		border:0px;
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);		
	}
	#contents:hover,#contents:focus{
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);
	}
	#buttonTd{
		text-align:center;
		height:100px;
	}
	#button{
		border:0px;		
		font-family:HoonWhitecatR;
		background-color: #489CFF;
		width:160px;
      	height:50px;
		font-size:20pt;
		color:#fff;
		cursor:pointer;		
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);		
	}
	#button:hover{
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
	String year=(String)request.getAttribute("year");
	String month=(String)request.getAttribute("month");
	String date=(String)request.getAttribute("date");

%>




<div id="viewDay"><p><%=year %>년 <%=month %>월 <%=date %>일의 스케줄</p></div>

<div id="scheduleBox">
	<form action="WillBeServlet?command=insertScheduleForm" method="post">
	<input type="hidden" name="year" value="<%=year %>">
	<input type="hidden" name="month" value="<%=month %>">
	<input type="hidden" name="date" value="<%=date %>">	
		<table id="schedulTable">
			<tr>
				<td class="firstTd">일정</td>
				<td><input type="text" name="title" id="titleSubject" placeholder="제목을 입력하세요"></td>
			</tr>
			<tr>
				<td class="firstTd">시작시간</td>
				<td id="TimeSelect">
					<select name='shour'>
						<option value="0">0시</option><option value="1">1시</option>
						<option value="2">2시</option><option value="3">3시</option>
						<option value="4">4시</option><option value="5">5시</option>
						<option value="6">6시</option><option value="7">7시</option>
						<option value="8">8시</option><option value="9">9시</option>
						<option value="10">10시</option><option value="11">11시</option>
						<option value="12">12시</option><option value="13">13시</option>
						<option value="14">14시</option><option value="15">15시</option>
						<option value="16">16시</option><option value="17">17시</option>
						<option value="18">18시</option><option value="19">19시</option>
						<option value="20">20시</option><option value="21">21시</option>
						<option value="22">22시</option><option value="23">23시</option>
					</select>
					<select name='sminute'>
						<option value="00">0분</option>
						<option value="05">5분</option><option value="10">10분</option>
						<option value="15">15분</option><option value="20">20분</option>
						<option value="25">25분</option><option value="30">30분</option>
						<option value="35">35분</option><option value="40">40분</option>
						<option value="45">45분</option><option value="50">50분</option>
						<option value="55">55분</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="firstTd">종료시간</td>
				<td id="TimeSelect">
					<select name='ehour'>
						<option value="0">0시</option><option value="1">1시</option>
						<option value="2">2시</option><option value="3">3시</option>
						<option value="4">4시</option><option value="5">5시</option>
						<option value="6">6시</option><option value="7">7시</option>
						<option value="8">8시</option><option value="9">9시</option>
						<option value="10">10시</option><option value="11">11시</option>
						<option value="12">12시</option><option value="13">13시</option>
						<option value="14">14시</option><option value="15">15시</option>
						<option value="16">16시</option><option value="17">17시</option>
						<option value="18">18시</option><option value="19">19시</option>
						<option value="20">20시</option><option value="21">21시</option>
						<option value="22">22시</option><option value="23">23시</option>
					</select>
					<select name='eminute'>
						<option value="00">0분</option>
						<option value="05">5분</option><option value="10">10분</option>
						<option value="15">15분</option><option value="20">20분</option>
						<option value="25">25분</option><option value="30">30분</option>
						<option value="35">35분</option><option value="40">40분</option>
						<option value="45">45분</option><option value="50">50분</option>
						<option value="55">55분</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="firstTd">상세내용</td>
				<td><textarea name="content" id="contents"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" id="buttonTd"><input type="submit" value="일정등록" id="button"></td>
			</tr>
		</table>	
	</form>
</div>
</body>
</html>