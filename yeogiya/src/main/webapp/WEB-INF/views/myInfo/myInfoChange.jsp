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
		<form action="updateRun" method="post" onsubmit="return validate();">
			<div class="form-group mx-auto">
				<p class="h4 mb-3">필수정보</p>
				<!-- 아이디  -->
				<div class="form-group">
	                <label for="user_id" class="font-weight-500 col-form-label">아이디</label>
	                <input type="text" class="form-control" name="user_id" value="${loginMember.user_id}" readonly>
	            </div>
	            <!-- 이름 -->
	    		<div class="form-group">
	                <label for="user_name" class="font-weight-500 col-form-label">이름</label>
	                <input type="text" class="form-control" name="user_name" value="${loginMember.user_name}" readonly>
	            </div>
		    	<!-- 휴대전화 -->
				<div class="form-group">
					<label for="user_phone" class="font-weight-500 col-form-label">휴대전화</label>
	                <input type="text" class="form-control required" id="user_phone" name="user_phone" 
                	placeholder="01012345678" spellcheck="false" value="${loginMember.user_phone}" required>
	                <div class='invalid-feedback phone-feedback'>유효하지 않은 번호 입니다.</div>
		    	</div>
		    		<p class="h4 pt-5 mb-3">선택정보</p>
			<!-- 성별 -->
			<div class="form-group">
              <label for="user_gender" class="font-weight-500 col-form-label">성별</label>
			  <br>
               <div class="custom-control custom-radio custom-control-inline">
					  <input class="custom-control-input" type="radio" name="user_gender" id="male" value="M" ${loginMember.user_gender == 'M' ? 'checked' : ''}>
					  <label class="custom-control-label" for="male">남자</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
					  <input class="custom-control-input" type="radio" name="user_gender" id="female" value="F"  ${loginMember.user_gender == 'F' ? 'checked' : ''}>
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
						<option value="">상위 지역</option>
					</select>
					<select class="form-control" id="subLocal" name="sub_local">
						<option value="">하위 지역</option>
					</select>
			    </div>
            </div>
	            <div class="text-center pt-5">
					<button type="submit" class="btn btn-pink">수정</button>
					<a class="btn btn-pink-outline" href="${contextPath}/me">취소</a>
				</div>
			</div>
			<input type="hidden" name="act" value="${bs.act}"/>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
	<script>
	var phoneCheck = true;
	$('#user_phone').on('blur', function() {
		var value = $(this).val();
		var phoneReg = /^01([0|1|6|7|8|9])([0-9]{4})([0-9]{4})$/;
			if(value.trim() == "" || value == null) {
				phoneCheck = false;
				$('.phone-feedback').text("필수 정보입니다.");
				$(this).removeClass("is-valid");
				$(this).addClass("is-invalid");
			} else if(!value.match(phoneReg) ){
				phoneCheck = false;
				$('.phone-feedback').text("유효하지 않은 번호 형식 입니다.");
				$(this).removeClass("is-valid");
				$(this).addClass("is-invalid");
			} else{
				phoneCheck = true;
				$(this).removeClass("is-invalid");
// 				$(this).addClass("is-valid");
			}
	})
	
	
	function validate() {
		if(!phoneCheck) {
			$('#user_phone').focus();
			return false;
		} 
	}
	</script>
	<script>
	$(document).ready(function() {
		//* 카테고리 부분
		var jsonData = JSON.parse('${slJsonArr}');
		var cate1Arr = new Array();
		var cate1Obj = new Object();
		// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
		for(var i = 0; i < jsonData.length; i++) {
		 if(jsonData[i].sort_level == "1") {
		  cate1Obj = new Object();  //초기화
		  cate1Obj.sort_no = jsonData[i].sort_no;
		  cate1Obj.sort_name = jsonData[i].sort_name;
		  cate1Arr.push(cate1Obj);
		 }
		}
		
		
		// 1차 분류 셀렉트 박스에 데이터 삽입
		var cate1Select = $("#sortLocal");
		var selectedCate1 = "${loginMember.sort_local}"
		console.log(selectedCate1);
		for(var i = 0; i < cate1Arr.length; i++) {
			if(cate1Arr[i].sort_no == selectedCate1) {
				cate1Select.append("<option value='" + cate1Arr[i].sort_no + "' selected>"
				      + cate1Arr[i].sort_name + "</option>");
			} else {
			 cate1Select.append("<option value='" + cate1Arr[i].sort_no + "'>"
		      + cate1Arr[i].sort_name + "</option>"); 
			}
		}
		

		 var cate2Arr = new Array();
		 var cate2Obj = new Object();
		 
		 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
		 for(var i = 0; i < jsonData.length; i++) {
		  if(jsonData[i].sort_level == "2") {
		   cate2Obj = new Object();  //초기화
		   cate2Obj.sort_no = jsonData[i].sort_no;
		   cate2Obj.sort_name = jsonData[i].sort_name;
		   cate2Obj.parent_sort = jsonData[i].parent_sort;
		   cate2Arr.push(cate2Obj);
		  }
		 }
		 
		
		 //수정용 임시로 보여줄 2차분류
		 var selectedCate2 = "${loginMember.sub_local}"
		 var cate2Select = $("#subLocal");
		  for(var i = 0; i < cate2Arr.length; i++) {
		   if(selectedCate1 == cate2Arr[i].parent_sort) {
			   if(cate2Arr[i].sort_no == selectedCate2) {
				   cate2Select.append("<option value='" + cate2Arr[i].sort_no + "' selected>"
					      + cate2Arr[i].sort_name + "</option>");
				} else {
				 	cate2Select.append("<option value='" + cate2Arr[i].sort_no + "'>"
			      + cate2Arr[i].sort_name + "</option>"); 
				}
		   } 
		  }
		
		$(document).on("change", "#sortLocal", function(){
		
			 cate2Select.children().remove();
	
			 $("option:selected", this).each(function(){
			  
			  var selectVal = $(this).val();  
			  cate2Select.append("<option value=''>하위지역</option>");
			  
			  for(var i = 0; i < cate2Arr.length; i++) {
			   if(selectVal == cate2Arr[i].parent_sort) {
			    cate2Select.append("<option value='" + cate2Arr[i].sort_no + "'>"
			         + cate2Arr[i].sort_name + "</option>");
			   }
			  }
			 });
		});
	});
	</script>
</body>
</html>