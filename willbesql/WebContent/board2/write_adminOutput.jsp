<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		font-family:Malgun;
		src: url("font/malgun.eot");
		src: url("font/malgun.woff");
}
	@font-face {
		font-family:DXPnM;
		src: url("font/DXPnM-KSCpc-EUC-H.eot");
		src: url("font/DXPnM-KSCpc-EUC-H.woff");
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
		margin:0 auto;		
	}
	#boardBody_header #title{float:left; font-weight:bold; font-size:12pt;}
	#boardBody_header #number{float:left;}
	#boardBody_header #date{float:right;}
	#boardBody_body{
		width:900px;		
	}
	#boardBody_body #id{margin-top:10px; float:left;}	
	#boardBody_body #file{float:right;}	
	#boardBody_body #contents{
		min-height:300px;
		width:900px;
		float:left;
		margin-top:30px;
		background-color:#FFFFF6;
	}
	#boardBody_body_foot #recommend{
		width:25px;		
		height:25px;
		margin:0 auto;		
	}
	#boardBody_body_foot{
		width:900px;
		margin:0 auto;		
	}
	#boardFoot{
		width:900px;
		margin:0 auto;		
	}	
	#boardFoot_header{
		width:900px;
	}
	#boardFoot_header #reply{		
		color:#FF4848;
		float:left;		
	}
	#boardFoot_header #check{float:left;}
	#boardFoot_body{
		width:900px;
		margin:0 auto;
	}	
	#reply #relpyTable{
        margin: auto;
        border-collapse: collapse;        
    }    
	#reply #relpyId{        
		width:150px;
		height:50px;
		text-align:center;
		vertical-align:middle;
		background-color:#F6F6F6;
	}
	#reply #relpyContents{        
		width:510px;
		height:50px;
        text-align:left;
        vertical-align:middle;
	}
    #reply #relpyDate{
    	width:140px;
    	height:50px;
        text-align:left;
        vertical-align:middle;
        background-color:#F6F6F6;
        font-size:8pt;        
    }    
    #reply #relpyButton{
    	width:30px;
    	height:50px;
    	text-align:center;
        vertical-align:middle;
    }
    #boardFoot_foot{
    	width:900px;
    	height:200px;
    	margin-top:20px;    	
    }	
	#replyInput{
		width:860px;
		margin:0 auto;
	}
	#replyInput #replyId{
		float:left;
		width:110px;
		height:87px;
		text-align:center;        
		line-height:87px;
		background-color:#F6F6F6;		
	}
	#replyInput #replyContents{
		float:left;
		height:87px;
		line-height:87px; 
		width:650px;
	}
	#replyInput #replyContents #replyContentsArea{		
		float:left;
		width:650px;
		height:84px;	
	}
	#replyInput #replyContentsArea{
		border: 1px solid transparent;
		box-sizing: border-box;
		-moz-box-sizing: border-box;
		outline: none;
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
		margin-top:5px;
	}
	#replyInput #replyButton{
		float:right;
		width:90px;
		height:87px;
		text-align:center;		  
	}
	#replyButton #button{
		width:80px;
		height:80px;		
		font-size:14pt;
		font-family:Hoon;		
		text-align: center;		
		border:0px;
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);    
		border-radius: initial;
		background-color: #489CFF;
		color:#fff;
		margin-top:4px;
		cursor:pointer;
	}
	#menuList{
		width:900px;
		height:93px;
		margin-top:20px;		
	}	
	#heartbutton{width:25px; heigth:25px;}
	#xbutton{width:10px; heigth:10px;}
	.content{
		height:25px;
	}
	.menuList{
		width:120px;
		height:30px;
		line-height: 30px;
		border:0px;
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3);    
	    border-radius: initial;
	    background-color: #489CFF;
	    margin-left:20px;				
	}
	
	#replyContents textarea{
		resize:none;
		
	}
	#menuList #menuList_1,#menuList_2,#menuList_3,#menuList_4{	
		float:right;		
		text-align: center;		
	}	
	#menuList a{
		color:#fff;
		font-size:18pt;
		font-family:Hoon;
	}
	#menuList_1:focus, #menuList_1:hover{
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);
	}
	#menuList_2:focus, #menuList_2:hover{
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);
	}
	#menuList_3:focus, #menuList_3:hover{
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);
	}
	#menuList_4:focus, #menuList_4:hover{
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);
	}
	#replyInput #replyContentsArea:focus, #replyInput #replyContentsArea:hover{
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.6);
	}	
	#replyButton #button:focus, #replyButton #button:hover{
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


