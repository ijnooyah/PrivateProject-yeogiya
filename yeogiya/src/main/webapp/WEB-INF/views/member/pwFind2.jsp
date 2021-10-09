<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../cdn/css.jsp" %>
<title>pwFind</title>
	<style>
	.container{
		width: 400px;
		padding: 5rem 0;
	}
	</style>
</head>
<body>
	<div class="container">
		<div class="text-center mb-5">
			<a href="${contextPath}" class="logo text-pink">여기야!</a>
		</div>
		<form action="pwFindRun" method="post" onsubmit="return validate();">
			<div class="h4 text-center">비밀번호 찾기</div>
			<div class="small text-center my-3">회원정보에 등록한 이메일 주소를 입력해주세요.</div>
			<div class="mb-2 row">
				<input type="text" class="form-control required" name="user_email" id="user_email" 
			           placeholder="yeogiya@naver.com" spellcheck="false">
				<div class="invalid-feedback">등록되지 않은 메일주소입니다. 다시 확인해 주세요.</div>
				<div class="valid-feedback">안내 메일이 발송 되었습니다. 메일함을 확인해 주세요.</div>
	    	</div>
			<div class="mt-4 row">
				<button type="submit" class="btn btn-pink btn-block">안내메일 발송</button>
			</div>
		</form>
	</div>
<%@ include file="../cdn/js.jsp" %>
	<script>
	function validate() {
		var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var value = $('#user_email').val();
		if(value.trim() == "" || value == null) {
			$('.invalid-feedback').text("이메일 주소를 입력해 주세요.");
			$('#user_email').removeClass("is-valid");
			$('#user_email').addClass("is-invalid");
			return false;
		} else if(!value.match(emailReg) ){
			$('.invalid-feedback').text("유효하지 않은 이메일 형식 입니다.");
			$('#user_email').removeClass("is-valid");
			$('#user_email').addClass("is-invalid");
			return false
		} else if('${existMember.user_email}' != value){
			$('.invalid-feedback').text("등록되지 않은 메일주소입니다. 다시 확인해 주세요.");
			$('#user_email').removeClass("is-valid");
			$('#user_email').addClass("is-invalid");
			return false;
		} else {
// 			$('#user_email').siblings('.valid-feedback').text("안내 메일이 발송 되었습니다.");
			$('#user_email').removeClass("is-invalid");
			$('#user_email').addClass("is-valid");
			$.ajax({
	                type: "post",
	                dataType: "text",
	                headers : {
	    				"Content-Type" : "application/json"
	    			},
	    			method : "post", 
	    			data : JSON.stringify({'user_email': value,
	                	'user_id': '${existMember.user_id}'
					}),
	                url: "${memberPath}/emailGuide",
	               success : function(data) {
	            	console.log('data', data)
	                },
	                error : function() {
	             	   alert('통신오류');
	                }
				});
			return false;
		}
		
	}
	
	</script>
</body>
</html>