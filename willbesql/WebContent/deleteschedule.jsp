<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
</head>
<body>
<%
	String year=(String)request.getAttribute("year");
String month=(String)request.getAttribute("month");
String date=(String)request.getAttribute("date");
%>
<input type="hidden" name="<%=year %>" value="<%=year %>">
<input type="hidden" name="<%=month %>" value="<%=month %>">
<input type="hidden" name="<%=date %>" value="<%=date %>">

<script>
var month=$("input[name=<%=month%>]").val();
var year=$("input[name=<%=year%>]").val();
var date=$("input[name=<%=date%>]").val();

window.onload=function(){
	alert("삭제완료");
	
	location.href="WillBeServlet?command=schecon&year="+year+"&month="+month+"&date="+date;
}

</script>
</body>
</html>