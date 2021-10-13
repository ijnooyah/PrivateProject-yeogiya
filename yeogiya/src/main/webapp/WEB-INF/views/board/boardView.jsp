<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<%@ include file="../cdn/css.jsp" %>
	<title>boardView</title>
	<style>
	@media (min-width: 1200px) {
	.board-container.container {
	    max-width: 1100px !important;
		}
	}
	.board-container .card {
		border: 1px solid var(--grayEF);
		box-sizing: border-box;
		border-radius: 0.13rem;
		width:845px;
	}
	
	/* 	상세보기 */
	.board-container .content-info a:hover {
		color:unset;
	}
	/* 	카카오 */
	.board-container .customoverlay {position:relative;bottom:55px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
	.board-container .customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.board-container .customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;overflow:hidden;background: var(--pink);background: var(--pink) url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.board-container .customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:500;}
	.board-container .customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	
	a.text-pink:hover {
		text-decoration:none;
		color:var(--pink);
	}
	
	.content-info {
   	border-bottom: 1px solid var(--grayE1);
    padding-bottom: .7rem;
	}
	
	.content-top a.sort_board::after{
	background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDQ1MS44NDcgNDUxLjg0NiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMiIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgY2xhc3M9IiI+PGc+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cgk8cGF0aCBkPSJNMjQ4LjI5MiwxMDYuNDA2bDE5NC4yODEsMTk0LjI5YzEyLjM2NSwxMi4zNTksMTIuMzY1LDMyLjM5MSwwLDQ0Ljc0NGMtMTIuMzU0LDEyLjM1NC0zMi4zOTEsMTIuMzU0LTQ0Ljc0NCwwICAgTDIyNS45MjMsMTczLjUyOUw1NC4wMTgsMzQ1LjQ0Yy0xMi4zNiwxMi4zNTQtMzIuMzk1LDEyLjM1NC00NC43NDgsMGMtMTIuMzU5LTEyLjM1NC0xMi4zNTktMzIuMzkxLDAtNDQuNzVMMjAzLjU1NCwxMDYuNCAgIGM2LjE4LTYuMTc0LDE0LjI3MS05LjI1OSwyMi4zNjktOS4yNTlDMjM0LjAxOCw5Ny4xNDEsMjQyLjExNSwxMDAuMjMyLDI0OC4yOTIsMTA2LjQwNnoiIGZpbGw9IiNmM2E2YzYiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIHN0eWxlPSIiPjwvcGF0aD4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8L2c+PC9zdmc+);
    width: 10px !important;
    height: 10px !important;
    background-size: 10px !important;
    opacity: 1;
    content: '';
    border: 0;
    transform: rotate(90deg);
    position: absolute;
    margin-left: 5px;
    top: 7px;
	}
	
	.content-bottom {
		color:var(--gray);
	}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container board-container d-md-flex my-4">
		<jsp:include page="./sidebar.jsp" flush="false"/>
		<div class="row card ml-auto content-top">
			<div class="col-md-12 pt-4 px-5 pb-5" style="flex:none;">
