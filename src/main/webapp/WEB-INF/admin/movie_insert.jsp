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
				if (i == 5)
					continue;
				alert(f.elements[i].name + "를 입력하세요");
				f.elements[i].focus();
				return;//수행 중단
			}
		}
		f.action = "mvinsert_ok.do";
		f.submit();
	}
</script>
</head>
<body>
	<jsp:include page="../bar/topbar.jsp" flush="false"></jsp:include>
	<jsp:include page="../bar/menubar.jsp" flush="false"></jsp:include>

	<div>
	
				<form method="post" enctype="multipart/form-data">
					<table width="700">
						<tbody>
							
							<tr class="tr_subject">
								<th class="th_subject">영화명</th>
								<td align="left"><input type="text" name="title"></td>
							</tr>
							<tr class="tr_subject">
								<th class="th_subject">상영시간</th>
								<td align="left"><input type="text" name="running_time"></td>
							</tr>
							<tr class="tr_subject">
								<th class="th_subject">개봉일</th>
								<td align="left"><input type="text" name="open_Date"></td>
							</tr>
							<tr class="tr_subject">                                                                            
								<th class="th_subject">상영등급</th>
								<td align="left"><input type="text" name="grade"></td>
							</tr>
							<tr class="tr_subject">
								<th class="th_subject">썸네일</th>
								<td align="left"><input type="file" name="m_file"></td>
							</tr>
							<tr class="tr_subject">
								<th class="th_subject">줄거리</th>
								<td align="left">
									<textarea rows="10" cols="60" name="story"></textarea>
								</td>
							</tr>
							<tr class="tr_subject">
								<th class="th_subject">평점</th>
								<td align="left"><input type="text" name="rate"></td>
							</tr>
							
							<tr class="tr_subject">
								<td colspan="2">
									<input type="button" value="입력" onclick="sendData(this.form)" /> 
									<input type="button" value="취소" onclick="history.go(-1)"/>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
	
	</div>

	<jsp:include page="../bar/footbar.jsp" flush="false"></jsp:include>
</body>
</html>