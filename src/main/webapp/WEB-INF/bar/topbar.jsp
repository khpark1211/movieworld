<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#mb-header{
	padding: 20px;
	border : 1px solid none;
	background-color: pink;
	color: white;
	height: 150px;
}

#searchicon{
	width:30px;
}

#headertext{
	margin-left: 450px;
	font-size: 30px;
	margin-top:40px;
}

#btn-group{
	float: right;
}

.alink{
	text-decoration: none;
	color: white;
}
.alinks{
	text-decoration: none;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script> 
</head>
<body>
	<div id="mb-header">
		<div>
			<div id="btn-group">
			  <c:choose>
			  	<c:when test="${login=='ok'}">
			  	  <c:if test="${mvo.mem_name == '운영지기'}">
			  	  	${mvo.mem_name}님 환영합니다.
			  	  <a href="logout.do"><input type="button" value="로그아웃"></a> |
			  	  <a href="mypage.do?id=${mvo.mem_id}">마이페이지</a>
			  	  <a href="admin.do?id=${mvo.mem_id}">관리자페이지</a>
			  	  </c:if>
			  	  <c:if test="${mvo.mem_name != '운영지기'}">
			  	  	 ${mvo.mem_name}님 환영합니다.
			  	  <a href="logout.do"><input type="button" value="로그아웃"></a> |
			  	  <a href="mypage.do?id=${mvo.mem_id}">마이페이지</a>
			  	  </c:if>
			  	</c:when>
			  	<c:otherwise>
			  		  <a href="login.do"><input type="button" value="로그인"></a>
			  	</c:otherwise>
		  	  </c:choose>
				<input type="search" placeholder="검색어를 입력해주세요">
				<img id="searchicon" src="resources/iconimg/Search-icon.png">
			</div>
		</div>
	
		<div id="headertext">
			<a class="alink" href="start.do"><h1> Movie World </h1></a>
		</div>
	</div>
</body>
</html>