<input type="hidden" name="BoardNum" value="${content_view.board_num}">
<input type="hidden" name="ConnectId" value="${ConnectId}">
<div id="boardHeader">
	<div id="boardHeader_title">문의 사항</div>
	<hr size='1' noshade>
</div>
<div id="boardBody">
	<div id="boardBody_header">
		<div id="title" class="content">${content_view.board_title}&nbsp;&nbsp;</div>
		<div id="number" class="content">｜&nbsp;&nbsp;${content_view.board_num}</div>
		<div id="date" class="content">${content_view.board_date}</div>
		<div id="clear"></div>
	</div>
	<div id="boardBody_body">
		<div id="id" class="content">${content_view.member_id}</div>
		<div id="file" class="content"><a href="file_down.qt?num=${content_view.board_num}">${content_view.board_file}</a></div>
		<div id="clear"></div>
		<div id="contents"><pre>${content_view.board_contents}</pre></div>
		<div id="clear"></div>
	</div>	
</div>
<div id="boardFoot">
	<div id="boardFoot_header">		
		<div id="check" class="content">&nbsp;조회 ${content_view.board_readcount}</div>
		<div id="clear"></div>		
	</div>
	<div id="boardFoot_body">	 			
		<div id="reply">
			<table id="relpyTable">
				<c:forEach items="${replyDto}" var="replyDto" begin="0" end="${replySize }">		  		
					<tr>
						<td id="relpyId">${replyDto.member_id } </td>
						<td id="relpyContents"><pre>${replyDto.reply_contents }</pre></td>
						<td id="relpyDate">${replyDto.reply_date }</td>
						<td id="relpyButton">
						<a href="replyDelete.qt?replyNum=${replyDto.reply_num }&num=${replyDto.board_num }">
						<img src="imgs/xbutton.png" id="xbutton"></a>				
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="boardFoot_foot">
		<form action="reply_input.qt" method="post">		
		<div id="replyInput">
			<input type="hidden" name="id" value="${ConnectId}">
			<input type="hidden" name="num" value="${content_view.board_num}">
			<div id="replyId">${ConnectId}</div>
			<div id="replyContents"><textarea wrap='VIRTUAL' name='replyContents' id="replyContentsArea"></textarea></div>
			<div id="replyButton"><input type="submit" id="button" name="replyPost" value="등록"></div>
			<div id="clear"></div>
		</div>
		</form>
		<div id="clear"></div>
		<div id="menuList">		
			<div id="menuList_1" class="menuList">
				<a href='listboard.qt'>목록</a>
			</div>
			<div id="menuList_2" class="menuList">
				<a href='write.qt'>글쓰기</a>
			</div>
			<div id="menuList_3" class="menuList">				
				<a href="delete_pass.qt?num=${content_view.board_num}">삭제</a>
			</div>	
			<div id="menuList_4" class="menuList">				
				<a href="modify_pass.qt?num=${content_view.board_num}">수정</a>
			</div>
		</div>
	</div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script language='javascript' type="text/javascript" charset="utf-8">
function replyPost(){
	var replyContents=$("textarea[name=replyContents]").val();
	var id=$("input[name=ConnectId]").val();
	var boardNum=$("input[name=BoardNum]").val();
	
	alert(replyContents);
	
	var url="reply_input.qt?id="+id+"&replyContents="+replyContents+"&num="+boardNum;
	location.href=url;
}
</script>
</body>
</html>