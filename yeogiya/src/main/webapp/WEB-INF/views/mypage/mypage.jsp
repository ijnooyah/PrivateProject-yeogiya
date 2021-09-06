<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../cdn/css.jsp" %>
<title>mypage</title>
	<style>
	@media (min-width: 1200px) {
	.mypage-container.container {
	    max-width: 900px !important;
		}
	}
	
	
	/* 	체크박스 사이즈 */
	.mypage-container .custom-checkbox .custom-control-label::before {
		width:.8rem;
		height:.8rem;
	}
	.mypage-container .custom-checkbox .custom-control-label::after {
		width:.8rem;
		height:.8rem;
	}
	
	.mypage-container .custom-control {
		min-height:unset;
		padding-left: 0;
	}
	
	.mypage-container .custom-control label {
   		margin-bottom: 0;
	}
	
	.mypage-container .dropdown-toggle {
		border-radius: 0;
		font-size: .75rem;
	}
	.mypage-container .dropdown-menu {
		min-width: 4.2rem;
		margin-top: -1px;
	}
	
	.mypage-container .dropdown-item {
		padding: .25rem 0;
    	text-align: center;
	}
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container mypage-container my-4">
		<div class="mypage_top row mb-5 mx-4">
				<div class="mypage_top_left">
					<div class="set-bg rounded-circle border" 
						 data-setbg="${contextPath}/resources/image/profile.jpg"
						 style="width:80px; height:80px;"></div>
				</div>
				<div class="mypage_top_right ml-4">
					<div class="font-size-105 mb-1">
						<span class="font-weight-500">윤지</span>
						<a href="" class="fa fa-cog text-muted" style="text-decoration:none;"></a>						
					</div>
					<div class="font-size-090 mb-1">
						<span class="text-muted">지역 </span><span class="text-pink mr-3">울산</span>
						<span class="mr-3 text-muted">총 게시물 <span class="text-pink">100</span>개</span>
						<span class="text-muted">총 댓글 <span class="text-pink">200</span>개</span>
					</div>
					<div class="font-size-090">
						<span class="mr-2 text-muted">자기소개</span>
						<div>
						맛집찾아 삼만리
						</div>
					</div>
				</div>
		</div>
		<div class="mypage_middle">
			<!-- Nav tabs -->
				<ul class="nav nav-tabs mt-3 mx-4">
				  <li class="nav-item">
				    <a class="nav-link active" data-toggle="tab" href="#all">작성한 글</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" data-toggle="tab" href="#menu1">작성한 댓글</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" data-toggle="tab" href="#menu2">북마크한 게시글</a>
				  </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content px-4">
					<div id="all" class="px-3 tab-pane fade show active">
						<br>
						<jsp:include page="./boardTable.jsp" flush="false"/>
					</div>
					<div id="menu1" class="px-3 tab-pane fade">
						<br>
						<jsp:include page="./commentTable.jsp" flush="false"/>
					</div>
					<div id="menu2" class="px-3 tab-pane fade">
						<br>
						<jsp:include page="./boardTable.jsp" flush="false"/>
					</div>
				</div>
		</div>
	</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
<%@ include file="../cdn/js.jsp" %>
	<script>
	</script>
</body>
</html>