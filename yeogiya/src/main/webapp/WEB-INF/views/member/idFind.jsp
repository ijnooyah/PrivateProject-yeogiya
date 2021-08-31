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
		width: 330px;
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
			<div class="h4 text-center">아이디 찾기</div>
			<div class="small text-center my-3">회원정보에 등록한 이름과 이메일 주소를 입력해 주세요.</div>
			
			<div class="form-group row">
				<label for="user_name" class="font-weight-500 col-sm-3 col-form-label">이름</label>
				<div class="col-sm-9">
					<input type="text" id="user_name" name="user_name" class="form-control" required>
				</div>
			</div>
			<div class="form-group row">
				<label for="user_name" class="font-weight-500 col-sm-3 col-form-label">이메일</label>
				<div class="col-sm-9">
					<input type="email" id="user_email" name="user_email" class="form-control" required>
				</div>
			</div>
			<div class="form-group text-center">
				<button type="submit" class="btn btn-pink">다음</button>
			</div>
		</form>
	</div>
<%@ include file="../cdn/js.jsp" %>
	<script>
	</script>
</body>
</html>