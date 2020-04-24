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
#adminpage{
	margin-left: 280px;
	margin-top: 50px;
}
.admin_data li{
	text-align: center;
	list-style-type: none;
	border :  1px solid #ffcccc;
	background-color: #ffe6e6;
	padding : 4px 10px;
}
.admin_th{
	padding : 4px 10px;
	width : 120px;
	border: 1px solid #ffcccc;
	background-color: #ffb3b3;
	color : white;
}
#admin-table{
	
}
</style>
</head>
<body>
	<jsp:include page="../bar/topbar.jsp" flush="false"></jsp:include>
	<jsp:include page="../bar/menubar.jsp" flush="false"></jsp:include>
	<div id="adminpage">
		<table id="admin-table">
			<thead>
				<tr>
					<th class="admin_th">회원 정보 관리</th>
					<th class="admin_th">영화 정보 관리</th>
					<th class="admin_th">이벤트 관리</th>
				</tr>
				<tr>
					<!-- 회원정보관리 -->
					<td>
						<ul class="admin_data">
							<li>회원 정보 관리</li>
							<li>포인트 관리</li>
						</ul>
					</td>
					<!-- 영화 정보 관리 -->
					<td>
						<ul class="admin_data">
							<a href="mvinsert.do"><li>영화 정보 추가</li></a>	
							<li>영화 정보 관리</li>
						</ul>
					</td>
					<!-- 이벤트 관리 -->
					<td>
						<ul class="admin_data">
							<li>이벤트 배너 관리</li>
						</ul>
					</td>
				</tr>
			</thead>
		</table>
	</div>
	<jsp:include page="../bar/footbar.jsp" flush="false"></jsp:include>
</body>
</html>