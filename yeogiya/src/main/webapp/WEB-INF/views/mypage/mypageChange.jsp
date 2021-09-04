<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../cdn/css.jsp" %>
<title>mypageChange</title>
	<style>
	@media (min-width: 1200px) {
	.mypage-container.container {
	    max-width: 900px !important;
		}
	}
	
	.mypage-container .btn_del {
	    display: block;
	    width: 1rem;
	    height: 1rem;
	    background-position: center;
	    background-repeat: no-repeat;
	    background-size: 1rem;
	    background-image: url(/yeogiya/resources/image/cancel.gif);
	    position: relative;
	    top: 0;
	    right: 1rem;
	    opacity: .5;
	}
	
	.mypage-container .form-control{
	    height: 30px;
	    font-size: .75rem;
	}
	
	.mypage-container .input_user_nick {
	    width: 150px;
	}
	
	.mypage-container .txa_user_intro {
		width: 400px;
		height: 90px !important;
		resize:none;
	}
	
	.mypage-container select {
		width: 80px;
		resize:none;
	}
	
	.mypage-container .custom-control-label {
		font-size:.9rem;
		color:#495057;
	}
	
	.mypage-container div.form-group{
		width: 650px;
	}
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container mypage-container my-4 d-flex">
		<div class="form-group mx-auto p-0">
			<p class="h4 mb-5">내 정보 수정</p>
			<form>
				<!--프로필 사진-->
				<div class="mb-4 row">
				    <label for="user_img" class="col-sm-3">프로필 사진</label>
				    <div class="d-flex">
			    		<label class="label_user_img mb-auto set-bg border" for="user_img"
			    			data-setbg="${contextPath}/resources/image/no-profile.png" 
			    			style="width:80px; height:80px; cursor:pointer;">
						</label>
						<a id="" class="btn_del d-none" href=""></a>
						<input type="file" class="d-none" id="user_img" accept=".gif, .jpg, .png, .jpeg" onchange="">
		    		</div>
		    	</div>
		    	<!-- 닉네임 -->
		    	<div class="mb-4 row">
				    <label for="" class="col-sm-3 mb-0">닉네임</label>
				    <div class="d-flex">
				      <input type="text" class="form-control input_user_nick" required />
				      <div class="my-auto ml-2 font-size-080">
					      <span id="">0</span><span>/7</span>
					      <span class="">사용중인 닉네임 입니다.</span>
				      </div>
		    		</div>
		    	</div>
		    	<!-- 자기소개 -->
		    	<div class="mb-4 row">
				    <label for="" class="col-sm-3">자기소개</label>
				    <div class="d-flex">
				      <textarea class="form-control txa_user_intro" id="user_intro" required></textarea>
				      <div class="mt-auto ml-2 font-size-080">
					      <span id="">0</span><span>/7</span>
				      </div>
		    		</div>
		    	</div>
		    	<!-- 지역 공개 -->
		    	<div class="mb-4 row">
				    <label for="" class="col-sm-3 mb-0">지역</label>
				    <div class="d-flex">
				     <select class="form-control">
				    		<option>공개</option>
				    		<option>비공개</option>
				    	</select>
		    		</div>
		    	</div>
		    	<!-- 북마크 공개 -->
		    	<div class="mb-4 row">
				    <label for="" class="col-sm-3 mb-0">북마크</label>
				    <div class="d-flex">
				     <select class="form-control">
				    		<option>공개</option>
				    		<option>비공개</option>
				    	</select>
		    		</div>
		    	</div>
		    	<!--알림 -->
		    	<div class="mb-4 row">
				    <label for="" class="col-sm-3 mb-0">실시간 알림</label>
				    <div class="d-flex">
					     <div class="custom-control custom-switch mr-4">
							  <input type="checkbox" class="custom-control-input" id="cmt_alert" checked>
							  <label class="custom-control-label" for="cmt_alert">댓글</label>
						</div>
					     <div class="custom-control custom-switch mr-4">
							  <input type="checkbox" class="custom-control-input" id="like_alert" checked>
							  <label class="custom-control-label" for="like_alert">좋아요</label>
						</div>
					     <div class="custom-control custom-switch mr-4">
							  <input type="checkbox" class="custom-control-input" id="msg_alert" checked>
							  <label class="custom-control-label" for="msg_alert">쪽지</label>
						</div>
					     <div class="custom-control custom-switch">
							  <input type="checkbox" class="custom-control-input" id="bmk_alert" checked>
							  <label class="custom-control-label" for="bmk_alert">북마크</label>
						</div>
		    		</div>
				</div>
				<div class="text-center pt-5">
					<button type="submit" class="btn btn-pink">수정</button>
					<button class="btn btn-pink-outline">취소</button>
				</div>
			</form>
		</div>
	</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
<%@ include file="../cdn/js.jsp" %>
	<script>
	</script>
</body>
</html>