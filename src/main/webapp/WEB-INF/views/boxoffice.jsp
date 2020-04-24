<%@page import="java.util.HashMap"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
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
$(function() {
	$("#result").empty(); // 초기화
	$.ajax({
		url: "Ajax/movieboxOffice.do",
		method : "post",
		dataType : "json",
		success : function(data) {
			var table = "<table>";
			table += "<thead><tr><th>진입</th><th>순위</th><th>영화명</th><th>개봉일</th><th>관객수</th><th>누적관객수</th></tr></thead>";
			table += "<tbody>";
			$.each(data, function(k,v) {
				table += "<tr>";
					var k1 = v['dailyBoxOfficeList']; // 존재하는 data value 중에서 row 찾기
					$.each(k1, function(k,v) {
						table += "<tr>";
							table += "<td>"+v["rankOldAndNew"]+"</td>";	
							table += "<td>"+v["rank"]+"</td>";
							table += "<td>"+v["movieNm"]+"</td>";
							table += "<td>"+v["openDt"]+"</td>";								
							table += "<td>"+v["audiCnt"]+"</td>";		
							table += "<td>"+v["audiAcc"]+"</td>";								
						table += "</tr>";
					});
				table += "</tr>";
			});
			table +="</tbody></table>";
			$("#result").append(table);
		},
		error : function() {
			alert("읽기실패");
		}
	});
});
</script>
</head>
<body>
	<jsp:include page="../bar/topbar.jsp" flush="false"></jsp:include>
	<jsp:include page="../bar/menubar.jsp" flush="false"></jsp:include>
	<div id="result"></div>
	<jsp:include page="../bar/footbar.jsp" flush="false"></jsp:include>
</body>
</html>