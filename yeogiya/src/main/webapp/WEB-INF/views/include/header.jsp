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
   	</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container-fluid">
	    
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="fa fa-bars"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav">
	        	<li class="nav-item active"><a href="#" class="nav-link">Home</a></li>
	        	<li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Page</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="#">Page 1</a>
                <a class="dropdown-item" href="#">Page 2</a>
                <a class="dropdown-item" href="#">Page 3</a>
                <a class="dropdown-item" href="#">Page 4</a>
              </div>
            </li>
	        	<li class="nav-item"><a href="#" class="nav-link">Work</a></li>
	        	<li class="nav-item"><a href="#" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="#" class="nav-link">Contact</a></li>
	        </ul>
	         <ul class="nav navbar-nav ml-auto">
				<li class="nav-item dropdown ml-md-auto">
				<div class="dropdown">
				<a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
						<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
					</svg>
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
				<li class="nav-item dropdown">
				<div class="dropdown">
				<a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"  id="messagesDropdown">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
					  <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
					</svg>
				<span class="badge badge-counter">3</span>
				</a>
			    <div class="dropdown-menu dropdown-menu-right">
				    <a class="dropdown-item" href="#" style="display:none" id="msgItem">
				    </a>
				    <a class="dropdown-item">새로운 쪽지가 없습니다</a>
				    <hr class="dropdown-divider">
				    <a class="dropdown-item" href="#">쪽지함</a>
			    </div>
			    </div>
				</li>
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
		$('nav .dropdown').hover(function(){
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