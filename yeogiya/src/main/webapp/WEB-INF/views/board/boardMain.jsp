<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../cdn/css.jsp" %>
<title>boardMain</title>
	<style>
	form .inner-form .input-field input {
	    height: 100%;
	    width: 100%;
	    background: transparent;
	    border: var(--pink) 4px solid;
	    background: #fff;
	    display: block;
	    width: 100%;
	    padding: 10px 60px 10px 32px;
	    font-size: 18px;
	    color: #666;
	    border-radius: 34px;
	}
	form .inner-form .input-field input:hover, form .inner-form .input-field input:focus {
  		box-shadow: none;
 		outline: 0;
	}
	form .inner-form .input-field .btn-search {
	    width: 70px;
	    display: -ms-flexbox;
	    display: flex;
	    -ms-flex-align: center;
	    align-items: center;
	    position: absolute;
	    top: 0;
    	right: 0;
	    height: 100%;
	    background: transparent;
	    border: 0;
	    padding: 0;
	    cursor: pointer;
	    display: flex;
	    -ms-flex-pack: center;
	    justify-content: center;
	    align-items: center;
	}
	form .inner-form .input-field .btn-search svg {
	    fill: #ccc;
	    width: 30px;
	    height: 30px;
	    transition: all .2s ease-out, color .2s ease-out;
	}
	form .inner-form .input-field .btn-search:hover, form .inner-form .input-field .btn-search:focus {
	    outline: 0;
	    box-shadow: none;
	}
	form .inner-form .input-field .btn-search:hover svg, form .inner-form .input-field .btn-search:focus svg {
   		fill: var(--pink);
	}
	</style>
</head>
<body>
<c:set var="memberLocalName" value=""/>
<c:set var="memberLocalEngName" value=""/>
 <c:forEach var="slp" items="${sortLocalPArr}">
 <c:if test="${slp.sort_no == loginMember.sort_local}">
 	<c:set var="memberLocalName" value="${slp.sort_name}"/>
 	<c:set var="memberLocalEngName" value="${slp.eng_name}"/>
 </c:if>
 </c:forEach>
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container board-container my-5">
		<!-- 비로그인 사용자일경우 전국 인기장소만 보여주기. -->
		<!-- 울산 동구 (설정지역) 핫플레이스 (글말고장소)-->
		<!-- 검색창 -->
		<div class="logo text-center" style="color:var(--pink);">
		<svg width="1rem" height="1rem" viewBox="0 0 16 16" class="bi bi-geo-alt-fill text-pink my-auto mr-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg"> 
				  <path fill-rule="evenodd" d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
				</svg> ${memberLocalName}</div>
		<div class="text-center pt-2 mb-4">
			<a href="${contextPath}/" class="logo text-pink">여기야!</a>
		</div>
