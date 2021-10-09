<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../cdn/css.jsp" %>
<title>pwFind</title>
	<style>
	.container{
		width: 400px;
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
	<div class="container">
		<div class="text-center mb-5">
			<a href="${contextPath}" class="logo text-pink">여기야!</a>
		</div>
		<form action="pwFindRun" method="post" onsubmit="return validate();">
			<div class="h4 text-center">비밀번호 찾기</div>
			<div class="small text-center my-3">비밀번호를 찾고자 하는 아이디를 입력해 주세요.</div>
			<div class="mb-2 row">
				<label for="user_id" class="font-weight-500 col-sm-3 col-form-label">아이디</label>
				<div class="col-sm-9">
			     	<input type="text" id="user_id" name="user_id" class="form-control" autofocus>
				    <div class='invalid-feedback'>아이디를 입력해 주세요.</div>
				    <c:if test="${msg == 'fail'}">
						<div class='red-feedback'> 
							입력하신 아이디를 찾을 수 없습니다.
						</div>
					</c:if>
	    		</div>
			</div>
			<div class="mt-4 row">
				<button type="submit" class="btn btn-pink btn-block">다음</button>
			</div>
		</form>
	</div>
<%@ include file="../cdn/js.jsp" %>
	<script>
	function validate () {
		if($('#user_id').val().trim() == "" || $('#user_id').val() == null){
			$('#user_id').focus();
			$('#user_id').addClass('is-invalid');
			return false;
		} else {
			return true;
		}
	}
	</script>
</body>
</html>