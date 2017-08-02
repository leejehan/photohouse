<%@page import="willbe.together.action.boardListAction"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="willbe.together.db.boardDTO"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>함께 해요!</title>
<link rel="stylesheet" type="text/css" href="css/boardtitleMenu.css">
<style>
* {
	margin: 0px;
	padding: 0px;
	font-family:Malgun;
}

#clear {
	clear: both;
}

A:link {
	text-decoration: none;
	color: #5D5D5D;
}

A:visited {
	text-decoration: none;
	color: #5D5D5D;
}

A:hover {
	text-decoration: none;
	color: #191919;
}

@font-face {
	font-family:Hoon;
	src: url("font/HoonWhitecatR.eot");
	src: url("font/HoonWhitecatR.woff");
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

#listHeader {
	width: 900px;
	height: 50px;
	margin: 0 auto;
	margin-top: 20px;
}

#listHeader_title {
	width: 108px;
	font-size: 20pt;
	font-family: Hoon;
	margin: 0 auto;
}

#listBody {
	width: 900px;
	margin: 0 auto;
}

#listBody_head #listTable {
	width: 800px;
	margin: auto;
	border-collapse: collapse;
	text-align: center;
	vertical-align: middle;
}

#listBody_head #listTable th {
	font-weight: bold;
	font-size: 12pt;
	height: 30px;
}

#listBody_head #listTable tr {
	border-bottom: 1px solid #D5D5D5;
}

#listBody_head #listTable tr td {
	background-color: #ffffff;
	height: 30px;
}

#listTable #listNum {
	width: 100px;
	font-size: 8pt;
}

#listTable #listTitle {
	width: 200px;
}

#listTable #listTitle a:hover {
	text-decoration: underline;
	color: black;
}

#listTable #listWriter {
	width: 120px;
	font-size: 9pt;
}

#listTable #listDate {
	width: 200px;
	font-size: 8pt;
}

#listTable #listReadCount {
	width: 90px;
	font-size: 8pt;
}

#listTable #listLike {
	width: 90px;
	font-size: 8pt;
}

#listBody_body {
	width: 900px;
	margin: 0 auto;
	margin-top: 20px;
}

#listBody_body #leftButton {
	width: 30px;
	height: 30px;
	background-color: #FFFFFF;
	border: 2px solid black;
}

#listBody_body #rightButton {
	width: 30px;
	height: 30px;
	background-color: #FFFFFF;
	border: 2px solid black;
}

#listBody_body a:hover {
	font-weight: bold;
	color: #0500A5;
}

#listBody_foot {
	width: 280px;
	height:50px;
	margin: 0 auto;
	margin-top: 20px;
}

#SearchText {
	border: 1px solid transparent;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	height: 41px;
	outline: none;
	width: 200px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.4);
	margin-top:4px;
}

#searchButton {
	width: 70px;
	background-color: #489CFF;
	color: #fff;
	font-size: 15pt;
	font-family: Hoon;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);
	border-radius: initial;
	height: 42px;
	position: relative;
	top:3px;	
	border:0px;
	cursor:pointer;
}
#SearchTextDiv,#searchButtonDiv{
	float:left;
}
#searchButtonDiv{margin-left:10px;}
#SearchText:focus, #SearchText:hover {
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);
}

#searchButton:focus, #searchButton:hover {
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);
}

#listFoot {
	width: 900px;
	margin: 0 auto;
}

#regitButton {
	float: right;
	width: 120px;
	height: 30px;
	text-align: center;
	line-height: 30px;
	border: 0px;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);
	border-radius: initial;
	background-color: #489CFF;
}

#regitButton:focus, #regitButton:hover {
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);
}

