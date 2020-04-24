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

.tr_subject {
	text-align: center;
	padding: 4px 10px;
}

.th_subject {
	width: 120px;
	text-align: center;
	padding: 4px 10px;
}
</style>
<script type="text/javascript">
	function sendData(f) {
		for (var i = 0; i < f.elements.length; i++) {
			if (f.elements[i].value == "") {
				if (i == 2)
					continue;
				alert(f.elements[i].name + "를 입력하세요");
				f.elements[i].focus();
				return;//수행 중단
			}
		}
		f.action = "write_ok.do";
		f.submit();
	}
</script>
</head>
<body>
	<jsp:include page="../bar/topbar.jsp" flush="false"></jsp:include>
	<jsp:include page="../bar/menubar.jsp" flush="false"></jsp:include>

	<div>
		<c:choose>
			<c:when test="${login=='ok'}">
				<form method="post" enctype="multipart/form-data">
					<table width="700">
						<tbody>
							<tr class="tr_subject">
								<th class="th_subject">작성자</th>
								<td align="left">${mvo.mem_name}</td>
							</tr>
							<tr class="tr_subject">
								<th class="th_subject">제목</th>
								<td align="left"><input type="text" name="title"></td>
							</tr>
							<tr class="tr_subject">
								<th class="th_subject">내용</th>
								<td align="left"><textarea rows="10" cols="60"
										name="content"></textarea></td>
							</tr>
							<tr class="tr_subject">
								<th class="th_subject">첨부파일</th>
								<td align="left"><input type="file" name="file"></td>
							</tr>
							<input type="hidden" name="mem_name" value="${mvo.mem_name}">
							<tr class="tr_subject">
								<td colspan="2">
									<input type="button" value="입력" onclick="sendData(this.form)" /> 
									<input type="button" value="취소" onclick="history.go(-1)"/>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</c:when>
			<c:otherwise>
				<script>
					alert("로그인 후 이용해주세요.");
					history.go(-1);
				</script>
			</c:otherwise>
		</c:choose>
	</div>

	<jsp:include page="../bar/footbar.jsp" flush="false"></jsp:include>
</body>
</html>