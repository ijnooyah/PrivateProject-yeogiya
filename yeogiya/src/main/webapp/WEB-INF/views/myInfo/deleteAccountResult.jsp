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
	.myInfo-container {
		width: 330px;
		padding: 5rem 0;
	}
	
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container myInfo-container my-5">
		<form action="" method="post" class="my-2">
			<div class="h4 text-center">회원탈퇴 완료</div>
			<div class="small text-center my-3">다음에 또 만나요!</div>
			<div class="mt-4 row">
				<a type="button" class="btn btn-pink btn-block">메인으로</a>
			</div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
	<script>

	</script>
</body>
</html>