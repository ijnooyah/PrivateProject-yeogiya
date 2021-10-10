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
	.preview-img {
	background-repeat: no-repeat;
	background-size: cover;
	background-position: top center;
	}
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container mypage-container my-4 d-flex">
		<div class="form-group mx-auto p-0">
			<p class="h4 mb-5">내 정보 수정</p>
			<form id="updateRun" method="post" action="updateRun" onsubmit="return validate();">
				<!--프로필 사진-->
				<div class="mb-4 row">
				    <label for="user_img" class="col-sm-3">프로필 사진</label>
				    <div class="d-flex">
			    		<label class="label_user_img mb-auto preview-img border" for="fileUserImg"
			    			style="width:80px; height:80px; cursor:pointer;
			    			background-image:url(${not empty member.user_img ? (contextPath += '/display?img=' += member.user_img) : noProfile});">
						</label>
						<a id="" class="btn_del" href="javascript:delProfileImg()" ${not empty member.user_img ? '' : 'style="display:none;"' }></a>
						<input type="hidden" value="${member.user_img}" name="user_img" id="user_img"/>
						<input type="file" class="d-none" id="fileUserImg" accept=".gif, .jpg, .png, .jpeg" onchange="previewMainImg(this);">
		    		</div>
		    	</div>
		    	<!-- 닉네임 -->
		    	<div class="mb-4 row">
				    <label for="" class="col-sm-3 mb-0">닉네임</label>
				    <div class="d-flex">
				      <input type="text" class="form-control input_user_nick" maxlength="10" 
				      		id="user_nick" name="user_nick" value="${member.user_nick}" spellcheck="false"/>
				      <div class="my-auto ml-2 font-size-080">
					      <span id="nickCnt">0</span><span>/10</span>
					      <span class="nick-feedback text-danger ml-2" style="display:none;">사용중인 닉네임 입니다.</span>
				      </div>
		    		</div>
		    	</div>
		    	<!-- 자기소개 -->
		    	<div class="mb-4 row">
				    <label for="" class="col-sm-3">자기소개</label>
				    <div class="d-flex">
				      <textarea class="form-control txa_user_intro" id="user_intro" 
				      maxlength="200" name="user_intro" spellcheck="false">${member.user_intro}</textarea>
				      <div class="mt-auto ml-2 font-size-080">
					      <span id="introCnt">0</span><span>/200</span>
				      </div>
		    		</div>
		    	</div>
		    	<!-- 지역 공개 -->
		    	<div class="mb-4 row">
				    <label for="" class="col-sm-3 mb-0">지역</label>
				    <div class="d-flex">
				     <select class="form-control" name="open_local">
				    		<option value="Y" ${member.open_local == 'Y' ? 'selected' : ''}>공개</option>
				    		<option value="N" ${member.open_local == 'N' ? 'selected' : ''}>비공개</option>
				    	</select>
		    		</div>
		    	</div>
		    	<!-- 북마크 공개 -->
		    	<div class="mb-4 row">
				    <label for="" class="col-sm-3 mb-0">북마크</label>
				    <div class="d-flex">
				     <select class="form-control" name="open_bmk">
				    		<option value="Y" ${member.open_bmk == 'Y' ? 'selected' : ''}>공개</option>
				    		<option value="N" ${member.open_bmk == 'N' ? 'selected' : ''}>비공개</option>
				    	</select>
		    		</div>
		    	</div>
		    	<!--알림 -->
		    	<div class="mb-4 row">
				    <label for="" class="col-sm-3 mb-0">실시간 알림</label>
				    <div class="d-flex">
					     <div class="custom-control custom-switch mr-4">
							  <input type="checkbox" class="custom-control-input" name="cmt_alert" id="cmt_alert" 
							  	${member.cmt_alert == 'on' ? 'checked' : ''}>
							  <label class="custom-control-label" for="cmt_alert">댓글</label>
						</div>
					     <div class="custom-control custom-switch mr-4">
							  <input type="checkbox" class="custom-control-input" name="like_alert" id="like_alert" 
							  ${member.like_alert == 'on' ? 'checked' : ''}>
							  <label class="custom-control-label" for="like_alert">좋아요</label>
						</div>
					     <div class="custom-control custom-switch mr-4">
							  <input type="checkbox" class="custom-control-input" name="msg_alert" id="msg_alert" 
							  ${member.msg_alert == 'on' ? 'checked' : ''}>
							  <label class="custom-control-label" for="msg_alert">쪽지</label>
						</div>
					     <div class="custom-control custom-switch">
							  <input type="checkbox" class="custom-control-input" name="bmk_alert" id="bmk_alert" 
							  ${member.bmk_alert == 'on' ? 'checked' : ''}>
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
	function previewMainImg(targetObj) {
		if (targetObj.files.length == 0){
			return false;
		}
		
		var file = targetObj.files[0];
		
		// 이미지파일체크, 파일 사이즈 체크
		var imgJ = /(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$/;
		var maxSize = 10 * 1024 * 1024;
	    
		console.log(file.name);
		console.log(file.size);
	    if(!file.name.match(imgJ)) {
	    	Swal.fire({
				text: '이미지 파일만 업로드 가능합니다.', 
				allowOutsideClick: false,
				icon: 'error', 
				confirmButtonText: "확인",
			});
	        return;
	    } else if(file.size > maxSize) {
	    	Swal.fire({
				text: '파일 크기는 10MB까지 가능합니다.', 
				allowOutsideClick: false,
				icon: 'error', 
				confirmButtonText: "확인",
			});
	        return;
	    }
	 	// 이미지파일체크, 파일 사이즈 체크   end
		    
		var formData = new FormData();
		formData.append("file", file);
		
		var url = "${contextPath}/uploadUserImg";
		
		$.ajax({
			"processData" : false,
			"contentType" : false,
			"url" : url,
			"method" : "post",
			"data" : formData,
			"success" : function(filePath) {
				console.log("filePath:" + filePath);
				// 1. hidden에 값 넣기 
				$("#user_img").val(filePath);
				//2. 프리뷰이미지 보여주기 
				var reader = new FileReader();
				reader.readAsDataURL(file);
				reader.onload = function(e) {
					console.log(e)
					console.log($(".label_user_img"))
					console.log(e.target.result);
					$(".label_user_img").css("background-image", "url("+e.target.result+")");
					console.log("$('#user_img').val()", $('#user_img').val());
					$(".btn_del").show();
				}
			},
			"error" : function() {
				alert("파일 업로드 실패!");
			}
		});
	}
	
	function delProfileImg() {
		console.log("삭제")
		var filePath = $("#user_img").val();
		$("#user_img").val("");
		$(".label_user_img").css("background-image", "url(${noProfile})");
		$(".btn_del").hide();
	}
	$("#user_nick").on("input", function(){
		var cnt = $(this).val();
		$("#nickCnt").text(cnt.length);
		$("#nickCnt").css("color", "#212529");
		if(cnt.length >= 10){
			$("#nickCnt").css("color", "var(--danger)");
		}
	});
	
	$("#user_intro").on("input", function(){
		var cnt = $(this).val();
		$("#introCnt").text(cnt.length);
		$("#introCnt").css("color", "#212529");
		if(cnt.length >= 200){
			$("#introCnt").css("color", "var(--danger)");
		}
	});
	
	var nickCheck = true;
	$('#user_nick').on('blur', function() {
		var value = $('#user_nick').val();
		var nickReg = /^[a-zA-Zㄱ-ㅎ가-힣0-9]{2,10}$/;
			if (value.trim() == "" || value == null) {
				nickCheck = false;
				$('.nick-feedback').text("필수 정보입니다.");
				$('.nick-feedback').show();
			} else if(!value.match(nickReg) ){
				nickCheck = false;
				$('.nick-feedback').text("2~10자의 한글, 영문 대소문자, 숫자만 사용 가능합니다.");
				$('.nick-feedback').show();
			} else{
				console.log(value);
				$.ajax({
	                type: "post",
	                dataType: "text",
	                data: {
	                	'user_nick': value
	                },
	                url: "${memberPath}/checkDupNick",
	                success: function (data) {
	                	if(data=="true"){	// 중복일경우
	                		console.log('중복');
	                		nickCheck = false;
	                		$('.nick-feedback').text('이미 사용중인 닉네임 입니다');
	                		$("#user_nick").removeClass("is-valid");
	                		$('.nick-feedback').show();
	                	}else{				// 중복아닐경우
	                		console.log('중복노')
	                		nickCheck = true;
	                		$('.nick-feedback').hide();
	                	}
	                }
				});
			}
	})
	 
	
	function validate() {
		if(!nickCheck) {
			$('#user_nick').focus();
			return false;
		} 
	}
	</script>
</body>
</html>