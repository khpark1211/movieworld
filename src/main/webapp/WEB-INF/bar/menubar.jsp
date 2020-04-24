<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mb-sidebar {
	width: 200px;
	padding-left: 10px;
	height: 1500px;
	float: left;
	border: 1px solid none;
	background-color: #ffb3b3;
	color: white;
}

#mb-content {
	width: 800px;
	min-height: 1000px;
	float: left;
	margin-left: 90px;
}

#mb-sidebar {
	list-style-type: none;
}

a{
	text-decoration: none;
}

.menu_a:link{
	color: white;
}

.menu_a:visited{
	color: white;
}

.menu_a:hover{
	color: #ccffd9;
}

.menu_a:active{
	color: #ccffd9;
}

h4:link{
	color: white;
}

h4:visited{
	color: white;
}

h4:hover{
	color: #ccffd9;
}

h4:active{
	color: #ccffd9;
}

#topmenu li.active ul{
	display: block;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#topmenu ul ul").hide();
		
		$("#topmenu h4").click(function() {
			$("#topmenu ul ul").slideUp();
			if(!$(this).next().is(":visible")){
				$(this).next().slideDown();
			}
		})
	});
</script>
</head>
<body>
	<div id="mb-container">
		<div id="mb-sidebar">
			<!-- 메뉴 -->
			<nav id="topmenu">
				<ul>
					<li>
					<a class="alink" href="start.do"><h2>Movie World</h2></a>
					<br>
					<h4 class="topMenuLi">영화 ▼</h4>
						<ul class="subMenu">
							<a class="menu_a" href="moviebox.do"><li>박스오피스</li></a>
							<a class="menu_a" href="nowmovie.do"><li>현재 상영작</li></a>
							<a class="menu_a" href="soonmovie.do"><li>상영 예정작</li></a>
						</ul>
					<br>
					<a class="menu_a" href="list.do"><h4 class="topMenuLi">평점 & 리뷰</h4></a>
					<br>
					<h4 class="topMenu">다운로드 ▼</h4>
						<ul class="subMenu">
							<a class="menu_a" href=""><li>이 달의 추천 영화</li></a>
							<a class="menu_a" href=""><li>인기 top 10</li></a>
							<a class="menu_a" href=""><li>시리즈 영화 할인</li></a>
							<a class="menu_a" href=""><li>장르별 영화관</li></a>
						</ul>
					<br>
					<a class="menu_a" href=""><h4 class="topMenuLi">이벤트</h4></a>
					<br>
					<h4 class="topMenuLi">온라인 고객센터 ▼</h4>
						<ul class="subMenu">
							<a class="menu_a" href=""><li>FAQ</li></a>
							<a class="menu_a" href=""><li>1:1 문의하기</li></a>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>