<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../cdn/css.jsp" %>
<title>Insert title here</title>
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
			<a href="" class="logo">여기야!</a>
		</div>
		<form action="" method="post">
			<div class="h4 text-center mb-4">비밀번호 재설정</div>
			<div class="form-group row">
				<label for="user_pw" class="font-weight-500 col-sm-4 col-form-label">비밀번호</label>
				<div class="col-sm-8">
					<input type="password" id="user_pw" name="user_pw" class="form-control" required>
					<div class='invalid-feedback pw-feedback'>8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="confirmPassword" class="font-weight-500 col-sm-4 col-form-label">비밀번호 확인</label>
				<div class="col-sm-8">
					<input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
					<div class='invalid-feedback cpw-feedback'>비밀번호가 일치하지 않습니다.</div>
				</div>
			</div>
			<div class="mt-4 row">
				<button type="button" class="btn btn-pink btn-block">비밀번호 변경</button>
			</div>
		</form>
	</div>
<%@ include file="../cdn/js.jsp" %>
	<script>
	</script>
</body>
</html>