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
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container board-container my-5">
		<!-- 비로그인 사용자일경우 전국 인기장소만 보여주기. -->
		<!-- 울산 동구 (설정지역) 핫플레이스 (글말고장소)-->
		<!-- 검색창 -->
		<div class="text-center pt-2 mb-4">
			<a href="${contextPath}/" class="logo text-pink">울산</a>
		</div>
		<div style="width:700px;" class="mx-auto mb-5">
			<form  method="post" action="">
				<div class="inner-form w-100 mb-4">
					<div class="input-field w-100" style="height:60px;position:relative;">
					<input id="search" type="text" placeholder="검색어를 입력하세요" value="">
					<button class="btn-search" type="button">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
							<path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
						</svg>
					</button>
					</div>
				</div>
			</form>
			<div class="text-center">
				<span class="mr-1">실시간 트렌드 <svg width="1rem" height="1rem" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			 			<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"></path>
				</svg></span>
				<div class="d-inline-block">
					<a href="" class="btn btn-sm btn-pink-outline">&num;해시태그</a>
					<a href="" class="btn btn-sm btn-pink-outline">&num;해시태그</a>
					<a href="" class="btn btn-sm btn-pink-outline">&num;해시태그</a>
					<a href="" class="btn btn-sm btn-pink-outline">&num;해시태그</a>
				</div>
			</div>
		</div>
		<!-- 인기글-->
		<div class="mx-auto col-sm-10 mb-3 pt-5">
			<span class="cursor-pointer">인기글 
			<svg width="1rem" height="1rem" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	 			<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
			</svg></span>
		</div>
		<div class="d-flex flex-wrap justify-content-center">
			<c:forEach var="v" begin="1" end="4">
				<jsp:include page="./card.jsp" flush="false"/>
			</c:forEach>
		</div>
		<!-- 최신글-->
		<div class="mx-auto col-sm-10 mb-3 pt-5">
			<span class="cursor-pointer">최신글 
			<svg width="1rem" height="1rem" viewBox="0 0 16 16" class="bi bi-chevron-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	 			<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
			</svg></span>
		</div>
		<div class="d-flex flex-wrap justify-content-center">
			<c:forEach var="v" begin="1" end="4">
				<jsp:include page="./card.jsp" flush="false"/>
			</c:forEach>
		</div>
	</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
<%@ include file="../cdn/js.jsp" %>
	<script>
	</script>
</body>
</html>