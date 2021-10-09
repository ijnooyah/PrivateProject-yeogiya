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
	<title>deleteAccount</title>
	<style>
	.container {
		width: 400px;
		padding: 5rem 0;
	}
	
	</style>
</head>
<body>
	<div class="container myInfo-container my-5">
		<div class="text-center mb-5">
			<a href="${contextPath}" class="logo text-pink">여기야!</a>
		</div>
		<form action="" method="post" class="my-2">
			<div class="h4 text-center">회원탈퇴 완료</div>
			<div class="small text-center my-3">다음에 또 만나요!</div>
			<div class="mt-4 row">
				<a href="${contextPath}" class="btn btn-pink btn-block">메인으로</a>
			</div>
		</form>
	</div>
	<%@ include file="../cdn/js.jsp" %>
	<script>

	</script>
</body>
</html>