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
	</style>
</head>
<body>
	<div class="container my-5">
		<div class="text-center mb-5">
			<a href="${contextPath}" class="logo text-pink">여기야!</a>
		</div>
		<form id="joinRun" method="post" action="joinRun">
		<div class="form-group mx-auto">
			<p class="h4 mb-3">필수정보</p>
			<!-- 아이디  -->
			<div class="form-group">
                <label for="user_id" class="font-weight-500 col-form-label">아이디</label>
                <input type="text" class="form-control required" id="user_id" name="user_id" 
                	   maxlength="20" spellcheck="false" required>
               	<div class='invalid-feedback id-feedback'>이미 사용중이거나 탈퇴한 아이디입니다.</div>
               	<div class='valid-feedback'>멋진 아이디네요!</div>
            </div>
	    	<!-- 비밀번호  -->
    		<div class="form-group">
                <label for="user_pw" class="font-weight-500 col-form-label">비밀번호</label>
                <input type="password" class="form-control required" id="user_pw" name="user_pw" 
                       maxlength="16" autocomplete="off" required>
            	<div class='invalid-feedback pw-feedback'>8~16자의 영문 소문자, 숫자만 사용 가능합니다.</div>
            </div>
	    	<!-- 비밀번호 확인 -->
    		<div class="form-group">
                <label for="confirmPassword" class="font-weight-500 col-form-label">비밀번호 재확인</label>
                <input type="password" class="form-control required" id="cfrmPw" autocomplete="off" required>
                <div class='invalid-feedback cpw-feedback'>비밀번호가 일치하지 않습니다.</div>
            </div>
            <!-- 이름 -->
    		<div class="form-group">
                <label for="user_name" class="font-weight-500 col-form-label">이름</label>
                <input type="text" class="form-control required" id="user_name" name="user_name" 
                	   spellcheck="false" required>
                <div class='invalid-feedback name-feedback'>2자 이상 한글을 사용하세요. (영문, 특수기호, 공백 사용 불가)</div>
            </div>
            <!-- 닉네임 -->
    		<div class="form-group">
                <label for="user_nick" class="font-weight-500 col-form-label">닉네임</label>
                <input type="text" class="form-control required" id="user_nick" name="user_nick" 
                       maxlength="10" spellcheck="false" required>
                <div class='invalid-feedback nick-feedback'>이미 사용중인 닉네임 입니다.</div>
            </div>
	    	<!-- 휴대전화 -->
			<div class="form-group">
				<label for="user_phone" class="font-weight-500 col-form-label">휴대전화</label>
                <input type="text" class="form-control required" id="user_phone" name="user_phone" 
                	placeholder="01012345678" spellcheck="false" required>
                <div class='invalid-feedback phone-feedback'>유효하지 않은 번호 형식 입니다.</div>
	    	</div>
	    	<!-- 이메일 -->
			<div class="form-group d-flex flex-wrap">
				<label for="user_email" class="font-weight-500 col-form-label w-100">이메일</label>
<!-- 			    <div class="d-flex flex-wrap mb-2"> -->
			    <input type="email" class="form-control col-sm-9 required" name="user_email" id="user_email" 
			           placeholder="yeogiya@naver.com" spellcheck="false" required>
		    	<button type="button" class="btn btn-pink ml-auto" onclick="sendAuthNum();">인증번호 받기</button>
