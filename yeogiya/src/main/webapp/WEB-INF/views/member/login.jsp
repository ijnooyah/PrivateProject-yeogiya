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
	<title>login</title>
	<style>
	
	.container{
		width: 330px;
		padding: 5rem 0;
	}
	
/* 	로고 */
	a.logo{
		font-size: 4rem;
		text-decoration: none;
	}
	
	.container input[type="text"]{
		margin-bottom: -1px;
		border-bottom-right-radius: 0;
		border-bottom-left-radius: 0;
	}
	.container input[type="password"]{
		border-top-right-radius: 0;
		border-top-left-radius: 0;
	}
	
	.custom-checkbox input, .custom-checkbox label {
		transform:scale(.8);
	}
	
	
	</style>
</head>
<body>
	<div class="container">
		<div class="text-center mb-5">
			<a href="" class="logo">여기야!</a>
		</div>
		<form method="post" action="loginRun">
			<div class="h4 text-center">로그인</div>
			<input type="text" id="user_id" name="user_id" placeholder="아이디" class="form-control" required autofocus spellcheck="false">
			<input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="비밀번호" required>
		    <div class="custom-control custom-checkbox mt-2">
				  <input class="custom-control-input" type="checkbox" name="saveId" id="saveId">
				  <label class="custom-control-label" for="saveId">
				 	아이디 저장
				  </label>
			</div>
			<div class='invalid-feedback mt-2'> 
				아이디 또는 비밀번호가 잘못 입력 되었습니다.<br>
				<b>아이디</b>와 <b>비밀번호</b>를 정확히 입력해 주세요.
			</div>
			<button class="btn btn-block btn-pink mt-3" type="submit">로그인</button>
			<ul class="find_wrap" id="find_wrap">
				<li><a 
					href=""
					class="find_text">비밀번호 찾기</a></li>
				<li><a 
					href=""
					class="find_text">아이디 찾기</a></li>
				<li><a 
					href=""
					class="find_text">회원가입</a></li>
			</ul>
			<!-- sns간편로그인 -->
		</form>
	</div>
	<%@ include file="../cdn/js.jsp" %>
	<script>

	</script>
</body>
</html>