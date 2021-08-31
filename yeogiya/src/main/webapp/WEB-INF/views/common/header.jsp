<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<nav class="navbar navbar-expand-lg my-navbar" id="my-navbar">
	    <div class="container-fluid">
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation"> </button>
	      
	      <div class="collapse navbar-collapse">
	        <ul class="navbar-nav">
	        	<li class="nav-item active"><a href="#" class="nav-link">메인</a></li>
	        	<li class="nav-item dropdown dropdown-category">
	              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">지역</a>
	              <div class="dropdown-menu" aria-labelledby="dropdown04">
	              	<a class="dropdown-item" href="#">Page 1</a>
	                <a class="dropdown-item" href="#">Page 2</a>
	                <a class="dropdown-item" href="#">Page 3</a>
	                <a class="dropdown-item" href="#">Page 4</a>
	             </div>
           		 </li>
	          	 <li class="nav-item"><a href="#" class="nav-link">고객센터</a></li>
	        </ul>
	         <ul class="nav navbar-nav ml-auto">
				<li class="nav-item dropdown">
					<div class="dropdown dropdown-svg">
						<a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
							<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="#979b9f" class="bi bi-bell" viewBox="0 0 16 16" >
							  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
							</svg>
						<span id="newAlertCnt" class="badge badge-pill badge-alert">3</span>
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
					<div class="dropdown dropdown-svg">
						<a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
							<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="#979b9f" class="bi bi-envelope" viewBox="0 0 16 16">
 								<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z"/>
							</svg>
						<span id="newMsgCnt" class="badge badge-pill badge-alert">3</span>
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
							<span class="mr-2 d-none d-lg-inline nickname">윤지</span>
							<img class="rounded-circle profile-img" src="${contextPath}/resources/image/profile.jpg"/>
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
<!-- 				<li class="nav-item"><a class="nav-link" href="#">로그인</a></li> -->
			</ul>
	      </div>
	    </div>
	  </nav>  
