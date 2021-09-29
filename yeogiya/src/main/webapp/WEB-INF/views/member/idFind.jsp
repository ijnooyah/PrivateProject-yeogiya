<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../cdn/css.jsp" %>
<title>idFind</title>
	<style>
	.container{
		width: 350px;
		padding: 5rem 0;
	}
	</style>
</head>
<body>
	<div class="container">
		<div class="text-center mb-5">
			<a href="" class="logo text-pink">여기야!</a>
		</div>
		<form action="" method="post" onsubmit="return validate();">
			<div class="h4 text-center">아이디 찾기</div>
			<div class="small text-center my-3">회원정보에 등록한 이름과 이메일 주소를 입력해 주세요.</div>
			
			<div class="form-group d-flex flex-wrap">
				<label for="user_name" class="font-weight-500 col-form-label pr-3">이름</label>
				<input type="text" id="user_name" name="user_name" class="form-control col-sm-9 ml-auto mb-3">
				<label for="user_name" class="font-weight-500 col-form-label">이메일</label>
				<input type="text" id="user_email" name="user_email" class="form-control col-sm-9 ml-auto mb-3">
				<div class='invalid-feedback' ${msg == 'fail' ? 'style="display:block;"' : '' }>
					<c:if test="${msg == 'fail'}">
						아이디 또는 비밀번호가 잘못 입력 되었습니다.<br>
						<b>아이디</b>와 <b>비밀번호</b>를 정확히 입력해 주세요.
					</c:if>
				</div>
			</div>
			<div class="mt-4 row">
				<button type="submit" class="btn btn-pink btn-block">다음</button>
			</div>
		</form>
	</div>
<%@ include file="../cdn/js.jsp" %>
	<script>
	var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	function validate() {
		if($('#user_name').val().trim() == "" || $('#user_name').val() == null) {
			$('#user_name').focus();
			$('.invalid-feedback').html('<b>이름</b>을 입력해 주세요.');
			$('#user_name').removeClass('is-valid');
			$('#user_name').addClass('is-invalid');
			return false;
		} else if ($('#user_email').val().trim() == "" || $('#user_email').val() == null) {
			$('#user_email').focus();
			$('.invalid-feedback').html('<b>이메일</b>을 입력해 주세요.');
			$('#user_email').removeClass('is-valid');
			$('#user_email').addClass('is-invalid');
			return false;
		} else if(!$('#user_email').val().match(emailReg)) {
			$('#user_email').focus();
			$('.invalid-feedback').text("유효하지 않은 이메일 형식 입니다.");
			$('#user_email').removeClass("is-valid");
			$('#user_email').addClass("is-invalid");
			return false;
		} else {
			
		}
		
	}
	</script>
</body>
</html>