<!-- 			    	<div class='invalid-feedback email-feedback'>필수정보 입니다.</div> -->
<!-- 			    </div> -->
                <input type="text" class="form-control mt-2 required" id="confirmEmail" spellcheck="false" placeholder="인증번호 입력" autocomplete="off" required disabled>
		      	<div class='invalid-feedback email-feedback'>유효하지 않은 이메일 형식입니다.</div>
		      	<div class="valid-feedback">인증번호가 전송 되었습니다.</div>
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
            <!-- 가입완료 버튼 -->
			<button type="button" id="sendForm" class="btn btn-pink btn-lg btn-block mt-4">가입하기</button>
		</div>
	</form>
	<div class="text-center mb-5" >
		<span class="font-weight-400">
		    이미 아이디가 있으신가요?
		</span>
		<a href="${memberPath}/login" class="font-weight-700 text-pink">로그인</a>
	</div>
	</div>
	<%@ include file="../cdn/js.jsp" %>
	<script>
		var validateCheck = {
            "userId" : false,
            "name" : false,
            "pw1" : false,
            "pw2" : false,
            "phone" : false,
            "email" : false,
            "email2" : false,
            "nick" : false
        }

		
		var authNum = null;
	 	$('.required').on('blur', function() {
	 		let value = $(this).val();
// 	 		console.log($(this).attr('id'));
 			var id = $(this).attr('id');
	 		if(value.trim() == "" || value == null) {
// 	 			console.log('없음')
	 			if(id == 'confirmEmail') {
	 				$(".email-feedback").text("인증이 필요합니다.");
	 			} else {
	 				$(this).siblings(".invalid-feedback").text("필수 정보입니다.");
	 			}
				$(this).removeClass("is-valid");
				$(this).addClass("is-invalid");
				switch(id) {
				case 'user_id' :
					validateCheck.userId = false;
					break;
				case 'user_pw' :
					validateCheck.pw1 = false;
					break;
				case 'cfrmPw' :
					validateCheck.pw2 = false;
					break;
				case 'user_name' :
					validateCheck.name = false;
					break;
				case 'user_nick' :
					validateCheck.nick = false;
					break;
				case 'user_phone' :
					validateCheck.phone = false;
					break;
				case 'user_email' :
					validateCheck.email = false;
					break;
				case 'confirmEmail' :
					validateCheck.email2 = false;
					break;
				}
	 		} else {
	 			switch(id) {
	 			case 'user_id' :
	 				var idReg = /^[a-z0-9]{6,20}$/; // 소문자 또는 숫자 6~20자
	 	 			if(!value.match(idReg) ){
	 	 				validateCheck.userId = false;
	 	 				$('.id-feedback').text("6~20자의 영문 소문자, 숫자만 사용 가능합니다.");
	 	 				$(this).removeClass("is-valid");
	 	 				$(this).addClass("is-invalid");
	 	 			} else{
	 	 				console.log(value);
	 	 				$.ajax({
	 	 	                type: "post",
	 	 	                dataType: "text",
	 	 	                data: {
	 	 	                	'user_id': value 
	 	 	                },
	 	 	                url: "${memberPath}/checkDupId",
	 	 	                success: function (data) {
	 	 	                	if(data=="true"){	// 중복일경우
	 	 	                		console.log('중복');
	 	 	                		validateCheck.userId = false;
	 	 	                		$('.id-feedback').text('이미 사용중이거나 탈퇴한 아이디입니다.');
	 	 	                		$("#user_id").removeClass("is-valid");
	 	 	      					$("#user_id").addClass("is-invalid");	
	 	 	                	}else{				// 중복아닐경우
	 	 	                		validateCheck.userId = true;
	 	 	                		$("#user_id").removeClass("is-invalid");
	 	 	      					$("#user_id").addClass("is-valid");
	 	 	                	}
	 	 	                }
	 	 				});
	 	 			}
	 				break;
	 				
	 			case 'user_pw' :
	 				var pwReg = /^[A-Za-z0-9]{8,16}$/; // 대소문자 또는 숫자 8~16자
	 	 			if(!value.match(pwReg) ){
	 	 				validateCheck.pw1 = false;
	 	 				console.log('비번', validateCheck.pw1);
	 	 				console.log('비번확인', validateCheck.pw2);
	 	 				$('.pw-feedback').text("8~16자의 영문 대 소문자, 숫자만 사용 가능합니다.");
	 	 				$(this).removeClass("is-valid");
	 	 				$(this).addClass("is-invalid");
	 	 			} else{
	 	 				validateCheck.pw1 = true;
	 	 				console.log('비번', validateCheck.pw1);
	 	 				$(this).removeClass("is-invalid");
	 	 				$(this).addClass("is-valid");
	 	 				if($('#cfrmPw').hasClass('is-valid')) {
	 	 					checkPw();
	 	 				}
	 	 			}
	 				break;
	 				
	 			case 'cfrmPw' :
	 				checkPw();
	 				break;
	 				
	 			case 'user_name' :
	 				var nameReg = /^[가-힣]{2,}$/;
	 	 			if(!value.match(nameReg) ){
	 	 				validateCheck.name = false;
	 	 				$('.name-feedback').text('2자 이상 한글을 사용하세요. (영문, 특수기호, 공백 사용 불가)');
	 	 				$(this).removeClass("is-valid");
	 	 				$(this).addClass("is-invalid");
	 	 			} else{
	 	 				validateCheck.name = true;
	 	 				$(this).removeClass("is-invalid");
	 	 				$(this).addClass("is-valid");
	 	 			}
	 				break;
	 				
	 			case 'user_nick' :
	 				var nickReg = /^[a-zA-Zㄱ-ㅎ가-힣0-9]{2,10}$/;
	 				if(!value.match(nickReg) ){
	 					validateCheck.nick = false;
	 	 				$('.nick-feedback').text("2~10자의 한글, 영문 대소문자, 숫자만 사용 가능합니다.");
	 	 				$(this).removeClass("is-valid");
	 	 				$(this).addClass("is-invalid");
	 	 			} else{
	 	 				console.log(value);
	 	 				$.ajax({
	 	 	                type: "post",
	 	 	                dataType: "text",
	 	 	                data: {
	 	 	                	'user_nick': value 
	 	 	                },
	 	 	                url: "${memberPath}/checkDupNick",
	 	 	                success: function (data) {
	 	 	                	if(data=="true"){	// 중복일경우
	 	 	                		console.log('중복');
	 	 	                		validateCheck.nick = false;
	 	 	                		$('.nick-feedback').text('이미 사용중인 닉네임 입니다');
	 	 	                		$("#user_nick").removeClass("is-valid");
	 	 	      					$("#user_nick").addClass("is-invalid");	
	 	 	                	}else{				// 중복아닐경우
	 	 	                		console.log('중복노')
	 	 	                		validateCheck.nick = true;
	 	 	                		$("#user_nick").removeClass("is-invalid");
	 	 	      					$("#user_nick").addClass("is-valid");
	 	 	                	}
	 	 	                }
	 	 				});
	 	 			}
	 				break;
	 				
	 			case 'user_phone' :
	 				var phoneReg = /^01([0|1|6|7|8|9])([0-9]{4})([0-9]{4})$/;
	 	 			if(!value.match(phoneReg) ){
	 	 				validateCheck.phone = false;
	 	 				$('.phone-feedback').text("유효하지 않은 번호 형식 입니다.");
	 	 				$(this).removeClass("is-valid");
	 	 				$(this).addClass("is-invalid");
	 	 			} else{
	 	 				validateCheck.phone = true;
	 	 				$(this).removeClass("is-invalid");
	 	 				$(this).addClass("is-valid");
	 	 			}
	 				break;
	 				
	 			case 'confirmEmail' :
	 				console.log('인증번호확인', authNum);
	 				if($(this).val() == authNum){
	 					console.log('일치');
	 					validateCheck.email2 = true;
	 					$(this).siblings('.valid-feedback').text("인증이 성공했습니다.");
	 					$(this).removeClass("is-invalid");
	 					$(this).addClass("is-valid");
	 				}else{
	 					console.log('불일치')
	 					validateCheck.email2 = false;
	 					$('.email-feedback').text("인증번호를 다시 확인해주세요.");
	 					$(this).removeClass("is-valid");
	 					$(this).addClass("is-invalid");
	 				}
	 				break;
	 				
	 			}
	 			
	 				
	 		}
	 		
	 	});
	 	
	 	function sendAuthNum () {
	 		validateCheck.email2 = false;
	 		var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var value = $('#user_email').val();
			if(!value.match(emailReg) ){
				validateCheck.email = false;
 				$('.email-feedback').text("유효하지 않은 이메일 형식 입니다.");
 				$('#user_email').removeClass("is-valid");
 				$('#user_email').addClass("is-invalid");
 			} else {
 				
 				
 				$.ajax({
 	                type: "post",
 	                dataType: "text",
 	                data: {
 	                	'user_email': value 
 	                },
 	                url: "${memberPath}/emailAuth",
 	               success : function(data) {
 	            	console.log('authNum', data)
	 	            	if(data == 'dup') {
	 	            		validateCheck.email = false;
	 	            		$('.email-feedback').text("이미 등록된 이메일 주소 입니다.");
	 	    				$('#user_email').removeClass("is-valid");
	 	    				$('#user_email').addClass("is-invalid");
	 	            	} else {
		 	            	$('#user_email').siblings('.valid-feedback').text("인증번호가 전송 되었습니다.");
		 		 			$('#user_email').removeClass("is-invalid");
		 		 			$('#user_email').addClass("is-valid");
		 		 			$('#confirmEmail').attr('disabled', false);
		 	 				if($('#confirmEmail').hasClass('is-invalid')) {
		 	 					$('#confirmEmail').removeClass('is-invalid')
		 	 				}
		 	            	authNum = data; 
		 	 		        validateCheck.email = true;
	 	            	}
 	                },
 	                error : function() {
 	             	   validateCheck.email = false;
 	             	   alert('통신오류');
 	                }
 				});
 			}
			console.log('emailval',  validateCheck.email);
	 	}
	 	
	 	function checkPw(){
			if($("#user_pw").val()==$("#cfrmPw").val()){
				console.log('일치');
				validateCheck.pw2 = true;
				console.log('비번확인', validateCheck.pw2);
				$("#cfrmPw").removeClass("is-invalid");
				$("#cfrmPw").addClass("is-valid");
			}else{
				console.log('불일치')
				validateCheck.pw2 = false;
				console.log('비번확인', validateCheck.pw2);
				$("#cfrmPw").removeClass("is-valid");
				$("#cfrmPw").addClass("is-invalid");
			}
		}
	 	
	 	
	 	$("#sendForm").click(function(){
	 		$('.required').each(function() {
	 			let value = $(this).val();
		 		console.log($(this).attr('id'));
	 			var id = $(this).attr('id');
		 		if(value.trim() == "" || value == null) {
		 			console.log('없음')
		 			if(id == 'confirmEmail') {
		 				$(".email-feedback").text("인증이 필요합니다.");
		 			} else {
		 				$(this).siblings(".invalid-feedback").text("필수 정보입니다.");
		 			}
					$(this).removeClass("is-valid");
					$(this).addClass("is-invalid");
					switch(id) {
					case 'user_id' :
						validateCheck.userId = false;
						break;
					case 'user_pw' :
						validateCheck.pw1 = false;
						break;
					case 'cfrmPw' :
						validateCheck.pw2 = false;
						break;
					case 'user_name' :
						validateCheck.name = false;
						break;
					case 'user_nick' :
						validateCheck.nick = false;
						break;
					case 'user_phone' :
						validateCheck.phone = false;
						break;
					case 'user_email' :
						validateCheck.email = false;
						break;
					case 'confirmEmail' :
						validateCheck.email2 = false;
						break;
					}
	 			}
	 		});
	 		var valArr = Object.values(validateCheck);
	 		for(var i = 0; i < valArr.length; i++) {
	 			if(!valArr[i]) {
	 				return;
	 			}
	 		}
	 		$('#joinRun').submit();
		});
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
		for(var i = 0; i < cate1Arr.length; i++) {
			 cate1Select.append("<option value='" + cate1Arr[i].sort_no + "'>"
		      + cate1Arr[i].sort_name + "</option>"); 
		}
		
		$(document).on("change", "#sortLocal", function(){
		
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
			 
			 var cate2Select = $("#subLocal");
	
			 cate2Select.children().remove();
	
			 $("option:selected", this).each(function(){
			  
			  var selectVal = $(this).val();  
			  cate2Select.append("<option value='0'>하위지역</option>");
			  
			  for(var i = 0; i < cate2Arr.length; i++) {
			   if(selectVal == cate2Arr[i].parent_sort) {
			    cate2Select.append("<option value='" + cate2Arr[i].cate_no + "'>"
			         + cate2Arr[i].sort_name + "</option>");
			   }
			  }
			 });
		});
	});
	</script>
</body>
</html>