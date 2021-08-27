<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>sidebar</title>
   	<style>
	#sidebar {
	    min-width: 15rem;
/* 	    max-width: 270px; */
	    background: #fff;
	    -webkit-transition: all .3s;
	    -o-transition: all .3s;
	    transition: all .3s;
	    position: relative;
	    z-index: 0;
	    /* border-right: 1px solid rgba(0,0,0,.05); */
	    border-radius: .15rem;
	}
	
	.list-unstyled {
	    padding-left: 0;
	    list-style: none;
	}
	
	#sidebar ul li a {
    display: block;
    color: #2e415d;
/*     border-bottom: 1px solid #3339A6; */
	}

.collapse:not(.show) {
    display: none;
}
#sidebar ul li>ul li {
    font-size: 13px;
}
#sidebar ul li>ul li a {
    border-bottom: 1px solid transparent;
    color: #b0b6ce;
    font-weight: 500;
    font-size: 11px;
    padding: 0.5rem 0 0.5rem 4rem;
}

#sidebar ul li>ul li a:focus, 
#sidebar ul li>ul li a:hover, 
#sidebar ul li>ul li a:active, 
#sidebar ul li>ul li a.active {
/* 	background:#F2C6C2; */
	color:#F2C6C2;
}

a[data-toggle=collapse] {
    position: relative;
}

ul li a:hover, ul li a:focus {
	text-decoration: none!important;
    outline: none!important;
}

#sidebar a.district {
	color: #2e415d;
/*     font-size: 1.15rem; */
    font-weight: 600;
}

#sidebar a.district:hover, nav a.district:focus  {
   text-decoration: none!important;
   outline: none!important;
}

#sidebar a.city {
   font-size: 13px;
   font-weight: 600;
   padding: 1rem 0 0 2rem;
}

#sidebar a.city:hover {
	color:#F2C6C2;
}

.category_title {
    text-align: center;
    padding: 1rem;
    border-bottom: 1px solid #f2c6c269;
}
   	</style>
</head>
<body>
	<nav id="sidebar">
		<div class="">
			<div class="category_title">
				<a href="#" class="district">울산</a></div>
			<ul class="list-unstyled components mb-5">
				<li><a href="#pageSubmenu1" data-toggle="collapse"
					aria-expanded="false" class="city">남구</a>
					<ul class="collapse list-unstyled" id="pageSubmenu1">
						<li><a href="#" class="active">전체</a></li>
						<li><a href="#">맛집</a></li>
						<li><a href="#">병원</a></li>
						<li><a href="#">운동</a></li>
						<li><a href="#">기타</a></li>
					</ul></li>
				<li><a href="#pageSubmenu2" data-toggle="collapse"
					aria-expanded="false" class="city">북구</a>
					<ul class="collapse list-unstyled" id="pageSubmenu2">
						<li><a href="#">맛집</a></li>
						<li><a href="#">병원</a></li>
						<li><a href="#">운동</a></li>
						<li><a href="#">기타</a></li>
					</ul></li>
				<li><a href="#pageSubmenu3" data-toggle="collapse"
					aria-expanded="false" class="city">동구</a>
					<ul class="collapse list-unstyled" id="pageSubmenu3">
						<li><a href="#">맛집</a></li>
						<li><a href="#">병원</a></li>
						<li><a href="#">운동</a></li>
						<li><a href="#">기타</a></li>
					</ul></li>
				<li><a href="#pageSubmenu4" data-toggle="collapse"
					aria-expanded="false" class="city">울주군</a>
					<ul class="collapse list-unstyled" id="pageSubmenu4">
						<li><a href="#">맛집</a></li>
						<li><a href="#">병원</a></li>
						<li><a href="#">운동</a></li>
						<li><a href="#">기타</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>

	<script>
	</script>
</body>
</html>