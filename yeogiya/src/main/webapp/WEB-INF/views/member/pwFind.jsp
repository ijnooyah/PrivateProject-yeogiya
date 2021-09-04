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
		width: 450px;
		padding: 5rem 0;
	}
	</style>
</head>
<body>
	<div class="container">
		<div class="text-center mb-5">
			<a href="${contextPath}/" class="logo">여기야!</a>
		</div>
		<form action="" method="post">
			<div class="h4 text-center">비밀번호 찾기</div>
			<div class="small text-center my-3">회원정보에 등록한 이메일 주소를 입력해주세요.</div>
			
			<div class="mb-2 row">
				<label for="user_id" class="font-weight-500 col-sm-2 col-form-label">아이디</label>
				<div class="col-sm-7">
			     	<input type="text" id="user_id" name="user_id" class="form-control" required>
				    <div class='invalid-feedback'>등록되지 않은 아이디입니다. 다시 확인해 주세요.</div>
	    		</div>
			</div>
			<div class="mb-2 row">
			    <label for="user_email" class="font-weight-500 col-sm-2 col-form-label">이메일</label>
			    <div class="col-sm-7">
				     <input type="tel" class="form-control" id="user_email" name="user_email" placeholder="yeogiya@naver.com" required />
	    		</div>
		    	<button type="button" class="btn btn-pink col-sm-3">인증번호 받기</button>
	    	</div>
			<div class="mb-2 row">
				<div class="col-sm-2"></div>
				<div class="col-sm-7">
				    <input type="text" class="form-control" name="confirmEmail" placeholder="인증번호 입력" id="confirmEmail">
				    <div class='invalid-feedback'>인증번호가 일치하지 않습니다.</div>
				    <div class="valid-feedback">인증번호 확인완료</div>
	    		</div>
	    	</div>
<!-- 			<div class="invalid-feedback text-center mb-3">등록되지 않은 아이디입니다. 다시 확인해 주세요.</div> -->
			<div class="mt-4 row">
				<button type="button" class="btn btn-pink btn-block">다음</button>
			</div>
		</form>
	</div>
<%@ include file="../cdn/js.jsp" %>
	<script>
	</script>
</body>
</html>