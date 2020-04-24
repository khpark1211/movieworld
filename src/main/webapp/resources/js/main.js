$(function(){
	
	$('.tab_slide').bxSlider({
		minSlides:1,
		maxSlides:4,
		moveSlides : 2,
		slideWidth:150,
		slideMargin:30,
		pager:false
	});

	$('.slide_tap').tabs();

	$(function(){
		$('#tabs-1').click(function() {
			$('#tabs-1').reloadSlider();
		});
		$('#tabs-2').click(function() {
			$('#tabs-2').reloadSlider();
		});
		$('#tabs-3').click(function() {
			$('#tabs-3').reloadSlider();
		});	
	});
/*
	$('.video_slide').bxSlider({
		video : true,
		minSlides:1,
		maxSlides:4,
		moveSlides : 2,
		slideWidth:150,
		slideMargin:30,
		pager:false,
		onSliderLoad:function(currentIndex){
			$('video_slide div').eq(currentIndex + 1).find('video').get(0).play();
		},
		onSlideAfter:function($slideElement){
			$slideElement.siblings().find('video').get(0).stop();
			$slideElement.find('video').get(0).play();
		}
	});*/
});//document ready jquery 