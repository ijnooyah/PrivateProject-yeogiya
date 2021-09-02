<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<%@ include file="../cdn/css.jsp" %>
	<title>boardView</title>
	<style>
	@media (min-width: 1200px) {
	.container, .container-lg, .container-md, .container-sm, .container-xl {
	    max-width: 1100px !important;
		}
	}
	.card {
		border: 1px solid var(--grayEF);
		box-sizing: border-box;
		border-radius: 0.13rem;
		width:845px;
	}
	
	/* 지역바 */
	.district_wrap a, .district_wrap span {
		color:var(--black);
		font-weight:500;
		font-size: .95rem;
	}
	.district_wrap span{
		font-weight:300;
		font-size: .9rem;
	}
	.district_wrap a:hover, .district_wrap a:focus, .district_wrap a:active, .district_wrap a.active {
	    color: var(--pink);
	    font-weight:600;
	    text-decoration: none;
	}
	/* 	검색창 */
	.search_wrap .form-control, .search_wrap .btn {
 		height: 30px; 
	    font-size: .75rem; 
	}
	.search_wrap input {
 		width: 220px !important; 
	}
	/* 	탭 */
	.nav-tabs {
	    border-bottom: 1px solid var(--pink) !important;
	}
	.nav-tabs .nav-link:focus, .nav-tabs .nav-link:hover {
	    border-color: var(--pink30) var(--pink30) var(--pink30) !important;
	}
	.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	    color: var(--pink) !important;
	    border-color: var(--pink) var(--pink) var(--white) !important;
	}
	a.nav-link {
	    color: var(--black);
	    font-size: 0.8rem;
	    font-weight: 500;
	}
	a.nav-link:hover {
	    color: var(--pink);
	}
	/* 글쓰기버튼 */
	a.btn.btn-pink-outline.ml-auto {
		transform: scale(.7);
		font-weight:500;
	}
	/*테이블*/
	.list_wrap {
	    font-size: 0.8rem;
	}
	.list_wrap table td, .list_wrap table th {
    	padding: .4rem 0 .4rem 0 !important;
	}
	.list_wrap table {
		border-collapse: unset;
		border-spacing: 0px;
	}
	.list_wrap table a{
		color: var(--black);
	    text-decoration: none;
	    background-color: transparent;
	}
	.list_wrap table a:hover, .list_wrap table a:active, .list_wrap table a:focus {
		color: var(--pink);
	    text-decoration: none;
	    background-color: transparent;
	}
	/* 	thead */
	.list_wrap table th {
		text-align: center;
		vertical-align: middle;
		font-weight: 500;
		border-top: 1px solid #bcbcbc !important;
   		border-bottom: 1px solid #e1e1e1 !important;
	}
	/* 	tbody */
	.list_wrap tbody tr:hover {
	    background-color: var(--whiteGray) !important;
	}
	.list_wrap table td {
		font-weight: 300;
		font-size: .75rem;
		border-top:unset !important;
		border-bottom: 0.5px solid var(--grayEF) !important;
	}
	.list_wrap table td:not(.td_title) {
		text-align: center;
	}
	.list_wrap table td.td_title {
    	padding-left: 0.4rem !important;
	}
	.list_wrap table .td_writer a {
		color:var(--gray) !important;
		font-size:0.7rem;
	}
	.list_wrap table .td_writer a:hover, .list_wrap table .td_writer a:active, .list_wrap table .td_writer a:focus {
		color:var(--gray) !important;
		text-decoration: underline;
	}
	.list_wrap table .td_title a:hover, .list_wrap table .td_title a:active, .list_wrap table .td_title a:focus {
		color:var(--black) !important;
		text-decoration: underline;
	}
	/* 넓이설정 */
	.list_wrap table .td_no{width:50px}.list_wrap table .td_district{width:55px}.list_wrap table .td_city{width:55px}.list_wrap table .td_sort{width:55px}.list_wrap table .td_writer{width:100px;}.list_wrap table .td_date{width:55px}.list_wrap table .td_like{width:50px}.list_wrap table .td_view{width:50px}	
	.list_wrap table .td_no:not(.td_notice), 
	.list_wrap table .td_date, 
	.list_wrap table .td_like, 
	.list_wrap table .td_view {
		font-size:0.65rem !important;
	    line-height: 1.7 !important;
		color:var(--gray) !important;
	}
	/* pagination */
	.pagination-sm .page-link {
	    padding: .2rem .5rem;
	    font-size: .75rem;
	    line-height: 1.5;
	}
	.pagination .page-item {
    	margin-left: .45rem;
	}
	.pagination .page-item:first-child .page-link,
	.pagination .page-item:last-child .page-link {
	    border: none;
	}
	.pagination .page-item:first-child .page-link:hover,
	.pagination .page-item:last-child .page-link:hover {
	    background:none !important;
	}
	
	.pagination .page-item .page-link {
	    border-radius: 3px;
	}
	.page-item.active .page-link {
	    background-color: var(--pink) !important;
	    border-color: var(--pink) !important;
	}
	.page-link:focus {
	    box-shadow: none !important;
	}
	.page-link:hover {
	    color: var(--white) !important;
	    text-decoration: none;
	    background: var(--pink) !important;
	    border-color: var(--pink) !important;
	}
	.pagination .page-link, .pagination .page-link > svg, .pagination .page-link:hover > svg  {
	    color: var(--black);
	}
	
