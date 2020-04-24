<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin: 0; padding: 0}
#loginj{
	margin-left: 50px;
	margin-top: 80px;
	float: left;
}

</style>
<script type="text/javascript">
	function join_go(f) {
		f.action="signup.do"
		f.submit();
	}
	function login_go(f) {
		f.action="login_ok.do";
		f.submit();
	}
	/* function find_go(f) {
		f.action="find.do";
		f.submit();
	} */
</script>
</head>
<body>
	<jsp:include page="../bar/topbar.jsp" flush="false"></jsp:include>
	<jsp:include page="../bar/menubar.jsp" flush="false"></jsp:include>
	<div id="loginj">
		
		<form method="post">
			<table>
				<thead>
					<tr>
						<th colspan="2"><h2>LogIn</h2></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="mem_id"></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="password" name="mem_pw"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="로그인" onclick="login_go(this.form)" >
							<input type="button" value="회원가입" onclick="join_go(this.form)" >
						</td>
					</tr>
					<!-- <tr>
						<td><input type="button" value="아이디/비밀번호 찾기" onclick="find_go(this.form)"></td>
					</tr> -->
				</tfoot>
			</table>
		</form>
    </div>
    <jsp:include page="../bar/footbar.jsp" flush="false"></jsp:include>
</body>
</html>