#regitButton a {
	color: #fff;
	font-size: 18pt;
	font-family: Hoon;
}
</style>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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

	<input type="hidden" id="fp" name="fp" value="${pg.fp}">
	<input type="hidden" id="lp" name="lp" value="${pg.lp}">
	<input type="hidden" id="pageNum" name="pageNum"
		value="${page.pageNum}">
	<input type="hidden" id="pageNum" name="pageNum"
		value="${page.pageNum}">

	<!-- ------------------------------------------ -->
	<div id="listHeader">
		<div id="listHeader_title">함께 해요!</div>
		<hr size='1' noshade>
	</div>
	<div id="listBody">
		<div id="listBody_head">
			<table id="listTable">
				<tr>
					<th id="listNum">번호</th>
					<th id="listTitle">제목</th>
					<th id="listWriter">작성자</th>
					<th id="listDate">작성일</th>
					<th id="listReadCount">조회</th>
					<th id="listLike">좋아요</th>
				</tr>
				<c:forEach items="${boardList}" var="dto" begin="${startNum}"
					end="${finalNum}">
					<tr>
						<td id="listNum">${dto.board_num}</td>
						<c:choose>
							<c:when test="${fn:length(dto.board_title)>10}">							
								<td id="listTitle"><a href="write_output.sw?num=${dto.board_num }">${fn:substring(dto.board_title,0,9)}...</a></td>
							</c:when>
							<c:otherwise>
								<td id="listTitle"><a href="write_output.sw?num=${dto.board_num }">${dto.board_title }</a></td>
							</c:otherwise>
						</c:choose>
						<td id="listWriter">${dto.member_id }</td>
						<td id="listDate">${dto.board_date }</td>
						<td id="listReadCount">${dto.board_readcount }</td>
						<td id="listLike">${dto.board_like }</td>
					<tr>
				</c:forEach>
			</table>
		</div>
		<div id="listBody_body">
			<center>
				<%
					boardDTO pageList = (boardDTO) request.getAttribute("page");
					int pageNum = (int) pageList.getPageNum();
					int pageSize = (int) pageList.getPageSize();

					boardDTO pg = (boardDTO) request.getAttribute("pg");
					int fp = (int) pg.getFp();
					int lp = (int) pg.getLp();
				%>
				<%
					if (fp > 5) {
				%>
				<input type="button" id="leftButton" value="◀"
					onclick="pageDecrease()"> <input type="hidden"
					name="DecreasePage" value="<%=fp - pageSize%>">
				<%
					}
				%>
				<%
					for (int i = fp; i <= lp; i++) {
				%>
				<a href="listboard.sw?currentPage=<%=i%>&fp=<%=fp%>&lp=<%=lp%>">
					<%
						out.println(i);
					%>
				</a>
				<%
					}
				%>
				<%
					if (lp < pageNum) {
				%>
				<input type="button" id="rightButton" value="▶"
					onclick="pageIncrease()"> <input type="hidden"
					name="IncreasePage" value="<%=lp + 1%>">
				<%
					}
				%>
			</center>
		</div>
		<div id="listBody_foot">
			<div id="SearchTextDiv"><input type="text" id="SearchText" name="titleSearch"
				placeholder="제목을 입력하세요"></div>
			<div id="searchButtonDiv"><input type="button" id="searchButton" name="search"
				 value="검색" onclick="SearchTitle()"></div>
		</div>
	</div>
	<div id="clear"></div>
	<div id="listFoot">
		<div id="regitButton">
			<a href="write.sw">등록</a>
		</div>
	</div>
	<script>
		var variation = 5; //페이징처리 할 갯수
		var firstPage = $("input[name=fp]").val();
		var lastPage = $("input[name=lp]").val();
		var pN = $("input[name=pageNum]").val();		
		var pageNum = parseInt(pN);
		var remain = pageNum % variation;
		var fp, lp;
		
		

		var DecreasePage = $("input[name=DecreasePage]").val();
		var IncreasePage = $("input[name=IncreasePage]").val();

		function pageDecrease() {
			fp = parseInt(firstPage) - variation;
			lp = parseInt(lastPage);
			if (fp <= 0) {
				fp = parseInt(firstPage);
				lp = variation;
			} else if (lp >= pageNum) {
				if (pageNum % variation == 0) {
					lp = pageNum - variation;
				} else {
					lp = parseInt(lastPage) - remain;
				}

			} else {
				lp = lp - variation;
			}
			if (DecreasePage <= 0) {
				DecreasePage = 1;
			}

			var url = "listboard.sw?&currentPage="	+ DecreasePage + "&fp=" + String(fp) + "&lp=" + String(lp);
			location.href = url;
		}

		function pageIncrease() {
			lp = parseInt(lastPage) + variation;
			fp = parseInt(firstPage);
			if (lp >= pageNum) {
				if (pageNum % variation == 0) {
					fp = pageNum - variation + 1;
					lp = pageNum;
				} else {
					fp = pageNum - remain + 1;
					lp = pageNum;
				}
			} else {
				fp = fp + variation;
			}
			if (IncreasePage >= pageNum) {
				IncreasePage = pageNum;
			}

			var url = "listboard.sw?&currentPage="	+ IncreasePage + "&fp=" + String(fp) + "&lp=" + String(lp);
			location.href = url;
		}

		function SearchTitle() {
			var title = $("input[name=titleSearch]").val();

			var url = "listboardSearch.sw?title=" + title;
			location.href = url;
		}
	</script>
</body>
</html>
</body>
</html>