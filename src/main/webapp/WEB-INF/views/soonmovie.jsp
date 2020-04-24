<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
table{width: 80%}
	table, th, td { border: 1px solid red; text-align: center;}
</style>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="../bar/topbar.jsp" flush="false"></jsp:include>
	<jsp:include page="../bar/menubar.jsp" flush="false"></jsp:include>
	<div>
		<table>
			<thead>
				<tr>
					<th>poster</th>
					<th>영화명</th>
					<th>평점</th>
					<th>상영시간</th>
					<th>개봉일</th>
					<th>관람등급</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty mvlist2}">
						<tr>
							<td colspan="8" style="text-align: center;">현재 영화가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${mvlist2}" varStatus="vs">
							<tr>
								<td>
									<c:choose>
										<c:when test="${empty k.file_name}">
											<b> 첨부파일 없음 </b>
										</c:when>
										<c:otherwise>
											<img src="<c:url value='resources/upload/mvposter/${k.file_name}'/>"
												width="180px">
										</c:otherwise>
									</c:choose>
								</td>
								<td><a href="soonview.do?idx=${k.idx}">${k.title}</a></td>
								<td>${k.rate}</td>
								<td>${k.running_time}</td>
								<td>${k.open_Date}</td>
								<td>${k.grade}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			
		</table>
	</div>
	<jsp:include page="../bar/footbar.jsp" flush="false"></jsp:include>
</body>
</html>