/* 	카카오 */
	.customoverlay {position:relative;bottom:55px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
	.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;overflow:hidden;background: var(--pink);background: var(--pink) url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:500;}
	.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	
/* 	상세보기 */
.content-top a:hover {
	color:unset;
}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container d-md-flex my-4">
		<jsp:include page="./sidebar.jsp" flush="false"/>
		<div class="row card ml-auto">
			<!-- 탑 -->
			<jsp:include page="./top.jsp" flush="false"/>
			<!-- 상세보기 -->
			<div class="col-md-12 px-5 pb-5" style="flex:none;">
				<!-- 글정보 -->
				<div class="row mb-2 content-top">
					<div class="d-flex w-100 h5">
						<span class="text-muted mr-2">맛집</span>
						<span>여기 브라우니 진짜 맛있어요!!</span>
						<!-- 수정 삭제 버튼 -->
						<svg class="bi bi-three-dots-vertical cursor-pointer ml-auto" data-toggle="dropdown" width="1.1rem" height="1.1rem" fill="var(--gray)" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
							<path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
						</svg>
						<div class="dropdown-menu dropdown-menu-right" style="min-width:4rem; font-size:0.8rem;">
							 <a class="dropdown-item" href="">수정</a> 
							 <a class="dropdown-item" href="">삭제</a>
						</div>
					</div>
					<div class="d-flex w-100 font-size-085 mt-1">
						<div class="d-flex">
							<div class="profile-img d-table-cell mr-2" 
								 style="background: url(${contextPath}/resources/image/profile.jpg);
								  width:30px; height:30px;"></div>
							<div class="d-table-cell mr-2">
								<a href="" class="align-middle text-black">미미</a>
							</div>
							<div class="d-table-cell mr-2">
								<span class="align-middle text-muted" >21.09.02 00:38</span> 
							</div>
							<div class="d-table-cell">
								<span class="align-middle text-muted">조회 2769</span> 
							</div>
						</div>
						<div class="ml-auto">
							<a href="" class="text-muted">URL 복사</a>
						</div>
					</div>
				</div>
				<!-- 글내용 -->
				<div class="row my-4 px-3 content-middle">
					<div class="content_wrap w-100">
					</div>
					<div class="map_wrap w-100 mt-2">
						<div id="map" class="rounded-sm border" style="width:100%;height:350px;"></div>
					</div>
				</div>
				<!-- 글버튼 -->
				<div class="row mb-2 content-bottom text-muted">
					<span class="fa fa-heart-o mr-1 cursor-pointer" style="line-height: 1.5;"></span>
					<span class="mr-2" id="like_cnt">0</span>  
					<span class="fa fa-comment-o ml-2 mr-1 cursor-pointer" style="line-height: 1.4;"></span>
					<span id="cmt_cnt">30</span> 
					<a href="" class="text-muted ml-auto font-size-090">신고</a>
				</div>
			</div>
			<!-- 상세보기 댓글 -->
			<div class="row">
				<div class="col-md-12">
					<jsp:include page="./comment.jsp" flush="false"/>
				</div>
			</div>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs mt-5 mx-4">
			  <li class="nav-item">
			    <a class="nav-link active" data-toggle="tab" href="#all">전체</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu1">맛집</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu2">병원</a>
			  </li>
			  <a href="" class="btn btn-pink-outline ml-auto">글쓰기</a>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content px-4">
				<div id="all" class="tab-pane fade show active px-3">
					<br>
					<jsp:include page="./list.jsp" flush="false"/>
				</div>
				<div id="menu1" class="tab-pane fade">
					<br>
					<jsp:include page="./list.jsp" flush="false"/>
				</div>
				<div id="menu2" class="tab-pane fade">
					<br>
					<jsp:include page="./list.jsp" flush="false"/>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
	        var imageSrc = '${contextPath}/resources/image/marker.png', // 마커이미지의 주소입니다    
		        imageSize = new kakao.maps.Size(29, 42), // 마커이미지의 크기입니다
		        imageOption = {offset: new kakao.maps.Point(14, 39)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
		    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	
		    // 결과값으로 받은 위치를 마커로 표시합니다
		    var marker = new kakao.maps.Marker({
		    	map:map,
		      	position: coords,
		      	image: markerImage // 마커이미지 설정 
		    });
	        
	    	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	        var content = '<div class="customoverlay">' +
	            '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
	            '    <span class="title">장소명</span>' +
	            '  </a>' +
	            '</div>';

	        // 커스텀 오버레이를 생성합니다
	        var customOverlay = new kakao.maps.CustomOverlay({
	            map: map,
	            position: coords,
	            content: content,
	            yAnchor: 1 
	        });
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});   
	</script>
</body>
</html>