<!-- 				<div class="row mb-2"> -->
<%-- 					<a class="sort_board text-pink" href="${listPath}?" --%>
<%-- 						  style="position:relative;">${board.sortBoardName}</a> --%>
<%-- 						<a type="button" href="${listPath}?${query}" --%>
<!-- 							class="btn-sm btn btn-plain ml-auto mr-2"> -->
<!-- 					 	   목록 -->
<!-- 						</a> -->
<!-- 				</div> -->
				<!-- 글정보 -->
				<div class="row mb-2 content-info mt-2">
					<div class="d-flex w-100 h5">
						<div style="line-height: 1.4;">
							<c:if test="${not empty board.sort_place}">
								<a href="${listPath}?${sortQ}"
									class="text-gray9 mr-1 font-weight-500 sort_place">
									[${board.sortPlaceName}]</a>
							</c:if>
							${board.board_title}
						</div>
					</div>
					<div class="d-flex w-100 font-size-085 mt-1">
						<div class="d-flex">
							<div class="d-table-cell mr-2 set-bg rounded-circle border" 
								 data-setbg="${empty board.userImg ? noProfile : (contextPath += '/display?img=' += board.userImg)}"
								 style="width:30px; height:30px;"></div>
							<div class="d-table-cell mr-2">
								<a href="${profilePath}/${board.user_id}" class="align-middle text-black">${board.userNick}</a>
							</div>
							<div class="d-table-cell mr-2">
								<span class="align-middle text-muted">
									<fmt:formatDate value="${board.reg_date}" pattern="yy.MM.dd HH:mm"/>
								</span> 
							</div>
							<div class="d-table-cell mr-2">
								<span class="align-middle text-muted">조회 ${board.view_cnt}</span> 
							</div>
							<div class="d-table-cell mr-2">
								<span class="align-middle text-muted">좋아요 <span class="like_cnt">${board.like_cnt}</span></span> 
							</div>
							<div class="d-table-cell mr-2">
								<span class="align-middle text-muted">댓글 <span class="cmt_cnt">${board.cmt_cnt}</span></span> 
							</div>
						</div>
						<div class="ml-auto mr-2">
							<svg xmlns="http://www.w3.org/2000/svg" width="0.98rem" height="0.98rem" fill="currentColor" id="bookmark" class="bi bi-bookmark mr-2 cursor-pointer loginNeed" viewBox="0 0 16 16">
							  <path class="bi-bookmark text-muted ${empty board.bmBoard ? '' : 'd-none'}" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
							  <path class="bi-bookmark-fill text-warning ${not empty board.bmBoard ? '' : 'd-none'}" d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"/>
							</svg>
							<svg xmlns="http://www.w3.org/2000/svg" id="share" width="0.98rem" height="0.98rem" fill="currentColor" class="bi bi-share text-muted cursor-pointer" viewBox="0 0 16 16">
							  <path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"/>
							</svg>
							<%-- 수정 삭제 버튼  --%>
							<c:if test="${loginMember.user_id == board.user_id}">
							<svg class="bi bi-three-dots-vertical cursor-pointer ml-2" style="opacity:.7;" data-toggle="dropdown" width="1.2rem" height="1.2rem" fill="var(--gray)" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
								<path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
							</svg>
								<div class="dropdown-menu dropdown-menu-right" style="min-width:4rem; font-size:0.8rem;">
									 <a class="dropdown-item" href="${localPath}/update/${board.board_no}?${allQ}">수정</a> 
									 <a class="dropdown-item" href="javascript:doDelete();">삭제</a>
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<!-- 글내용 -->
				<div class="row my-4 px-3 content-middle">
					<div class="content_wrap w-100">
						${board.board_content}
					</div>
					<c:if test="${not empty board.sort_place}">
						<div class="map_wrap w-100 mt-4">
							<div id="map" class="rounded-sm border" style="width:100%;height:350px;"></div>
						</div>
					</c:if>
				</div>
				<!-- 해시태그 -->
				<div class="row mb-1">
					<c:forEach var="tag" items="${board.tagList}">
						<a href="${listPath}?sortBoard=all&tag=${tag.tag_name}" class="loginNeed mr-2 text-pink">&num;${tag.tag_name}</a>
					</c:forEach>
				</div>
				<!-- 글버튼 -->
				<div class="row mb-2 content-bottom">
					<span class="loginNeed fa ${not empty board.likeBoard ? 'fa-heart' : 'fa-heart-o'}
						  mr-1 cursor-pointer" id="like" 
						  style="line-height: 1.5;
						  ${not empty board.likeBoard ? 'color:var(--danger)' : 'color:var(--gray)'}"></span>
					<span class="mr-2 like_cnt" id="like_cnt">${board.like_cnt}</span>  
					<span class="loginNeed fa fa-comment-o ml-2 mr-1" id="cmt" style="line-height: 1.4;"></span>
					<span id="cmt_cnt" class="cmt_cnt">${board.cmt_cnt}</span> 
					<c:if test="${loginMember.user_id != board.user_id}">
					<c:if test="${not empty loginMember}">
<!-- 						<a href="" class="ml-auto text-muted font-size-090">신고</a> -->
					</c:if>
					</c:if>
				</div>
			</div>
			<!-- 상세보기 댓글 -->
			<div class="row">
				<div class="col-md-12">
					<jsp:include page="./comment.jsp" flush="false"/>
				</div>
			</div>
			<!-- 글목록 -->
			<div class="mt-5">
				<jsp:include page="./list.jsp" flush="false"/>
			</div>
			<jsp:include page="./search.jsp" flush="false"/>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
	<!-- like,bookmark,link --> 
	<script>
