<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin: 0; padding: 0}
	img{border: none; vertical-align: top;}
	li img{width: 150px;}
	.imgslide {list-style: none; float: left; width: 200px;}

</style>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

	<script src="resources/js/all.min.js"></script>
	<script src="resources/js/jquery.fitvids.js"></script>
	<script src="resources/js/main.js"></script>
</head>
<body>
	<br>
	<div class="slide_tap">
		 <ul>
		 	<li><a href="#tabs-1">현재 상영작</a></li>
		 	<li><a href="#tabs-2">상영 예정작</a></li>
		 	<li><a href="#tabs-3">다운로드</a></li>
		 </ul>
		 <div id="tabs-1">
	 		<ul class="tab_slide">
		     	<li class="imgslide"><a href="#"><img src="resources/postimages/abouttime.jpeg"></a></li>
				<li class="imgslide"><a href="#"><img src="resources/postimages/aria.jpeg"></a></li>
				<li class="imgslide"><a href="#"><img src="resources/postimages/beginagin.jpeg"></a></li>
				<li class="imgslide"><a href="#"><img src="resources/postimages/money.jpeg"></a></li>
		 	 </ul>
		 </div>
		 <div id="tabs-2">
	 		<ul class="tab_slide">
		     	<li class="imgslide"><a href="#"><img src="resources/postimages/beautyandthebeast.jpeg"></a></li>
				<li class="imgslide"><a href="#"><img src="resources/postimages/review.jpeg"></a></li>
				<li class="imgslide"><a href="#"><img src="resources/postimages/insiders.jpeg"></a></li>
				<li class="imgslide"><a href="#"><img src="resources/postimages/robber.jpeg"></a></li>
		 	 </ul>
		 </div>
		 <div id="tabs-3">
	 		<ul class="tab_slide">
		     	<li class="imgslide"><a href="#"><img src="resources/postimages/monsterhotel2.jpeg"></a></li>
				<li class="imgslide"><a href="#"><img src="resources/postimages/zootopia.jpeg"></a></li>
				<li class="imgslide"><a href="#"><img src="resources/postimages/sunny.jpeg"></a></li>
				<li class="imgslide"><a href="#"><img src="resources/postimages/thelittleprince.jpeg"></a></li>
		 	 </ul>
		 </div>
		</div>
</body>
</html>