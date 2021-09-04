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
	$(document).ready(function() {
		//hover 이벤트
		$('nav.navbar .dropdown').on("mouseover", function(e){
			$(this).children('a').attr('aria-expanded', true);
			$(this).children('ul').addClass('show');
			$('li.dropdown-submenu').hover(function(e) {
				$(this).children('a').attr('aria-expanded', true);
				$(this).children('ul').addClass('show');
			}, function(e) {
				$(this).children('a').attr('aria-expanded', false);
				$(this).children('ul').removeClass('show');
			});
		});
		$('nav.navbar .dropdown').on("mouseleave", function(e){
			console.log("빠져나감")
			$(this).children('a').attr('aria-expanded', false);
			$(this).children('ul').removeClass('show');
		});
		//클릭이벤트
		$('li.dropdown-submenu').on("click", function(e) {
			e.preventDefault();
		    e.stopPropagation();
			$(this).children('ul').toggleClass('show');
			$("li.dropdown-submenu ul.dropdown-menu").not($(this).children('ul')).removeClass("show");
		    $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
		      $('li.dropdown-submenu .show').removeClass("show");
		    });
		});
	});
	//툴팁
	$('[data-toggle="tooltip"]').tooltip();   
	
	//sidebar
	$(".city").click(function() {
		var spanArrow = $(this).find(".fa");
		spanArrow.toggleClass("fa-caret-down");
		spanArrow.toggleClass("fa-caret-up");
	});
	
	$('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });
	</script>
