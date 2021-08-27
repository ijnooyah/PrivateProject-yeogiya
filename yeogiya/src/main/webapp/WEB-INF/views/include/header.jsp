<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>Header</title>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
	
    <!-- font awsome-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
    <!-- fonts-->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
    <!-- bootstrap css-->
   	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
   	
   	<!-- sweet alert -->
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
   	<!-- navbar -->
   	<link rel="stylesheet" href="${contextPath}/resources/yeogiya/css/navbar.css">
   	<style>
   	* {
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 300;
		/* 굵기 100, 300, 400, 500, 700 */
		font-size: 16px;
		color: #212529;
		margin: 0;
	}
	
	.white_color {
		color:#fff;
	}
	
	.orange_color {
		color:#BF522A;
	}
	
	.orange_background {
		background:#BF522A;
	}
	
	.blue_color {
		color:#3339A6;
	}
	
	.blue_background {
		background:#3339A6;
	}
	
	.pink_color {
		color:#F2C6C2;
	}
	
	.pink_background {
		background:#F2C6C2;
	}
	
	.badge{
		font-size: 8px;
	    font-weight: 500;
	    height: 15px;
	    background: #3339A6;
	    color: #fff;
	    position: absolute;
	    transform: scale(.8);
	    transform-origin: top right;
	    right: .25rem;
	    margin-top: -.25rem;
	}
	.green_color {
		color:#5F7362;
	}
	
	.green_background {
		background:#5F7362;
	}
	
	.img_cover {
		width:2.2rem; 
		height:2.2rem; 
		overflow:hidden;
	}
	
	.profile_img {
		width:2.2rem; 
		height:2.2rem; 
		object-fit:cover;
		border: 1.5px solid #fff;
	}
	
	.dropdown_svg {
	    top: 8;
   		margin-right: 10px;
	}
	
	.navbar .navbar-divider {
	    width: 0;
	    border-right: 1px solid #fff;
	    height: calc(4.375rem - 2rem);
	    margin: auto 1rem;
	}
   	</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container-fluid">
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation"> </button>
	      
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav">
	        	<li class="nav-item active"><a href="#" class="nav-link">Home</a></li>
	        	<li class="nav-item dropdown dropdown_category">
	              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Page</a>
	              <div class="dropdown-menu" aria-labelledby="dropdown04">
	              	<a class="dropdown-item" href="#">Page 1</a>
	                <a class="dropdown-item" href="#">Page 2</a>
	                <a class="dropdown-item" href="#">Page 3</a>
	                <a class="dropdown-item" href="#">Page 4</a>
	             </div>
           		 </li>
	          	 <li class="nav-item"><a href="#" class="nav-link">Contact</a></li>
	        </ul>
	         <ul class="nav navbar-nav ml-auto">
				<li class="nav-item dropdown">
					<div class="dropdown dropdown_svg">
						<a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
							<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="#fff" class="bi bi-bell" viewBox="0 0 16 16" >
							  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
							</svg>
						<span id="newAlertCnt" class="badge badge-pill">3</span>
						</a>
					    <div class="dropdown-menu dropdown-menu-right">
						    <a class="dropdown-item" href="#" style="display:none">
						    </a>
						    <a class="dropdown-item">새로운 알림이 없습니다</a>
						    <hr class="dropdown-divider">
						    <a class="dropdown-item" href="#">알림함</a>
					    </div>
				    </div>
				</li>
				<li class="nav-item dropdown">
					<div class="dropdown dropdown_svg">
						<a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
							<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="#fff" class="bi bi-envelope" viewBox="0 0 16 16">
 								<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z"/>
							</svg>
						<span id="newMsgCnt" class="badge badge-pill">3</span>
						</a>
					    <div class="dropdown-menu dropdown-menu-right">
						    <a class="dropdown-item" href="#" style="display:none">
						    </a>
						    <a class="dropdown-item">새로운 쪽지가 없습니다</a>
						    <hr class="dropdown-divider">
						    <a class="dropdown-item" href="#">쪽지함</a>
					    </div>
				    </div>
				</li>
				<div class="navbar-divider d-none d-sm-block"></div>
				<li class="nav-item dropdown ml-md-auto">
					<div class="dropdown">
						<a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
						<span class="mr-2 d-none d-lg-inline white_color small">윤지</span>
							<img class="rounded-circle profile_img" src="${contextPath}/resources/yeogiya/temp/profile.jpg"/>
						</a>
					    <div class="dropdown-menu dropdown-menu-right">
					      <a class="dropdown-item" href="#">마이페이지</a>
						    <a class="dropdown-item" href="#">쪽지함</a>
						    <a class="dropdown-item" href="#">1:1문의</a>
						    <hr class="dropdown-divider">
						    <a class="dropdown-item" href="#">로그아웃</a>
					    </div>
				    </div>
				</li>
				
				<!-- 로그인 안했을 때 -->
				<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
			</ul>
	      </div>
	    </div>
	  </nav>  
	  
   	<!-- Bootstrap core JS-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
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