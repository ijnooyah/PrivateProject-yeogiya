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
	<title>deleteAccountPw</title>
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
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container myInfo-container my-4">
		<p class="h4 mb-5 text-center">회원정보 수정</p>
		<form name="joinRun" method="post">
			<div class="form-group mx-auto">
				<!-- 아이디  -->
				<div class="form-group">
	                <label for="user_id" class="font-weight-500 col-form-label">아이디</label>
	                <input type="text" class="form-control" value="ijnooyah" readonly>
	            </div>
	            <!-- 비밀번호 -->
<!-- 	    		<div class="form-group"> -->
<!-- 	                <label for="user_pw" class="font-weight-500 col-form-label">비밀번호</label> -->
<!-- 	                <input type="password" class="form-control" id="user_pw" name="user_pw" autocomplete="off" required> -->
<!-- 	            	<div class='invalid-feedback pw-feedback'>8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div> -->
<!-- 	            </div> -->
				<!-- 비밀번호 확인 -->
<!-- 	    		<div class="form-group"> -->
<!-- 	                <label for="confirmPassword" class="font-weight-500 col-form-label">비밀번호 재확인</label> -->
<!-- 	                <input type="password" class="form-control" id="confirmPassword" name="user_pw" autocomplete="off" required> -->
<!-- 	                <div class='invalid-feedback cpw-feedback'>비밀번호가 일치하지 않습니다.</div> -->
<!-- 	            </div> -->
	            <!-- 이름 -->
	    		<div class="form-group">
	                <label for="user_name" class="font-weight-500 col-form-label">이름</label>
	                <input type="text" class="form-control" value="하윤지" readonly>
	            </div>
				<!-- 닉네임 -->
<!-- 	    		<div class="form-group"> -->
<!-- 	                <label for="user_nick" class="font-weight-500 col-form-label">닉네임</label> -->
<!-- 	                <input type="text" class="form-control" id="user_nick" name="user_nick" autocomplete="off" required> -->
<!-- 	                <div class='invalid-feedback name-feedback'>이미 사용중인 닉네임 입니다.</div> -->
<!-- 	            </div> -->
	            <!-- 지역 -->
	    		<div class="form-group">
	                <label for="" class="font-weight-500 col-form-label">지역</label>
	               	<div class="d-flex mb-2">
	               		<select class="form-control mr-1" id="district">
							<option value="" selected>울산</option>
						</select>
						<select class="form-control mr-1" id="city">
							<option value="" selected>동구</option>
						</select>
				    </div>
	            </div>
		    	<!-- 휴대전화 -->
				<div class="form-group">
					<label for="user_phone" class="font-weight-500 col-form-label">휴대전화</label>
	                <input type="text" class="form-control" id="user_phone" name="user_phone" 
	                	placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" autocomplete="off" required>
	                <div class='invalid-feedback phone-feedback'>유효하지 않은 번호 입니다.</div>
		    	</div>
		    	<!-- 이메일 -->
<!-- 				<div class="form-group"> -->
<!-- 					<label for="user_email" class="font-weight-500 col-form-label">이메일</label> -->
<!-- 				    <div class="form-row mb-2"> -->
<!-- 				    	<div class="col-sm-8"> -->
<!-- 						    <input type="email" class="form-control" name="user_email" id="user_email" placeholder="yeogiya@naver.com" -->
<!-- 						     pattern="/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i"  autocomplete="off" required> -->
<!-- 				    	</div> -->
<!-- 				    	<div class="col-sm-4"> -->
<!-- 					    	<button type="button" class="btn btn-pink w-100">인증번호 받기</button> -->
<!-- 				    	</div> -->
<!-- 				   		<div class='invalid-feedback email-feedback'>유효하지 않은 이메일 입니다.</div> -->
<!-- 				    </div> -->
<!-- 	                <input type="text" class="form-control" id="confirmEmail" placeholder="인증번호 입력" required> -->
<!-- 			      	<div class='invalid-feedback'>인증번호가 일치하지 않습니다.</div> -->
<!-- 			      	<div class="valid-feedback">인증번호 확인완료</div> -->
<!-- 		    	</div> -->
				<!-- 성별 -->
				<div class="form-group">
	              <label for="user_gender" class="font-weight-500 col-form-label">성별</label>
				  <br>
	               <div class="custom-control custom-radio custom-control-inline">
						  <input class="custom-control-input" type="radio" name="user_gender" id="male" value="M" checked disabled>
						  <label class="custom-control-label" for="male">남자</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
						  <input class="custom-control-input" type="radio" name="user_gender" id="female" value="F" disabled>
						  <label class="custom-control-label" for="female">여자</label>
					</div>
	            </div>
	            <div class="text-center pt-5">
					<button type="submit" class="btn btn-pink">수정</button>
					<button class="btn btn-pink-outline">취소</button>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
	<script>

	</script>
</body>
</html>