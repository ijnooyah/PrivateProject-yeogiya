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
		.myInfo-container {
			width: 500px;
			padding: 5rem 0;
		}	
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container myInfo-container my-4">
		<div class="container">
		<form action="" method="post">
			<div class="h4 text-center mb-5">이메일 주소 변경</div>
			<div class="mb-2 row">
			    <label for="user_email" class="font-weight-500 col-sm-2 col-form-label">이메일</label>
			    <div class="col-sm-7">
				     <input type="tel" class="form-control" id="user_email" name="user_email" placeholder="yeogiya@naver.com" required />
	    		</div>
		    	<button type="button" class="btn btn-pink col-sm-3">인증번호 받기</button>
	    	</div>
			<div class="mb-2">
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-7">
					    <input type="text" class="form-control" name="confirmEmail" placeholder="인증번호 입력" id="confirmEmail">
		    		</div>
		    		<button type="button" class="btn btn-pink col-sm-3">인증번호 확인</button>
				</div>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-7">
					    <div class='invalid-feedback'>인증번호가 일치하지 않습니다.</div>
					    <div class="valid-feedback">인증번호 확인완료</div>
		    		</div>
		    		<div class="col-sm-3"></div>
				</div>
	    	</div>
			<div class="mt-4 row">
				<button type="button" class="btn btn-pink btn-block">다음</button>
			</div>
		</form>
	</div>
	</div>
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
	<script>

	</script>
</body>
</html>