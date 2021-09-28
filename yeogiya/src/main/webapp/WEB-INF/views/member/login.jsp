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
	
	.red-feedback {
		color:var(--danger);
		font-size: 80%;
/* 		text-align: center; */
		margin-top: .25rem;
		margin-left: .25rem;
	}
	
	</style>
</head>
<body>
	<div class="container">
		<div class="text-center mb-5">
			<a href="" class="logo text-pink">여기야!</a>
		</div>
		<form method="post" action="loginRun" id="frmLogin">
			<div class="h4 text-center">로그인</div>
			<input type="text" id="user_id" name="user_id" placeholder="아이디" class="form-control" value="${cookie.saveId.value}" required autofocus spellcheck="false">
			<input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="비밀번호" required>
		    <div class="custom-control custom-checkbox mt-2">
				  <input class="custom-control-input" type="checkbox" name="saveId" id="saveId">
				  <label class="custom-control-label" for="saveId">
				 	아이디 저장
				  </label>
<!-- 				  <input type="hidden" name="saveId"/> -->
			</div>
			<c:if test="${msg == 'fail'}">
				<div class='wronglogin red-feedback'> 
					아이디 또는 비밀번호가 잘못 입력 되었습니다.<br>
					<b>아이디</b>와 <b>비밀번호</b>를 정확히 입력해 주세요.
				</div>
			</c:if>
			<div class='emptylogin red-feedback' style="display:none;"> 
				<b>아이디</b>를 입력해 주세요.
			</div>
			<button class="btn btn-block btn-pink mt-3" type="button" onclick="validate();">로그인</button>
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
	function validate() {
// 		if($('#saveId').prop('checked')) {
// 			$('input[name=saveId]').val('on');
// 		} else {
// 			$('input[name=saveId]').val('');
// 		}
		$('.wronglogin').hide();
		if($('#user_id').val().trim() == "" || $('#user_id').val() == null) {
			$('#user_id').focus();
			$('.emptylogin').show();
			$('.emptylogin').html('<b>아이디</b>를 입력해 주세요.');
		} else if ($('#user_pw').val().trim() == "" || $('#user_pw').val() == null) {
			$('#user_pw').focus();
			$('.emptylogin').show();
			$('.emptylogin').html('<b>비밀번호</b>를 입력해 주세요.');
		} else {
			$('.emptylogin').hide();
			$('#frmLogin').submit();
		}
	}
	</script>
</body>
</html>