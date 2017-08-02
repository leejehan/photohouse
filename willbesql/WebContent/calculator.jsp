<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head> 
    <title>계산기</title>    
<style>
	a:link{text-decoration:none;color:#000;font-family:Malgun;}
	a:visited{text-decoration:none;color:#000;font-family:Malgun;}
	a:hover{text-decoration:none;color:#aaa;font-family:Malgun;}	 
	@font-face {
		font-family:Malgun;
		src: url("font/malgun.eot");
		src: url("font/malgun.woff");
	}
	
</style>
    <link rel="stylesheet" href="css/jquery.flipster.min.css">
    <link rel="stylesheet" href="css/simple.css">
    <link rel="stylesheet" href="css/pay.css">
    <link rel="stylesheet" href="css/obesity.css">
    <link rel="stylesheet" href="css/titleMenu.css">    

    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.flipster.min.js"></script>
    
    <script type="text/javascript">
   var data, result;

   function bt_adder(x) {
      data = document.getElementById('data');
      data.value = data.value + x; 
   }

   function calc() {
      data.value = eval(data.value) 
   }
</script>
        <script type="text/javascript">
        
        function cal() {
            var price = $("#price").val();
            var wday = $("#wday").val();
            var start = $("#start").val();
            var stop = $("#stop").val();
            var resoltdv;
            
            var time = stop - start; //근무시간
            var dailySalary = price * time; //일급
            var monthlySalary = dailySalary * wday //월급

            //resoltdv = "총일급은 : " + dailySalary +" 원</br>";
            //resoltdv += "총월급은 : " + monthlySalary+" 원";    
            resoltdv = "총일급은 : " + Number(dailySalary).toLocaleString().split(".") +" 원</br>";
            resoltdv += "총월급은 : " + Number(monthlySalary).toLocaleString().split(".")+" 원";    

            $("#resoltdv1").html(resoltdv);
        }
    </script>
    <script type="text/javascript">

        function cal1() {
        var cm = $("#cm").val(); //키
        var kg = $("#kg").val(); //몸무게
        var bmi; //bmi지수
		var goodkg = (cm-100)*0.9; //표준체중
		var obesity;
		
		var resoltdv;
        
        cm =cm*0.01;
        bmi=kg/(cm*cm);

        if(bmi>30.0){
        	obesity = ("당신은 현재 [비만]상태입니다. 운동하세요!");
        }
        else if((bmi>25.0)&&(bmi<=29.99)){
        	obesity = ("당신은 현재 [과체중]상태입니다. 조심하세요!");
        }
        else if((bmi>18.5)&&(bmi<=25.0)){
        	obesity = ("당신은 현재 [정상]입니다.^^!");
        }
        else{
        	obesity = ("당신은 현재 [저체중]상태입니다. 많이 드세요!");
        }
		
        resoltdv = "표중체중 : " + goodkg + "</br>";
        resoltdv += "BML지수 : " + bmi.toFixed(2) + "</br>";
        resoltdv += "비만도 : " + obesity;

        $("#resoltdv").html(resoltdv);
    }
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

    <div id="carousel">
        <ul class="flip-items">
            <li data-flip-title="월급계산기">
                   <center>
	<div id="padBox2">
         <div id="calBox2">
    <form name="pricecal" id="pricecal">
        <p><br>
            <label for="price">시급 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </label>
            <input type="text" id="price" placeholder="숫자만 입력하세요"> </p>
        <p>
            <label for="start">시작시간 :</label>
            <select name="start" id="start" onchange="selectReservStart(this.value)"> 

		<option value = "">시간선택</option> 
			<% for(int i=0; i<24; i++){%>
				<% if(i<10){%>
				<option value="<%=i %>">0<%=i %>:00</option>
				<% }else{ %>
				<option value="<%=i %>"><%=i %>:00</option>
				<% }%>
			<% }%>
		</select>  
		</p>
        <p>
            <label for="stop">종료시간 :</label>
            <select name="stop" id="stop" onchange="selectReservStart(this.value)"> 
			<option value = "">시간선택</option> 
				<% for(int i=0; i<24; i++){%>
					<% if(i<10){%>
					<option value="<%=i %>">0<%=i %>:00</option>
					<% }else{ %>
					<option value="<%=i %>"><%=i %>:00</option>
					<% }%>
				<% }%>
			</select>  
			</p>
			<p>
            <label for="wday">근무일수 :</label>
            <input type="text" id="wday" placeholder="숫자만 입력하세요"> </p>
            <button onclick="cal(); return false;" id="calbt">계산하기</button>
        <div id="resoltdv1"></div>
    </form>
	</div>
         </div>
   </center>

            </li>
            <li data-flip-title="계산기">
      <form name="frm"> 
      <div id="padBox">
         <div id="calBox">
         <table>
            <tr>  
               <td colspan="5"><input type="text" align="right" name="data" id="data" size="48"/></td>
            </tr>
            <tr>  
               <td><input type="button" id="bt" value="7" onclick="bt_adder('7')"></td>
               <td><input type="button" id="bt" value="8" onclick="bt_adder('8')"></td>
               <td><input type="button" id="bt" value="9" onclick="bt_adder('9')"></td>
               <td><input type="button" id="bt" value="/" onclick="bt_adder('/')"></td>
               <td><input type="reset" id="bt3" value="C"></td>
            </tr>
            <tr>   
               <td><input type="button" id="bt" value="4" onclick="bt_adder('4')"></td>
               <td><input type="button" id="bt" value="5" onclick="bt_adder('5')"></td>
               <td><input type="button" id="bt" value="6" onclick="bt_adder('6')"></td>
               <td><input type="button" id="bt" value="*" onclick="bt_adder('*')"></td>
               <td><input type="button" id="bt3" value="%" onclick="bt_adder('%')"></td>
            </tr>
            <tr>  
               <td><input type="button" id="bt" value="1" onclick="bt_adder('1')"></td>
               <td><input type="button" id="bt" value="2" onclick="bt_adder('2')"></td>
               <td><input type="button" id="bt" value="3" onclick="bt_adder('3')"></td>
               <td><input type="button" id="bt" value="-" onclick="bt_adder('-')"></td>
               <td rowspan="2" id="rowBt"><input type="button" id="bt2" value="=" onclick="calc()"></td>
            </tr>
            <tr>  
               <td colspan="2"><input type="button" id="bt1" value="0" onclick="bt_adder('0')"></td>
               <td><input type="button" id="bt" value="." onclick="bt_adder('.')"></td>
               <td><input type="button" id="bt" value="+" onclick="bt_adder('+')"></td>
            </tr>
         </table>
         </div>
         </div>
      </form>  
            </li>

            <li data-flip-title="비만도계산기">
                	<form name="pricecal" id="pricecal">
       <div id="padBox1">
         <div id="calBox1">
        <p><br>
            <label for="cm">신장&nbsp;&nbsp;&nbsp; : </label>
            <input type="text" id="cm" placeholder="숫자만 입력하세요"> </p>
        <p>
            <label for="kg">몸무게 : </label>
            <input type="text" id="kg" placeholder="숫자만 입력하세요">
            <p>
            <button onclick="cal1(); return false;" id="calbt">계산하기</button></p>
        <div id="resoltdv"></div>
</div>
         </div>
    </form>
   </center>
            </li>

        </ul>
    </div>
<script>
    var carousel = $("#carousel").flipster({
        style: 'carousel',
        spacing: -0.3,
        nav: true,
        buttons:   true,
    });
</script>
</body>
</html>