// 	var login_id = "${loginMember.user_id}"; // 로그인한사람 id
// 	if(login_id == '') {
// 		$(".board-container").on("click", ".loginNeed", function(e) {
// 			e.preventDefault();
// 			Swal.fire({
// 				title: '로그인 필수',
// 				text: '로그인 하시겠습니까?', 
// 				allowOutsideClick: false,
// // 				iconColor: "#1f5e43",
// 				icon: 'error', 
// 				confirmButtonText: "확인",
// // 				confirmButtonColor: "#1f5e43",
// 				cancelButtonText: "취소",
// 				showCancelButton: true,
// 			}).then(function(result) {
// 				if(result.isConfirmed) {
// 					location.href = "${contextPath}/login";
// 				} 
// 			});
// 			return false;
// 		});
// 	} else {
// 		$('#like').on('click', function() {
// 			var url = "${localPath}/like?board_no=${board.board_no}";
// 			$.get(url, function(rData) {
// 				console.log(rData);
// //	 			let spanLike = document.querySelector('#like')
// 				if (rData == "like") {
// //	 				spanLike.classList.replace('fa-heart-o', 'fa-heart');
// 					$('#like').css('color', 'var(--danger)');
// 					$('#like').switchClass('fa-heart-o', 'fa-heart');
// 					$(".like_cnt").text(Number($("#like_cnt").text()) + 1);
// 				} else {
// 					$('#like').css('color', 'var(--gray)');
// 					$('#like').switchClass('fa-heart', 'fa-heart-o');
// 					$(".like_cnt").text(Number($("#like_cnt").text()) - 1);
// 				}
// 			});
// 		})
		
