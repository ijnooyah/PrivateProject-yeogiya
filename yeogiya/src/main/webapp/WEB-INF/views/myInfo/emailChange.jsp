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
	<title>emailChangePw</title>
	<style>
		.myInfo-container {
			width: 500px;
			padding: 5rem 0;
		}	
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container myInfo-container my-4">
		<div class="container">
		<form action="updateRun" method="post" onsubmit="return validate();">
			<div class="h4 text-center mb-5">이메일 주소 변경</div>
			<div class="mb-2 row">
			    <label for="user_email" class="font-weight-500 col-sm-2 col-form-label">이메일</label>
			    <div class="col-sm-7">
				     <input type="tel" class="form-control" id="user_email" name="user_email" placeholder="yeogiya@naver.com" />
	    		</div>
		    	<button type="button" class="btn btn-pink col-sm-3" onclick="sendAuthNum();">인증번호 받기</button>
	    	</div>
			<div class="mb-2">
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-7">
					    <input type="text" class="form-control" name="confirmEmail" placeholder="인증번호 입력" id="confirmEmail" disabled>
		    		</div>
		    		<button type="button" class="btn btn-pink col-sm-3" onclick="checkAuthNum();">인증번호 확인</button>
				</div>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-7">
					    <div class='invalid-feedback'>인증번호가 일치하지 않습니다.</div>
					    <div class="valid-feedback">인증번호 확인완료</div>
		    		</div>
		    		<div class="col-sm-3"></div>
				</div>
	    	</div>
			<input type="hidden" name="act" value="${bs.act}"/>
			 <div class="text-center pt-5">
				<button type="submit" class="btn btn-pink">수정</button>
				<a class="btn btn-pink-outline" href="${contextPath}/me">취소</a>
			</div>
		</form>
	</div>
	</div>
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
	<script>
	var authNum = null;
	var emailCheck = false;
	var emailCheck2 = false;
	function sendAuthNum () {
 		authNum = null;
 		$('#confirmEmail').removeClass('is-invalid')
 		$('#confirmEmail').removeClass('is-valid')
 		emailCheck2 = false;
 		var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var value = $('#user_email').val();
		if(!value.match(emailReg) ){
			emailCheck = false;
				$('.invalid-feedback').text("유효하지 않은 이메일 형식 입니다.");
				$('.invalid-feedback').show();
				$('.valid-feedback').hide();
				$('#user_email').removeClass("is-valid");
				$('#user_email').addClass("is-invalid");
			} else {
				let sendData =  {'user_email': value };
				var promise = new Promise(function(resolve, reject) {
			$.ajax({
					type : "post",
					dataType : "text",
					data : sendData,
					url : "${memberPath}/checkDupEmail",
					success : function(data) {
						resolve(data);
						if (data == "true") { // 중복일경우
							console.log('중복');
							emailCheck = false;
							$('.invalid-feedback').text('이미 등록된 이메일 입니다');
							$('.invalid-feedback').show();
							$('.valid-feedback').hide();
							$("#user_email").removeClass("is-valid");
							$("#user_email").addClass("is-invalid");
						} else { // 중복아닐경우
							console.log('중복노')
							emailCheck = true;
							// 	                		$("#user_email").removeClass("is-invalid");
							// 	      					$("#user_email").addClass("is-valid");
						}
					}
				});
			});
		
				
				promise.then(function(value) {
				if (value == "false") {
					$('.valid-feedback').text("");
 		 			$('#user_email').removeClass("is-invalid");
 		 			$('#user_email').addClass("is-valid");
 		 			$('.invalid-feedback').hide();
 					$('.valid-feedback').show();
 		 			$('#confirmEmail').attr('disabled', false);
					$.ajax({
	 	                type: "post",
	 	                dataType: "text",
	 	                data: sendData,
	 	                url: "${memberPath}/emailAuth",
	 	               success : function(data) {
	 	            	 $('.valid-feedback').text("인증번호가 전송 되었습니다.");
	 	            	console.log('authNum', data)
		 	 				if($('#confirmEmail').hasClass('is-invalid')) {
		 	 					$('#confirmEmail').removeClass('is-invalid')
		 	 				}
		 	            	authNum = data; 
		 	 		        emailCheck2 = true;
	 	                },
	 	                error : function() {
	 	             	   emailCheck2 = false;
	 	             	   alert('통신오류');
	 	                }
	 				});
				}
			});

			
		}

	}
	
	function checkAuthNum() {
		console.log('인증번호확인', authNum);
		var val = $('#confirmEmail').val();
			if(val == authNum){
				console.log('일치');
				emailCheck2 = true;
				$('.valid-feedback').text("인증이 성공했습니다.");
				$('.invalid-feedback').hide();
				$('.valid-feedback').show();
				$('#confirmEmail').removeClass("is-invalid");
				$('#confirmEmail').addClass("is-valid");
			}else{
				console.log('불일치')
				emailCheck2 = false;
				$('.invalid-feedback').text("인증번호를 다시 확인해주세요.");
				$('.invalid-feedback').show();
				$('.valid-feedback').hide();
				$('#confirmEmail').removeClass("is-valid");
				$('#confirmEmail').addClass("is-invalid");
			}
	}
	
	function validate() {
		console.log('emailval', emailCheck);
		console.log('emailval2', emailCheck2);
		var val = $('#confirmEmail').val();
		if (val.trim() == "" || val == null) {
			$(".invalid-feedback").text("인증이 필요합니다.");
			$('.invalid-feedback').show();
			$('.valid-feedback').hide();
			return false;
		} else if (!emailCheck || !emailCheck2) {
			return false;
		}
	}
	</script>
</body>
</html>