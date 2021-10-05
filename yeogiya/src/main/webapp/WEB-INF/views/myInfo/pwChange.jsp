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
	<title>pwChange</title>
	<style>
	div.form-group{
		width: 500px;
	}
	@media screen and (max-width: 750px){
		div.form-group{
			width: 90%;
		}
	}
	
	a:hover {
    color: var(--pink);
	}
	
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container myInfo-container my-4">
		<p class="h4 mb-5 text-center">비밀번호 변경</p>
		<form action="updateRun" method="post" onsubmit="return validate();">
			<div class="form-group mx-auto">
	            <!-- 현재 비밀번호 -->
	    		<div class="form-group">
	                <label for="old_user_pw" class="font-weight-500 col-form-label">현재 비밀번호</label>
	                <input type="password" class="form-control" id="currPw" name="currPw" autocomplete="off">
	            	<div class='invalid-feedback curr-feedback'>현재 비밀번호가 올바르지 않습니다.</div>
	            </div>
				<!-- 새 비밀번호 -->
	    		<div class="form-group mb-0">
	                <label for="user_pw" class="font-weight-500 col-form-label">새 비밀번호</label>
	                <input type="password" class="form-control" id="user_pw" name="user_pw" autocomplete="off">
	                <div class='invalid-feedback pw-feedback'>8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>
	            </div>
				<!-- 새 비밀번호 확인 -->
	    		<div class="form-group">
	                <label for="confirmPassword" class="font-weight-500 col-form-label">새 비밀번호 재확인</label>
	                <input type="password" class="form-control" id="cfrmPw" name="cfrmPw" autocomplete="off">
	                <div class='invalid-feedback cpw-feedback'>새 비밀번호가 일치하지 않습니다.</div>
	            </div>
	            <div class="text-center pt-5">
					<button type="submit" class="btn btn-pink">수정</button>
					<a class="btn btn-pink-outline" href="${contextPath}/me">취소</a>
				</div>
			</div>
			<input type="hidden" name="act" value="${bs.act}"/>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
	<script>
	var validateCheck = {
            "currPw" : false,
            "pw1" : false,
            "pw2" : false
        }
	
	$('input').on('blur', function( ) {
		console.log('bldf');
		let value = $(this).val();
//	 		console.log($(this).attr('id'));
		var id = $(this).attr('id');
 		if(value.trim() == "" || value == null) {
//	 			console.log('없음')
 			$(this).siblings(".invalid-feedback").text("필수 정보입니다.");
			$(this).removeClass("is-valid");
			$(this).addClass("is-invalid");
			switch(id) {
			case 'currPw' :
				validateCheck.currPw = false;
				break;
			case 'user_pw' :
				validateCheck.pw1 = false;
				break;
			case 'confirmPassword' :
				validateCheck.pw2 = false;
				break;
			}
 		} else {
 			var pwReg = /^[A-Za-z0-9]{8,16}$/; // 대소문자 또는 숫자 8~16자
 			switch(id) {
 			case 'currPw' :
 	 			if(!value.match(pwReg) ){
 	 				validateCheck.currPw = false;
 	 				$('.curr-feedback').text("8~16자의 영문 대 소문자, 숫자만 사용 가능합니다.");
 	 				$(this).removeClass("is-valid");
 	 				$(this).addClass("is-invalid");
 	 			} else{
 	 				$.ajax({
 	 	                type: "post",
 	 	                dataType: "text",
 	 	                data: {
 	 	                	'currPw': value 
 	 	                },
 	 	                url: "${contextPath}/me/checkPw",
 	 	                success: function (data) {
 	 	                	if(data=="true"){	// 같음
 	 	                		console.log('중복');
 	 	                		validateCheck.currPw = true;
 	 	                		$("#currPw").removeClass("is-invalid");
 	 	      					$("#currPw").addClass("is-valid");
 	 	                	}else{				// 다름
 	 	                		console.log('중복노')
 	 	                		validateCheck.currPw = false;
 	 	                		$('.curr-feedback').text('현재 비밀번호가 올바르지 않습니다.');
 	 	                		$("#currPw").removeClass("is-valid");
 	 	      					$("#currPw").addClass("is-invalid");	
 	 	                		
 	 	                	}
 	 	                }
 	 				});
 	 			}
 				break;
 			case 'user_pw' :
 	 			if(!value.match(pwReg) ){
 	 				validateCheck.pw1 = false;
 	 				console.log('비번', validateCheck.pw1);
 	 				console.log('비번확인', validateCheck.pw2);
 	 				$('.pw-feedback').text("8~16자의 영문 대 소문자, 숫자만 사용 가능합니다.");
 	 				$(this).removeClass("is-valid");
 	 				$(this).addClass("is-invalid");
 	 			} else{
 	 				validateCheck.pw1 = true;
 	 				console.log('비번', validateCheck.pw1);
 	 				$(this).removeClass("is-invalid");
 	 				$(this).addClass("is-valid");
 	 				if($('#cfrmPw').hasClass('is-valid')) {
 	 					checkPw();
 	 				}
 	 			}
				break;
 			case 'cfrmPw' :
 				checkPw();
 				break;
 			}
 		}
	});
	
	function checkPw() {
		if ($("#user_pw").val() == $("#cfrmPw").val()) {
			console.log('일치');
			validateCheck.pw2 = true;
			console.log('비번확인', validateCheck.pw2);
			$("#cfrmPw").removeClass("is-invalid");
			$("#cfrmPw").addClass("is-valid");
		} else {
			console.log('불일치')
			validateCheck.pw2 = false;
			console.log('비번확인', validateCheck.pw2);
			$("#cfrmPw").removeClass("is-valid");
			$("#cfrmPw").addClass("is-invalid");
		}
	}
	
	function validate() {
		$('input').each(function() {
			let value = $(this).val();
			var id = $(this).attr('id');
			if (value.trim() == "" || value == null) {
				console.log('없음')
				$(this).siblings(".invalid-feedback").text("필수 정보입니다.");
				$(this).removeClass("is-valid");
				$(this).addClass("is-invalid");
				switch (id) {
				case 'currPw':
					validateCheck.currPw = false;
					break;
				case 'user_pw':
					validateCheck.pw1 = false;
					break;
				case 'cfrmPw':
					validateCheck.pw2 = false;
					break;
				}
			}
		});
		var valArr = Object.values(validateCheck);
		for (var i = 0; i < valArr.length; i++) {
			if (!valArr[i]) {
				return false;
			}
		}
	}
	</script>
</body>
</html>