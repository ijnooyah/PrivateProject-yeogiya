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
	<title>myInfoChange</title>
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
		<form name="" method="post">
			<div class="form-group mx-auto">
				<p class="h4 mb-3">필수정보</p>
				<!-- 아이디  -->
				<div class="form-group">
	                <label for="user_id" class="font-weight-500 col-form-label">아이디</label>
	                <input type="text" class="form-control" value="ijnooyah" readonly>
	            </div>
	            <!-- 이름 -->
	    		<div class="form-group">
	                <label for="user_name" class="font-weight-500 col-form-label">이름</label>
	                <input type="text" class="form-control" value="하윤지" readonly>
	            </div>
		    	<!-- 휴대전화 -->
				<div class="form-group">
					<label for="user_phone" class="font-weight-500 col-form-label">휴대전화</label>
	                <input type="text" class="form-control" id="user_phone" name="user_phone" 
	                	placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" autocomplete="off" required>
	                <div class='invalid-feedback phone-feedback'>유효하지 않은 번호 입니다.</div>
		    	</div>
		    		<p class="h4 pt-5 mb-3">선택정보</p>
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
            <!-- 지역 -->
    		<div class="form-group">
                <label for="" class="font-weight-500 col-form-label">지역</label>
               	<div class="font-size-080 mb-1">
	                <span class="font-weight-400">
					   지역이 존재 하지 않나요?
					</span>
					<a href="${contextPath}/customer" class="font-weight-500 text-pink">추가요청</a>
               	</div>
               	<div class="d-flex mb-2">
               		<select class="form-control mr-1" id="sortLocal" name="sort_local">
						<option value="0">상위 지역</option>
					</select>
					<select class="form-control" id="subLocal" name="sub_local">
						<option value="0">하위 지역</option>
					</select>
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