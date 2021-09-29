<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../cdn/css.jsp" %>
<title>idFindResult</title>
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
			<a href="" class="logo text-pink">여기야!</a>
		</div>
		<div class="text-center h4">아이디 조회 결과</div>
		<div class="text-center">회원님의 아이디는 <span class="text-pink font-weight-600"> ${id} </span>입니다.</div>
		<div class="form-row w-75 m-auto">
			<div class="col">
				<button class="btn btn-pink mt-4 w-100" type="button">메인</button>
			</div>
			<div class="col">
				<button class="btn btn-pink-outline mt-4 w-100" type="button">로그인</button>
			</div>
		</div>
	</div>
<%@ include file="../cdn/js.jsp" %>
	<script>
	</script>
</body>
</html>