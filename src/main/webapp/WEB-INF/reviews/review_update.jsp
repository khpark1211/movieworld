<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin: 0; padding: 0}
</style>
<script type="text/javascript">
	function sendData(f) {
		f.action="update_ok.do"
		f.submit();
	}
	function list_go(f) {
		f.action="list.do";
		f.submit();
	}
</script>
</head>
<body>
	<jsp:include page="../bar/topbar.jsp" flush="false"></jsp:include>
	<jsp:include page="../bar/menubar.jsp" flush="false"></jsp:include>
	<div>
	<form  method="post" enctype="multipart/form-data">
		<table width="700">
		<tbody>
			<tr>
				<th>작성자</th>
				<td align="left"><input type="text" name="mem_name" value="${bvo.mem_name }"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td align="left"> <input type="text" name="title" value="${bvo.title }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td align="left"><textarea rows="10" cols="60" name="content">${bvo.content }</textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<c:choose>
					<c:when test="${empty bvo.file_name}">
						<td> 
							<h3> 첨부파일없음</h3>
							<input type="file" name="file" />
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<input type="file" name="file" /> ${bvo.file_name}
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정하기" onclick="sendData(this.form)"> 
					<input type="button" value="목록" onclick="list_go(this.form)">
					<input type="hidden" name="cPage" value="${cPage}">
					<input type="hidden" name="idx" value="${bvo.idx}">
					<input type="reset" value="취소" />
				</td>
			</tr>
            </tbody>
		</table>
	</form>
	</div>
		<jsp:include page="../bar/footbar.jsp" flush="false"></jsp:include>
</body>
</html>