// 		$('#bookmark').on('click', function() {
// 			var url = "${localPath}/bookmark?board_no=${board.board_no}";
// 			$.get(url, function(rData) {
// 				console.log(rData);
// 				console.log($('#bookmark').find('path'));
// 				$('#bookmark > .bi-bookmark').toggleClass('d-none');
// 				$('#bookmark > .bi-bookmark-fill').toggleClass('d-none');
// 			});
// 		})
// 	}
	
	
	
	
	$("#share").on('click', function() {
		console.log(window.document.location.href);
		var url = null;
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		Swal.fire({
			title: 'url이 복사 되었습니다', 
			icon: 'success', 
			confirmButtonText: "확인",
		}).then(function(){close()});
	})
	
	
	
	
	
	//글삭제
	function doDelete() {
	Swal.fire({
		title: '삭제하시겠습니까?', 
		allowOutsideClick: false,
		padding: '2em',
// 		iconColor: "#1f5e43",
// 		icon: 'question', 
		confirmButtonText: "확인",
// 		confirmButtonColor: "#1f5e43",
		cancelButtonText: "취소",
		showCancelButton: true,
	}).then(function(result) {
		if(result.isConfirmed) {
			location.href = "${localPath}/delete/${board.board_no}?${allQ}";
		} 
	});
	}
	</script>
	
	<!-- kakaoMap -->
	<script>
	<c:if test="${not empty board.sort_place}">
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
	geocoder.addressSearch('${board.place.place_address}', function(result, status) {
	
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
	            '  <a href="https://map.kakao.com/link/map/${board.place.place_id}" target="_blank">' +
	            '    <span class="title">${board.place.place_name}</span>' +
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
	</c:if>
	</script>
	
	<!-- comment -->
	<script>
	$(document).ready(function() {
		selectCommentList();
	});
	
	// 일반 댓글 작성
	function insertComment() {
		var c_content = $("#c_content").val();
		if (c_content.length < 1 || c_content.trim() == "") {
			Swal.fire({
			text: '댓글 내용을 입력하지 않았습니다.', 
			allowOutsideClick: false,
			icon: 'error', 
			confirmButtonText: "확인",
			}).then(function(){close()});
			return false;
		}
		var b_no = parseInt("${board.board_no}");
		var url = "${contextPath}/comment/insert";
		var sendData = {
				"c_content" : c_content,
				"b_no" 	    : b_no,
	 			"user_id"	: login_id
		}
		$.ajax({
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json"
			},
			"method" : "post",
			"dataType" : "text",
			"data" : JSON.stringify(sendData),
			"success" : function(data) {
				console.log(data)
				if(data == "success") {
					
					selectCommentList();
					$("#c_content").val("");
				}
			}
		});
		
	}	
	//답댓글 작성
	function insertRecomment(el) {
		var re_group = $(el).parent().parent().parent().parent().parent().find('.re_group').val();
		console.log(re_group);
		var parent_c_no = $("#parent_c_no").val();
//	 	var user_id = $("#re_user_id").val()
		var c_content = $("#re_c_content").val();
		if (c_content.length < 1 || c_content.trim() == "") {
			Swal.fire({
			text: '댓글 내용을 입력하지 않았습니다.', 
			allowOutsideClick: false,
			icon: 'error', 
			confirmButtonText: "확인",
			}).then(function(){close()});
			return false;
		}
		var b_no = parseInt("${board.board_no}");
		var url = "${contextPath}/comment/insert";
		var sendData = {
				"c_content" : c_content,
				"b_no" 	    : b_no,
	 			"user_id"	: login_id,
				"parent_c_no" : parent_c_no,
				"re_group" : re_group,
		}
		console.log(sendData);
		$.ajax({
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json"
			},
			"method" : "post", 
			"dataType" : "text",
			"data" : JSON.stringify(sendData),
			"success" : function(rData) {
				console.log(rData);
				if(rData == "success") {
					var reply = '<div id="reply_div" style="display:none;">'+$('#reply_div').html()+'</div>';
		            $('#comment').append(reply);
					selectCommentList();
				}
			}
		});
	}

	// 답글 버튼 누를때 
	function doRecomment(c_no) {
		var reply = '<div id="reply_div">'+$('#reply_div').html()+'</div>';
		if ($("#reply_div").css("display") == "block") {
	 		if($("#replyCommentDiv_"+ c_no).find("#reply_div").length == 0) {
	  			$('#reply_div').remove();
	     		$("#replyCommentDiv_"+ c_no).html(reply);
			 } else {
	  			$("#replyCommentDiv_"+ c_no).find("#reply_div").hide();
	 		}
		} else {
			$('#reply_div').remove();
			$("#replyCommentDiv_"+ c_no).html(reply);
		}
	    
	    $("#parent_c_no").val(c_no);
	}	

	var board_writer = "${board.user_id}"; // 글작성자 id

	// 댓글 리스트 조회
	function selectCommentList() {
		
		$("#commentContainer > .comment-row:gt(0)").remove();
		$("#moreViewDiv").empty();
		var url = "${contextPath}/comment/list?board_no=${board.board_no}";
		$.get(url, function(rData) {
			const perPage = 10;
			if (rData.length < perPage + 1) {
				$("#btnMoreComments").hide();
			} else {
				$("#btnMoreComments").show();
			}
			if(rData.length > 0) {
				$("#noCmtDiv").hide();
			} else {
				$("#noCmtDiv").show();
			}
//	 		$("#comment_cnt").text(rData.length);
			$(".cmt_cnt").text(rData.length);
			$.each(rData, function(i) {
				var cloneDiv = $("#commentContainer > .comment-row:eq(0)").clone();
				if (this.c_depth == 1) {
					cloneDiv.addClass("recomment-row");
					cloneDiv.find(".c_parent_user_nick").show();
				}
				
				cloneDiv.show();
				//자기 댓글이 아닐경우 수정삭제 안보이게하기, 신고버튼은 보이게 하기(신고 기능 없음)
				if(this.user_id != login_id) {
					cloneDiv.find(".private").remove();
					if('${loginMember}' != "") {
// 	 				cloneDiv.find(".report").show();
					}
				} else {
					cloneDiv.css("background", "#f3a6c61a")
				}
				
				//
				cloneDiv.find(".view_comment").attr("id", "view_comment_" + this.c_no );
				cloneDiv.find(".c_no").val(this.c_no);
				cloneDiv.find(".re_group").val(this.re_group);
				if (this.user_img != null && this.user_img.trim() != "") {
					cloneDiv.find(".user_img").css("background-image", "url(${contextPath}/display?img="+this.user_img + ")");
				} else {
					cloneDiv.find(".user_img").css("background-image", "url(${noProfile})");
				}
				cloneDiv.find(".c_user_nick").text(this.user_nick);
				cloneDiv.find(".c_user_nick").attr('href', '${profilePath}/' + this.user_id)
				if (this.user_id == board_writer) {
					cloneDiv.find(".is_board_writer").show();
				}
				cloneDiv.find(".doUpdateComment").attr("onclick", "doUpdateComment(" + this.c_no + ")");
				cloneDiv.find(".updateCommentDiv").attr("id", "updateCommentDiv_" + this.c_no);
				// 댓글 수정 취소
				cloneDiv.find(".cancel").attr("href", "javascript:cancelUpdate(" + this.c_no + ")");
				cloneDiv.find(".updateBtn").attr("onclick", "updateComment(" + this.c_no + ")");
				cloneDiv.find(".deleteComment").attr("onclick", "deleteComment(" + this.c_no + ")");
				cloneDiv.find(".doRecomment").attr("onclick", "doRecomment(" + this.c_no + ")");
				cloneDiv.find(".c_parent_user_nick").text("@" + this.parent_user_nick);
				cloneDiv.find(".c_content").html(this.c_content);
				var reg_date = changeDateString(this.reg_date);
				cloneDiv.find(".c_reg_date").text(reg_date);
				cloneDiv.find(".replyCommentDiv").attr("id", "replyCommentDiv_" + this.c_no);
				$("#commentContainer > .comment-row:eq(1)").css('border-top', 'none');
				if(i > perPage - 1) {
					$("#moreViewDiv").append(cloneDiv);
//	 				console.log(i + "," + "moreview" +  cloneDiv.html());
					$("#moreViewDiv").insertAfter("#commentContainer > .comment-row:last"); 
				} else {
					$("#commentContainer").append(cloneDiv);
//	 				console.log(i + "," + "일반" + cloneDiv.html());
				}
//	 			console.log("댓글들", $("#commentContainer > .comment-row:gt(3)"));
			});
		});
		
	}
	// 댓글 수정 버튼 누를때
	function doUpdateComment(c_no) {
		$.get("${contextPath}/comment/select?c_no=" + c_no, function(cmt) {
			$("#updateCommentDiv_" + c_no).show();
			$("#view_comment_" + c_no).toggleClass("d-flex");
			$("#view_comment_" + c_no).toggleClass("d-none");
		    $("#updateCommentDiv_" + c_no).find(".c_content").val(cmt.c_content);
		});
	}

	//수정 취소 누를때
	function cancelUpdate(c_no) {
		$("#updateCommentDiv_" + c_no).hide();
		$("#view_comment_" + c_no).toggleClass("d-flex");
		$("#view_comment_" + c_no).toggleClass("d-none");
	}

	function updateComment(c_no) {
		var c_content = $("#updateCommentDiv_" + c_no).find(".c_content").val();
		if (c_content.length < 1 || c_content.trim() == "") {
			Swal.fire({
			text: '1자 이상 입력해야 댓글을 등록할 수 있습니다.', 
// 			padding:'2em',
			allowOutsideClick: false,
			icon: 'error', 
			confirmButtonText: "확인",
			}).then(function(){close()});
			return false;
		}
		var url = "${contextPath}/comment/update";
		var sendData = {
				"c_content" : c_content,
				"c_no"	: c_no,
				"user_id" : "mimi"
		}
		
		$.ajax({
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json"
			},
			"method" : "post",
			"dataType" : "text",
			"data" : JSON.stringify(sendData),
			"success" : function(rData) {
				if(rData == "success") {
					selectCommentList();
				}
			}
		});
	}
	// 댓글 삭제  
	function deleteComment(c_no) {
		var url = "${contextPath}/comment/delete";
		Swal.fire({
			text: '삭제하시겠습니까?', 
			allowOutsideClick: false,
			icon: 'question', 
			confirmButtonText: "확인",
			cancelButtonText: "취소",
			showCancelButton: true,
		}).then(function(result) {
			if(result.isConfirmed) {
				var sendData = {
						"b_no" : "${board.board_no}",
						"c_no"	: c_no
				}
				
				$.ajax({
					"url" : url,
					"headers" : {
						"Content-Type" : "application/json"
					},
					"method" : "post",
					"dataType" : "text",
					"data" : JSON.stringify(sendData),
					"success" : function(rData) {
						if(rData == 0) {
							Swal.fire({
							text: '답댓이 있는 댓글은 삭제할 수 없습니다.', 
							allowOutsideClick: false,
							icon: 'error', 
							confirmButtonText: "확인",
							}).then(function(){close()});
						} else {
							selectCommentList();
						}
					}
				});
			} 
		});
	}
	var commentOpens = 0;
	function moreViewToggle() {
		if(commentOpens == 0) {
			$("#moreViewDiv").show();
	        $("#btnMoreComments").html('줄여보기');
	        commentOpens = 1;
	    }
	    else {
	        $("#moreViewDiv").hide();
	        $("#btnMoreComments").html('전체보기');
	        commentOpens = 0;
	    }
	}
	
	function make2digits(num) {
		if (num < 10) {
			num = "0" +  num;
		}
		return num;
	}

	function changeDateString(timestamp) {
		var d = new Date(timestamp);
		var now = new Date();
		var today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
		var result = null;
		
		var year = d.getFullYear();
		var month = d.getMonth() + 1;
		var date = d.getDate();
		var hour = make2digits(d.getHours());
		var minute = make2digits(d.getMinutes());
		if(d >= today) {
			result = hour + ":" + minute;
		} else {
			result = year + "." + month + "." + date + " " + hour + ":" + minute;
		}
		return result;
	}
	</script>
</body>
</html>