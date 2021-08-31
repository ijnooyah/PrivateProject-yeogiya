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
	<title>signUp</title>
	<style>
	div.form-group{
		width: 500px;
	}
	@media screen and (max-width: 750px){
		div.form-group{
			width: 90%;
		}
	}
	
	a:hover {
    color: var(--pink);
	}
	
	</style>
</head>
<body>
	<div class="container">
		<div class="text-center mb-5">
			<a href="" class="logo">여기야!</a>
		</div>
		<form name="joinRun" method="post">
		<div class="form-group mx-auto">
			<!-- 아이디  -->
			<div class="form-group">
                <label for="user_id" class="font-weight-500 col-form-label">아이디</label>
                <input type="text" class="form-control" id="user_id" name="user_id" autocomplete="off" required>
               	<div class='invalid-feedback id-feedback'>이미 사용중이거나 탈퇴한 아이디입니다.</div>
            </div>
	    	<!-- 비밀번호  -->
    		<div class="form-group">
                <label for="user_pw" class="font-weight-500 col-form-label">비밀번호</label>
                <input type="password" class="form-control" id="user_pw" name="user_pw" autocomplete="off" required>
            	<div class='invalid-feedback pw-feedback'>8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>
            </div>
	    	<!-- 비밀번호 확인 -->
    		<div class="form-group">
                <label for="confirmPassword" class="font-weight-500 col-form-label">비밀번호 재확인</label>
                <input type="password" class="form-control" id="confirmPassword" name="user_pw" autocomplete="off" required>
                <div class='invalid-feedback cpw-feedback'>비밀번호가 일치하지 않습니다.</div>
            </div>
            <!-- 이름 -->
    		<div class="form-group">
                <label for="user_name" class="font-weight-500 col-form-label">이름</label>
                <input type="text" class="form-control" id="user_name" name="user_name" autocomplete="off" required>
                <div class='invalid-feedback name-feedback'>한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</div>
            </div>
            <!-- 닉네임 -->
    		<div class="form-group">
                <label for="user_nick" class="font-weight-500 col-form-label">닉네임</label>
                <input type="text" class="form-control" id="user_nick" name="user_nick" autocomplete="off" required>
                <div class='invalid-feedback name-feedback'>이미 사용중인 닉네임 입니다.</div>
            </div>
	    	<!-- 휴대전화 -->
			<div class="form-group">
				<label for="user_phone" class="font-weight-500 col-form-label">휴대전화</label>
                <input type="text" class="form-control" id="user_phone" name="user_phone" 
                	placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" autocomplete="off" required>
                <div class='invalid-feedback phone-feedback'>유효하지 않은 번호 입니다.</div>
	    	</div>
	    	<!-- 이메일 -->
			<div class="form-group">
				<label for="user_email" class="font-weight-500 col-form-label">이메일</label>
			    <div class="form-row mb-2">
			    	<div class="col-sm-8">
					    <input type="email" class="form-control" name="user_email" id="user_email" placeholder="yeogiya@naver.com"
					     pattern="/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i"  autocomplete="off" required>
			    	</div>
			    	<div class="col-sm-4">
				    	<button type="button" class="btn btn-pink w-100">인증번호 받기</button>
			    	</div>
			   		<div class='invalid-feedback email-feedback'>유효하지 않은 이메일 입니다.</div>
			    </div>
                <input type="text" class="form-control" id="confirmEmail" placeholder="인증번호 입력" required>
		      	<div class='invalid-feedback'>인증번호가 일치하지 않습니다.</div>
		      	<div class="valid-feedback">인증번호 확인완료</div>
	    	</div>
			<!-- 성별 -->
			<div class="form-group">
              <label for="user_gender" class="font-weight-500 col-form-label">성별</label>
			  <br>
               <div class="custom-control custom-radio custom-control-inline">
					  <input class="custom-control-input" type="radio" name="user_gender" id="male" value="M">
					  <label class="custom-control-label" for="male">남자</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
					  <input class="custom-control-input" type="radio" name="user_gender" id="female" value="F">
					  <label class="custom-control-label" for="female">여자</label>
				</div>
            </div>
            <!-- 가입완료 버튼 -->
			<button type="button" class="btn btn-pink btn-lg btn-block mt-4">가입하기</button>
		</div>
	</form>
	<div class="text-center mb-5" >
		<span class="font-weight-400">
		    이미 아이디가 있으신가요?
		</span>
		<a href="${contextPath}/member/login" class="font-weight-700 pink-color">로그인</a>
	</div>
	</div>
	<%@ include file="../cdn/js.jsp" %>
	<script>

	</script>
</body>
</html>