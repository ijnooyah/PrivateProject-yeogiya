<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<!-- <script> -->
	<!-- Bootstrap core JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	
	<!-- sweetAlert -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<!-- summernote-->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
	
	<!-- tagit -->
	<script src="https://cdn.jsdelivr.net/npm/tag-it@2.0.0/js/tag-it.min.js"></script>
	
	<script>
	//navbar
	$(document).ready(function() {
		//hover 이벤트
		$('nav.navbar .dropdown').on("mouseover", function(e){
			$(this).children('a').attr('aria-expanded', true);
			$(this).children('ul').addClass('show');
			$('li.dropdown-submenu').hover(function(e) {
				$(this).children('a').attr('aria-expanded', true);
				$(this).children('a').addClass('active');
				$(this).children('ul').addClass('show');
			}, function(e) {
				$(this).children('a').attr('aria-expanded', false);
				$(this).children('a').removeClass('active');
				$(this).children('ul').removeClass('show');
			});
		});
		$('nav.navbar .dropdown').on("mouseleave", function(e){
			console.log("빠져나감")
			$(this).children('a').attr('aria-expanded', false);
			$(this).children('ul').removeClass('show');
		});
		//클릭이벤트
		$('li.dropdown-submenu [data-toggle=dropdown]').on("click", function(e) {
			console.log("클릭")
			location.href=$(this).attr("href");
// 		    e.stopPropagation();
// 			$(this).children('a').toggleClass('active');
// 			$(this).children('ul').toggleClass('show');
// 			$("li.dropdown-submenu > a").not($(this).children('a')).removeClass("active");
// 			$("li.dropdown-submenu > ul").not($(this).children('ul')).removeClass("show");
// 		    $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
// 		      $('li.dropdown-submenu .show').removeClass("show");
// 		    });
		});
	});
	//툴팁
	$('[data-toggle="tooltip"]').tooltip();   
	
	//sidebar
	$('[data-toggle=collapse]').on('click', function(e) {
// 		e.stopPropagation(); // 이벤트 전파막기
		console.log("클릭")
		if($(this).attr('aria-expanded') == 'false') {
			$(this).attr('aria-expanded', true);
		} else {
			$(this).attr('aria-expanded', false);
		}
		$(this).siblings('ul').collapse('toggle'); 
	});
	
	$('[data-toggle=collapse] a').on('click', function(e) {
		e.stopPropagation(); // 이벤트 전파막기
	});
	
	//data-setbg
	$('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });
	
	//로그인 필수버튼들
	var login_id = "${sessionScope.loginMember.user_id}"; // 로그인한사람 id
	if(login_id == '') {
		$(".container").on("click", ".loginNeed", function(e) {
			e.preventDefault();
			Swal.fire({
				title: '로그인 필수',
				text: '로그인 하시겠습니까?', 
				allowOutsideClick: false,
// 				iconColor: "#1f5e43",
				icon: 'error', 
				confirmButtonText: "확인",
// 				confirmButtonColor: "#1f5e43",
				cancelButtonText: "취소",
				showCancelButton: true,
			}).then(function(result) {
				if(result.isConfirmed) {
					location.href = "${memberPath}/login";
				} 
			});
			return false;
		});
	} else {
		$('#like').on('click', function() {
			var url = "${localPath}/like?board_no=${board.board_no}";
			$.get(url, function(rData) {
				console.log(rData);
//	 			let spanLike = document.querySelector('#like')
				if (rData == "like") {
//	 				spanLike.classList.replace('fa-heart-o', 'fa-heart');
					$('#like').css('color', 'var(--danger)');
					$('#like').switchClass('fa-heart-o', 'fa-heart');
					$(".like_cnt").text(Number($("#like_cnt").text()) + 1);
				} else {
					$('#like').css('color', 'var(--gray)');
					$('#like').switchClass('fa-heart', 'fa-heart-o');
					$(".like_cnt").text(Number($("#like_cnt").text()) - 1);
				}
			});
		})
		
		$('#bookmark').on('click', function() {
			var url = "${localPath}/bookmark?board_no=${board.board_no}";
			$.get(url, function(rData) {
				console.log(rData);
				console.log($('#bookmark').find('path'));
				$('#bookmark > .bi-bookmark').toggleClass('d-none');
				$('#bookmark > .bi-bookmark-fill').toggleClass('d-none');
			});
		})
	}
	</script>
	