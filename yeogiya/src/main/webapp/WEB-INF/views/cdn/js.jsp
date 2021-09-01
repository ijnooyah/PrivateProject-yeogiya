<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<!-- <script> -->
	<!-- Bootstrap core JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	
	<!-- summernote-->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
	
	<script>
	//navbar
	(function($) {
		$('nav .dropdown-category').hover(function(){
			var $this = $(this);
			$(this).addClass('show');
			$(this).find('> a').attr('aria-expanded', true);
			$(this).find('.dropdown-menu').addClass('show');
		}, function(){
			$(this).removeClass('show');
			$(this).find('> a').attr('aria-expanded', false);
			$(this).find('.dropdown-menu').removeClass('show');
		});
	})(jQuery);
	
	//툴팁
	$('[data-toggle="tooltip"]').tooltip();   
	
	//sidebar
	$(".city").click(function() {
		var spanArrow = $(this).find(".fa");
		spanArrow.toggleClass("fa-caret-down");
		spanArrow.toggleClass("fa-caret-up");
	});
	</script>
