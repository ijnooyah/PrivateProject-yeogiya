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
	<title>signUpResult</title>
	<style>
	div.form-group{
		width: 500px;
	}
	@media screen and (max-width: 750px){
		div.form-group{
			width: 90%;
		}
	}
	</style>
</head>
<body>
	<div class="container my-5">
		<div class="text-center pt-5 mb-5">
			<a href="${contextPath}" class="logo text-pink">여기야!</a>
		</div>
		<form id="joinRun" method="post" action="joinRun">
		<div class="form-group mx-auto text-center">
			<p class="h4 mb-3">${member.user_name}님 환영합니다!</p>
			<p class="pb-3">여기야! 에서 지역별 인기장소를 공유하고 즐겨보세요!<br>
			 </p>
            <!-- 가입완료 버튼 -->
			<a type="button" href="${contextPath}/login" class="btn btn-pink btn-lg btn-block mt-5">시작하기</a>
		</div>
	</form>
	</div>
	<%@ include file="../cdn/js.jsp" %>
</body>
</html>