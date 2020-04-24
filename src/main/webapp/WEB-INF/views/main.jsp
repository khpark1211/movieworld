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

</script>
</head>
<body>
	<jsp:include page="../bar/topbar.jsp" flush="false"></jsp:include>
	<jsp:include page="../bar/menubar.jsp" flush="false"></jsp:include>
	
	<div id="mb-content">
	<!-- 이미지 슬라이드 -->
	<jsp:include page="../content/imgslide.jsp" flush="false"></jsp:include>
	<br><br>
	<!-- 영화 목록 슬라이드 -->
	<jsp:include page="../content/movieslide.jsp" flush="false"></jsp:include>	

	<br><br>
	</div>
	<jsp:include page="../bar/footbar.jsp" flush="false"></jsp:include>
</body>
</html>