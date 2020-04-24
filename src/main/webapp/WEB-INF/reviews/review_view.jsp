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
		f.action = "list.do";
		f.submit();
	}
	function update_go(f) {
		f.action = "update_go.do";
		f.submit();
	}
	function delete_go(f) {
		f.action = "delete_ok.do";
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
						<th class="view_th">제목</th>
						<td class="view_td">${bvo.title }</td>
					</tr>

					<tr class="view_tr">
						<th class="view_th">글쓴이</th>
						<td class="view_td">${mvo.mem_name}</td>
					</tr>

					<tr class="view_tr">
						<th class="view_th">작성일</th>
						<td class="view_td">${bvo.regdate}</td>
					</tr>
					<tr class="view_tr">
						<th class="view_th">첨부파일</th>
						<td class="view_td"><c:choose>
								<c:when test="${empty bvo.file_name}">
									<b> 첨부파일 없음 </b>
								</c:when>
								<c:otherwise>
									<img src="<c:url value='resources/upload/${bvo.file_name}'/>"
										width="150px">
									<br>
									<a href="download.do?file_name=${bvo.file_name}">
										${bvo.file_name}</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr class="view_tr">
						<th class="view_th">내용</th>
						<td style="height:250px; text-align: left; padding-left: 30px;" class="view_td"><pre>${bvo.content}</pre></td>
					</tr>

				</tbody>
				<tfoot>
					<c:choose>
						<c:when test="${mvo.mem_name == bvo.mem_name}">
							<tr>
								<td colspan="2">
								<input type="button" value="목록" onclick="list_go(this.form)" /> 
								<input type="button" value="수정" onclick="update_go(this.form)" /> 
								<input type="button" value="삭제" onclick="delete_go(this.form)" /> 
								<input type="hidden" value="${cPage}" name="cPage" /></td>
								<input type="hidden" name="idx" value="${bvo.idx}">
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="2">
								<input type="button" value="목록" onclick="list_go(this.form)" /> 
								<input type="hidden" value="${cPage}" name="cPage" /></td>
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