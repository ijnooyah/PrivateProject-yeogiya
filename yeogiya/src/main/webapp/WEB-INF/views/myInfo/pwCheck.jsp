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
	<title>pwCheck</title>
	<style>
	.myInfo-container {
		width: 330px;
		padding: 5rem 0;
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
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container myInfo-container my-4">
		<form action="" method="post" onsubmit="return validate();">
			<div class="h4 text-center">비밀번호 재확인</div>
			<div class="small text-center my-3">정보 수정을 위해 비밀번호를 입력해주세요.</div>
			
			<div class="form-group row">
				<label for="chkPw" class="font-weight-500 col-sm-3 col-form-label">비밀번호</label>
				<div class="col-sm-9">
					<input type="password" id="chkPw" name="chkPw" class="form-control">
					<div class="red-feedback" ${msg == 'fail' ? '' : 'display:none;'}>${msg == 'fail' ? '비밀번호가 올바르지 않습니다.' : ''}</div>
				</div>
			</div>
			<div class="mt-4 row">
				<button type="submit" class="btn btn-pink btn-block">다음</button>
			</div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
	<script>
	function validate() {
		if($('#chkPw').val().trim() == "" || $('#chkPw').val() == null) {
			$('#chkPw').focus();
			$('.red-feedback').text("비밀번호를 입력해 주세요.");
			$('.red-feedback').show();
			return false;
		} 
	}
	</script>
</body>
</html>