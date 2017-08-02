function checkId(){
	if(document.formm.member_id.value==""){
		alert("아이디를 입력해주세요.");
		document.formm.member_id.focus();
		
		return;
	}
	
	var url="WillBeServlet?command=checkId&id="+document.formm.member_id.value;
		
	window.open( url, "_blank_1","toolbar=no, menubar=no, scrollbars=no, resizable=yes, width=500, height=300,top=300, left=300");
	
	
}
function golog(){
	
	location.href="login.jsp";
}
function joinId(){
	if(document.formm.member_id.value==""){
		alert("아이디를 입력하세요.");
		document.formm.member_id.focus();
		
	}else if(document.formm.member_pw.value==""){
		alert("비밀번호를 입력해주세요.");
		document.formm.member_pw.focus();
	}else if((document.formm.member_pw.value!=document.formm.member_pw_check.value)){
		alert("비밀번호가 일치하지 않습니다.");
		document.formm.member_pw.focus();
	}else if(document.formm.member_name.value==""){
		alert("이름을 입력해주세요");
		document.formm.member_name.focus();
	}else if(document.formm.member_gender.value==""){
		alert("성별을 체크해주세요.");
	}else if((document.formm.member_phone1.value||document.formm.member_phone2.value||document.formm.member_phone3.value)==""){
		alert("핸드폰 번호를 입력해주세요");
		document.formm.member_phone1.focus();
	}else if(document.formm.member_email1.value==""){
		alert("메일을 입력해주세요.");
		document.formm.member_email1.focus();
	}else{
		alert("회원가입을 축하합니다!!");
		document.formm.action="WillBeServlet?command=insertmember";
		document.formm.submit();
	}
}