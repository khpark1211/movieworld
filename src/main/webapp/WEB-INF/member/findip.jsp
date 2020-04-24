<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0
}

#findip {
	margin: 0 auto;
	margin-top: 40px;
	width: 800px;
}

.findip2 {
	padding: 20px;
}
</style>
<script type="text/javascript">
	$("#findid").click(function() {
		var name = $("#mem_name").val();
		var email = $("#mem_email").val();
		
		$.ajax({
			url : "Ajax/find_id.do",
			type : "get",
			data : $('#findid_form').serialize(),
			datatype : "text",
			success : function(data) {
				if (data != 'false') {
					alert('문의하신 ID는 '+data+'입니다.');
				}else{
					alert("입력하신 내용이 조회되지 않습니다. 다시 확인해주세요");
				}
			},
			error : function() {
				alert("오류 발생");
			}
		});
	})
</script>
</head>
<body>
	<jsp:include page="../bar/topbar.jsp" flush="false"></jsp:include>
	<jsp:include page="../bar/menubar.jsp" flush="false"></jsp:include>
	<div>
		<form id="findid_form" method="post">
			<fieldset class="findip2">
				<legend>아이디 찾기</legend>
				<table>
					<tr>
						<td>
							<label>이름 : </label> 
							<input type="text" name="find_name" id="find_name" placeholder="이름을 입력하세요">
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<label> E-mail : </label> 
								<input type="text" name="find_email" id="find_email" placeholder="email을 입력하세요">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="확인" id="findid">
						</td>
					</tr>
				</table>
			</fieldset>
			</form>
			<br> <br> <br> <br>
			<form id="findpw_form" method="post">
			<fieldset class="findip2">
				<legend>비밀번호 찾기</legend>
				<table>
					<tr>
						<td>
							<label>아이디 : </label> 
							<input type="text" id="find_id" name="find_id" placeholder="아이디를 입력하세요">
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<label> E-mail : </label> 
								<input type="text" name="mem_email" id="mem_email" placeholder="email을 입력하세요">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="확인" id="findpw">
						</td>
					</tr>
				</table>
			</fieldset>

		</form>
	</div>
	<jsp:include page="../bar/footbar.jsp" flush="false"></jsp:include>
</body>
</html>