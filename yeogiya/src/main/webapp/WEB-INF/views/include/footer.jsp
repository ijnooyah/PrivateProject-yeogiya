<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<!-- Footer -->
	<div class="py-5 footer container-fluid text-center">
		   Copyright &copy;2021 Created By yoonji
	</div>
	<!-- Bootstrap core JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	<!-- summernote-->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
	<script>
	(function($) {
		$('nav .dropdown_category').hover(function(){
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
	</script>
</body>
</html>