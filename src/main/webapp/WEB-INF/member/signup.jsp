<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Signup</title>
<meta charset="utf-8">
<style type="text/css">
* {
	margin: 0;
	padding: 0
}

#signupj {
	margin-left: 50px;
	margin-top: 80px;
	float: left;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script> 
<script type="text/javascript">

var id2 = $("#mem_id").val();
$(function() {
	$("#idck").click(function() {
		$.ajax({
			url : "Ajax/idchk.do",
			type : "get",
			data : {mem_id : $("#mem_id").val()},
			datatype : "text",
			success : function(data) {
				if(data=="y"){
					alert("사용 가능");
				}else{
					alert("사용 불가능");
				}
			},
			error : function() {
				alert("회원가입 실패")
			}
		})
	})
	
	$("#sign_ok").click(function() {
		var mem_id = document.getElementById("mem_id");
		var mem_pw = document.getElementById("mem_pw");
		var mem_pw2 = document.getElementById("mem_pw2");
		var mem_name = document.getElementById("mem_name");
		var mem_birth = document.getElementById("mem_birth");
		var mem_email = document.getElementById("mem_email");
		var mem_phone = document.getElementById("mem_phone");
		var mem_gender = document.getElementById("mem_gender");
		
		if(mem_id.value == ""){
			alert("아이디를 입력하세요");
			mem_id.focus();
		}else if(mem_pw.value == ""){
			alert("비밀번호를 입력하세요");
			mem_pw.focus();
		}else if(mem_pw2.value != mem_pw.value){
			alert("비밀번호가 일치하지 않습니다.");
			mem_pw.focus();
		}else if(mem_pw2.value != mem_pw.value){
			alert("비밀번호가 일치하지 않습니다.");
			mem_pw.focus();
		}else if(mem_name.value == ""){
			alert("이름을 입력해주세요.");
			mem_name.focus();
		}else if(mem_birth.value == ""){
			alert("생년월일을 입력해주세요.");
			mem_birth.focus();
		}else if(mem_email.value == ""){
			alert("e-mail을 입력해주세요.");
			mem_email.focus();
		}else if(mem_phone.value == ""){
			alert("연락처를 입력해주세요.");
			mem_phone.focus();
		}else{
			$.ajax({
				url: "Ajax/signup_ok.do",
				type : "post",
				data : $("#signup_form").serialize(),
				dataType: "text",
				success : function(data) {
					if(data == "y"){
						alert("회원가입을 축하합니다. 500포인트가 적립되었습니다.")
						location.href="login.do";
					}else{
						alert("회원가입이 되지 않았습니다.");
					}						
				},
				error : function() {
					alert("다시 시도해주세요");
				}
			});
		}
	});
}); 


	

</script>
</head>
<body>
	<jsp:include page="../bar/topbar.jsp" flush="false"></jsp:include>
	<jsp:include page="../bar/menubar.jsp" flush="false"></jsp:include>

	<div id="signupj">
		<h1>회원가입</h1>
		<form id="signup_form" method="POST">
			
				<label>아이디 : </label> 
				<input type="text" id="mem_id" name="mem_id"size="10">
				<input type="button" id="idck" name="idck" value="중복확인">
			
			<br>
			<dd>
				<label>비밀번호 : </label> 
				<input type="password" id="mem_pw" name="mem_pw" size="10">
			</dd>
			<br>
			<dd>
				<label>비밀번호 확인: </label> 
				<input type="password" id="mem_pw2" name="mem_pw2" size="10">
			</dd>
			<br>
			<dd>
				<label>이름 : </label> 
				<input type="text" name="mem_name" id="mem_name" size="10">
			</dd>
			<br>
			<dd>
				<label>생년월일 : </label> 
				<input type="text" name="mem_birth" id="mem_birth" placeholder="ex)19910801" size="10">
			</dd>
			<br>
			<dd>
				<div>
					<label> E-mail : </label> <input type="text" name="mem_email" id="mem_email">
				</div>
				<div class="eheck_font" id="email_check"></div>
			</dd>
			<br>
			<dd>
				<label>전화번호 : </label> 
				<input type="text" name="mem_phone" id="mem_phone" placeholder="'-'없이 입력하세요.">
			</dd>
			<br>
			<dd>
				<label>성별 선택</label>
				<p>
				<input type="radio" name="mem_gender" value="남"> 남
				<input type="radio" name="mem_gender" value="여"> 여
				</p>
			</dd>
			<br>
			<dd>
				<input type="button" value="회원가입" id="sign_ok"/>
				<input type="reset" value="초기화"> 
				<input type="button" value="취소" onclick="history.back(-1)">
			</dd>
		</form>
	</div>

	<jsp:include page="../bar/footbar.jsp" flush="false"></jsp:include>
</body>
</html>