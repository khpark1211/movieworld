<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin: 0; padding: 0}
#view_table {
	width: 700px;
	margin: 0 auto;
	margin-top: 40px;
	border: 1px solid #ffb3b3;
}

.view_th {
	width: 120px;
	text-align: center;
	padding: 4px 10px;
	background-color: #ffe6e6;
	border: 1px solid #ffb3b3;
}

.view_tr {
	text-align: center;
	padding: 4px 10px;
}

.view_td {
	border: 1px solid #ffb3b3;
}
</style>
<script type="text/javascript">
	function list_go(f) {
		f.action = "nowmovie.do";
		f.submit();
	}
	function update_go(f) {
		f.action = "update_mgo.do";
		f.submit();
	}
	function delete_go(f) {
		f.action = "delete_mok.do";
		f.submit();
	}
</script>
</head>
<body>
	<jsp:include page="../bar/topbar.jsp" flush="false"></jsp:include>
	<jsp:include page="../bar/menubar.jsp" flush="false"></jsp:include>
	<div>
		<form method="post">
			<table id="view_table">
				<tbody>
					<tr class="view_tr">
						<th class="view_th">영화 포스터</th>
						<td class="view_td"><c:choose>
								<c:when test="${empty movievo.file_name}">
									<b> 첨부파일 없음 </b>
								</c:when>
								<c:otherwise>
									<img src="<c:url value='resources/upload/mvposter/${movievo.file_name}'/>"
										width="150px">
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr class="view_tr">
						<th class="view_th">영화명</th>
						<td class="view_td">${movievo.title}</td>
					</tr>
					<tr class="view_tr">
						<th class="view_th">평점</th>
						<td class="view_td">${movievo.rate}</td>
					</tr>
					<tr class="view_tr">
						<th class="view_th">상영시간</th>
						<td class="view_td">${movievo.running_time}</td>
					</tr>

					<tr class="view_tr">
						<th class="view_th">개봉일</th>
						<td class="view_td">${movievo.open_Date}</td>
					</tr>
					
					<tr class="view_tr">
						<th class="view_th">줄거리</th>
						<td style="height:250px; text-align: left; padding-left: 30px;" class="view_td"><pre>${movievo.story}</pre></td>
					</tr>

				</tbody>
				<tfoot>
					<c:choose>
						<c:when test="${mvo.mem_name == '운영지기'}">
							<tr>
								<td colspan="2">
								<input type="button" value="목록" onclick="list_go(this.form)" /> 
								<input type="button" value="수정" onclick="update_go(this.form)" /> 
								<input type="button" value="삭제" onclick="delete_go(this.form)" /> 
								<input type="hidden" name="idx" value="${movievo.idx}">
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="2">
								<input type="button" value="목록" onclick="list_go(this.form)" /> 
							</tr>
						</c:otherwise>
					</c:choose>
				</tfoot>
			</table>
		</form>
	</div>
		<jsp:include page="../bar/footbar.jsp" flush="false"></jsp:include>
</body>
</html>