<!-- 		<div style="width:700px;" class="mx-auto mb-5"> -->
<!-- 			<form  method="post" action=""> -->
<!-- 				<div class="inner-form w-100 mb-4"> -->
<!-- 					<div class="input-field w-100" style="height:60px;position:relative;"> -->
<!-- 					<input id="search" name="searchType" type="text" placeholder="검색어를 입력하세요" value=""> -->
<!-- 					<button class="btn-search" type="button"> -->
<!-- 						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"> -->
<!-- 							<path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path> -->
<!-- 						</svg> -->
<!-- 					</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</form> -->
<!-- 			<div class="text-center"> -->
<!-- 				<span class="mr-1">실시간 트렌드 <svg width="1rem" height="1rem" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg"> -->
<!-- 			 			<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"></path> -->
<!-- 				</svg></span> -->
<!-- 				<div class="d-inline-block"> -->
<!-- 					<a href="" class="btn btn-sm btn-pink-outline">&num;해시태그</a> -->
<!-- 					<a href="" class="btn btn-sm btn-pink-outline">&num;해시태그</a> -->
<!-- 					<a href="" class="btn btn-sm btn-pink-outline">&num;해시태그</a> -->
<!-- 					<a href="" class="btn btn-sm btn-pink-outline">&num;해시태그</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="MM" var="month" />
			<div class="mx-auto col-sm-10 mb-3 pt-5">
				<span>${month}월의 핫플레이스
				</span>
				<span class="text-muted font-size-070">*조회수, 좋아요, 댓글 기준
				</span>
			</div>
			<div class="d-flex flex-wrap justify-content-center">
				<c:if test="${empty loginMember}">
					<div style="height:200px;" class="w-75 card">
					<div class="m-auto text-center">
						<a class="text-pink font-weight-600" href="${memberPath}/login">로그인</a> 해주세요.
					</div> 
					</div>
				</c:if>
				<c:if test="${not empty loginMember}">
					<c:if test="${not empty loginMember.sort_local}">
						<c:forEach var="b" items="${boardList}">
							<div class="col-sm-5 mb-3">
								<div class="card">
									<div class="card-body">
										<div class="card-title">
											<p class="h5" style="max-width:530px"><span class="text-pink mr-1">[${b.sortPlaceName}]</span><a class="text-black" href="${contextPath}/${b.sortLocalEngName}/content/${b.board_no}?${b.query}">${b.board_title}</a></p>
											<div class="d-flex">
												<div class="d-table-cell mr-2 set-bg rounded-circle border" 
													 data-setbg="${empty b.userImg ? noProfile : (contextPath += '/display?img=' += b.userImg)}"
													 style="width:30px; height:30px;"></div>
												<div class="d-table-cell mr-2">
													<a href="${profilePath}/${b.user_id}" class="align-middle text-black">${b.userNick}</a>
												</div>
												<p class="text-muted ml-auto"><span class="date">
												<fmt:formatDate value="${b.reg_date}" pattern="yyyy.MM.dd"/>
												</span></p>
											</div>
										</div>
							<!-- 			<p class="card-text short_title mb-2" style="max-width:300px">#해시태그</p> -->
										<div class="d-flex">
											<svg width="1rem" height="1rem" viewBox="0 0 16 16" class="bi bi-geo-alt-fill text-pink my-auto mr-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg"> 
											  <path fill-rule="evenodd" d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
											</svg> 
											<span class="font-weight-500">${b.placeAddress}</span>
											<div class="ml-auto">
												<svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" fill="currentColor" class="loginNeed like bi bi-heart text-muted mr-2 cursor-pointer" viewBox="0 0 16 16" data-href="${contextPath}/${memberLocalEngName}/like?board_no=${b.board_no}">
												  <path class="bi-heart text-muted ${empty b.likeBoard ? '' : 'd-none'}" d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
												  <path class="bi-heart-fill text-danger ${not empty b.likeBoard ? '' : 'd-none'}" fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
												</svg>
												<svg xmlns="http://www.w3.org/2000/svg" width="0.98rem" height="0.98rem" fill="currentColor" class="loginNeed bookmark bi bi-bookmark text-muted mr-2 cursor-pointer" viewBox="0 0 16 16" data-href="${contextPath}/${memberLocalEngName}/bookmark?board_no=${b.board_no}">
												 <path class="bi-bookmark text-muted ${empty b.bmBoard ? '' : 'd-none'}" d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
							 					 <path class="bi-bookmark-fill text-warning ${not empty b.bmBoard ? '' : 'd-none'}" d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"/>
												</svg>
												<svg xmlns="http://www.w3.org/2000/svg" width="0.98rem" height="0.98rem" fill="currentColor" class="share bi bi-share text-muted cursor-pointer" viewBox="0 0 16 16" data-href="${contextPath}/${b.sortLocalEngName}/content/${b.board_no}?${b.query}">
												  <path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"/>
												</svg>
							<!-- 							<a href="" class="text-muted align-middle">URL 복사</a> -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty loginMember.sort_local}">
						<div style="height:200px;" class="w-75 card">
						<div class="m-auto text-center">
							<a class="text-pink font-weight-600" href="${contextPath}/me">회원정보</a>에서 지역을 설정해 주세요.
						</div> 
						</div>
					</c:if>
				</c:if>
			</div>
	</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
<%@ include file="../cdn/js.jsp" %>
	<script>
	var login_id = "${sessionScope.loginMember.user_id}";
	$(".share").on('click', function() {
		var url = null;
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = $(this).data("href");
		textarea.value = "http:/localhost" + url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		Swal.fire({
			title: 'url이 복사 되었습니다', 
			icon: 'success', 
			confirmButtonText: "확인",
		}).then(function(){close()});
	})
	
	
	$(".like").click(function(e) {
	e.preventDefault();
	console.log("좋아요 누름")
	if(login_id == "") {
		return false;
	}
	var url = $(this).data("href");
	var target = $(this);
	console.log("url", url);
	$.get(url, function(rData) {
		console.log(rData);
		target.find('.bi-heart').toggleClass('d-none');
		target.find('.bi-heart-fill').toggleClass('d-none');
	});
});

$(".bookmark").click(function(e) {
	e.preventDefault();
	console.log("북마크 누름")
	if(login_id == "") {
		return false;
	}
	var url = $(this).data("href");
	var target = $(this);
	console.log("url", url);
	$.get(url, function(rData) {
		console.log(rData);
		target.find('.bi-bookmark').toggleClass('d-none');
		target.find('.bi-bookmark-fill').toggleClass('d-none');
	});
})

	</script>
</body>
</html>