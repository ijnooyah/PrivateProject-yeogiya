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
	<title>emailChangePw</title>
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
		<p class="h4 mb-5 text-center">비밀번호 변경</p>
		<form name="" method="post">
			<div class="form-group mx-auto">
	            <!-- 현재 비밀번호 -->
	    		<div class="form-group">
	                <label for="old_user_pw" class="font-weight-500 col-form-label">현재 비밀번호</label>
	                <input type="password" class="form-control" id="old_user_pw" autocomplete="off" required>
	            	<div class='invalid-feedback opw-feedback'>현재 비밀번호가 올바르지 않습니다.</div>
	            </div>
				<!-- 새 비밀번호 -->
	    		<div class="form-group mb-0">
	                <label for="user_pw" class="font-weight-500 col-form-label">새 비밀번호</label>
	                <input type="password" class="form-control" id="user_pw" name="user_pw" autocomplete="off" required>
	                <div class='invalid-feedback pw-feedback'>8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>
	            </div>
				<!-- 새 비밀번호 확인 -->
	    		<div class="form-group">
	                <label for="confirmPassword" class="font-weight-500 col-form-label">새 비밀번호 재확인</label>
	                <input type="password" class="form-control" id="confirmPassword" name="user_pw" autocomplete="off" required>
	                <div class='invalid-feedback cpw-feedback'>새 비밀번호가 일치하지 않습니다.</div>
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