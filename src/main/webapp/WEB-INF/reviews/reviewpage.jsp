<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

#review_wrap {
	width: 1000px;
	margin: 0 auto;
}

#review_table table {
	border: 1px solid gray;
	border-collapse: collapse;
	margin-bottom: 10px;
}

#review_table table caption {
	font-weight: bold;
	margin-bottom: 10px;
}

.review_number{
	width: 5%;
}

.review_content {
	width: 50%;
}

.writer {
	width: 20%;
}

.reg {
	width: 15%;
}

.hit {
	width: 10%;
}

thead{
	text-align:center;
	border: 1px solid black;
}

td{ text-align: center; border: 1px solid gray;}
</style>
<script type="text/javascript">
	function write_go() {
		location.href="write.do";
	}
</script>
</head>
<body>
	<jsp:include page="../bar/topbar.jsp" flush="false"></jsp:include>
	<jsp:include page="../bar/menubar.jsp" flush="false"></jsp:include>
	<div id="review_wrap" align="center">
		<fieldset>
			<legend>Review</legend>
			<div id="review_table">
				<table>
					<thead>
						<tr>
							<th class="review_number">번호</th>
							<th class="review_content">제목</th>
							<th class="writer">글쓴이</th>
							<th class="reg">날짜</th>
							<th class="hit">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5" style="text-align: center;"> 현재 작성된 리뷰가 없습니다. </td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${list}" varStatus="vs">
								<tr>
									<td>${paging.totalRecord-((paging.nowPage-1)*paging.numPerPage+vs.index)}</td>
									<td><a href="view.do?idx=${k.idx}&cPage=${paging.nowPage}">${k.title}</a></td>
									<td>${k.mem_name}</td>
									<td>${k.regdate.substring(0,10)}</td>
									<td>${k.hit}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot>
			<tr>
				<td colspan="4">
					<!-- 이전 -->
					<c:choose>
						<c:when test="${paging.beginBlock > paging.pagePerBlock }">
							<a href="list.do?cPage=${paging.beginBlock-paging.pagePerBlock}"> 
								<span><img src="resources/images/but_prev.gif"></span> 
							</a>
						</c:when>
						<c:otherwise>
							<img src="resources/images/but_prev.gif">
						</c:otherwise>
					</c:choose>
					<!-- 페이지번호 -->
					<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
						<c:choose>
							<c:when test="${k==paging.nowPage }">
								<font size="4">${k}</font>
							</c:when>
							<c:otherwise>
								<span style="background:#B2CCFF "><a href="list.do?cPage=${k}"><font size="4">${k}</a></font></span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 -->
					<c:choose>
						<c:when test="${paging.endBlock < paging.totalPage }">
							<a href="list.do?cPage=${paging.beginBlock+paging.pagePerBlock}">
								<span>
									<img src="resources/images/but_next.gif">
								</span>
							</a>
						</c:when>
						<c:otherwise>
							<img src="resources/images/but_next.gif">
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<img  src="resources/images/but_write.gif" onclick="write_go()">
				</td>
			</tr>
		</tfoot>
				</table>
			</div>
		</fieldset>
	</div>
    <jsp:include page="../bar/footbar.jsp" flush="false"></jsp:include>
</body>
</html>