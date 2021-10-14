<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yj.yeogiya.model.vo.Sort"%>
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
	<title>boardUpdate</title>
	
	<style>
	@media (min-width: 1200px) {
	.container, .container-lg, .container-md, .container-sm, .container-xl {
	    max-width: 1100px !important;
		}
	}
	.card {
		border: 1px solid var(--grayE1);
		padding: 1.8rem 3rem;
		box-sizing: border-box;
		border-radius: 0.13rem;
		width:845px;
	}
	
	/* 셀렉트 박스 */
	select.form-control {
		font-size:80%;
		width: 150px;
	}
	
	/* 썸머노트 */
	.note-modal-footer {
	    height: 50px !important;
	}
	.note-editor {
		width: 100% !important;
	}
	.note-editor .note-toolbar .note-color-all .note-dropdown-menu, .note-popover .popover-content .note-color-all .note-dropdown-menu {
    min-width: 345px;
	}
	.note-editor .note-toolbar .note-para .note-dropdown-menu, .note-popover .popover-content .note-para .note-dropdown-menu {
   	min-width: 237px;
	}
	.note-fontname .note-icon-caret, .note-fontsize .note-icon-caret, .note-para .note-icon-caret, .note-height .note-icon-caret{
	 display:none;
	}
	.note-editor.note-frame {
    border: 1px solid #ced4da;
	}
	/* 카카오 */
	.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Noto Sans KR', sans-serif; font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color: var(--green);}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(${contextPath}/resources/image/pin.png) no-repeat center; background-size: 35px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px; font-size: 80%;}
	#pagination .on {
		font-weight: bold;
		cursor: default;
	    color: var(--white);
	    background: var(--pink);
	    border-radius: .4rem;
	    padding: 2px 6px;
	}
	/* 장소 검색버튼 */
	#btnSearch {
	   	border-radius: .2rem;
	    padding: 1px 4px;
	    border: 1px solid var(--pink);
	    background: var(--white);
	    color: var(--pink);
	}
	#keyword {
		border: 1px solid #ced4da;
		border-radius: .2rem;
		padding: 1px;
	}
	#keyword:focus{
		outline: none;
		border: 1.5px solid var(--pink);
	}
	
/* 	태그 */
ul.tagit {
    width : 620px;
    vertical-align : middle;

}
ul.tagit input[type="text"] {
    width: 100%;
    font-family: 'Noto Sans KR';
}
.ui-widget.ui-widget-content {
    border: 1px solid #ced4da;
    color: var(--black);
    width:100%;
}
.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {
    border: 1px solid var(--pink);
    font-weight: 500;
    background: var(--white);
    color: var(--pink);
}
ul.tagit li.tagit-choice .close {
    top: 38%;
}
ul.tagit li.tagit-choice .tagit-close .text-icon {
    display: none;
}
.ui-icon {
    background-image: url(/yeogiya/resources/image/close.png) !important;
    background-size: 8px;
    background-position: center;
    opacity: .7;
}
.ui-icon, .ui-widget-content .ui-icon {
    background-image:unset;
}
.ui-icon:not(:disabled):not(.disabled):focus, .ui-icon:not(:disabled):not(.disabled):hover {
    opacity: 1 !important;
}
ul.tagit li.tagit-choice {
    padding: .2em .5em .2em .5em;
}
ul.tagit-autocomplete {
	width:inherit!important;
}
ul.tagit-autocomplete .ui-menu-item {
	font-family: 'Noto Sans KR';
}
ul.tagit-autocomplete .ui-menu-item .ui-menu-item-wrapper.ui-state-active {
    background: var(--pink) !important;
    color: var(--white) !important;
	border: none;
}



/* swal */
.swal2-styled.swal2-default-outline:focus, .swal2-styled.swal2-confirm:focus {
    box-shadow: unset !important;
}

/* 모달열기버튼 */
span.modalMapToggle {
position: relative;
width: 80px;
margin-right: 10px;
cursor:pointer;
}
span.modalMapToggle::after {
    content: '';
    background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE2LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgd2lkdGg9IjQ1MS44NDdweCIgaGVpZ2h0PSI0NTEuODQ2cHgiIHZpZXdCb3g9IjAgMCA0NTEuODQ3IDQ1MS44NDYiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDQ1MS44NDcgNDUxLjg0NjsiDQoJIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPHBhdGggZD0iTTI0OC4yOTIsMTA2LjQwNmwxOTQuMjgxLDE5NC4yOWMxMi4zNjUsMTIuMzU5LDEyLjM2NSwzMi4zOTEsMCw0NC43NDRjLTEyLjM1NCwxMi4zNTQtMzIuMzkxLDEyLjM1NC00NC43NDQsMA0KCQlMMjI1LjkyMywxNzMuNTI5TDU0LjAxOCwzNDUuNDRjLTEyLjM2LDEyLjM1NC0zMi4zOTUsMTIuMzU0LTQ0Ljc0OCwwYy0xMi4zNTktMTIuMzU0LTEyLjM1OS0zMi4zOTEsMC00NC43NUwyMDMuNTU0LDEwNi40DQoJCWM2LjE4LTYuMTc0LDE0LjI3MS05LjI1OSwyMi4zNjktOS4yNTlDMjM0LjAxOCw5Ny4xNDEsMjQyLjExNSwxMDAuMjMyLDI0OC4yOTIsMTA2LjQwNnoiLz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjwvc3ZnPg0K) !important;
    width: 10px !important;
    height: 10px !important;
    background-size: 10px !important;
    opacity: .7;
    display: inline-block;
    transform: rotate(90deg);
    position:absolute;
    top:8px;
    right:0;
}


/* 모달닫기버튼 포커스시 아웃라인없애기 */
#modalMap button.close:focus {
     outline: none; 
     outline: none; 
}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container board-container d-md-flex my-4">
		<jsp:include page="./sidebar.jsp" flush="false"/>
		<div class="row card ml-auto">
			<form action="${localPath}/updateRun" method="post" id="updtFrm" name="updtFrm">
				<div class="inner_form">
					<div class="row mb-2" id="divPlace">
						<c:if test="${not empty board.sort_place}">
							<svg width="1rem" height="1rem" viewBox="0 0 16 16" class="bi bi-geo-alt-fill text-pink my-auto mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
							</svg>
							<small class="text-muted my-auto" id="resultPlace" data-isexist="Y">
						    	${board.place.place_name} (${board.place.place_address})
					    	</small>
				    	</c:if>
					</div>
<!-- 					셀렉트박스 -->
<!-- 					<div class="row mb-2"> -->
<%-- 						<c:if test="${not empty board.sort_place}"> --%>
<!-- 							<select class="form-control mr-1" name="sort_place" id="sortPlace"> -->
<!-- 								<option value="0">말머리</option> -->
<%-- 								<c:forEach var="sortPlace" items="${sortPlaceArr}"> --%>
<%-- 									<option value="${sortPlace.sort_no}" ${sortPlace.sort_no == board.sort_place ? 'selected' : ''}> --%>
<%-- 									${sortPlace.sort_name} --%>
<!-- 									</option> -->
<%-- 								</c:forEach> --%>
<!-- 							</select> -->
<%-- 						</c:if> --%>
<!-- 					</div> -->
					<!-- 제목 -->
					<div class="row mb-2 border-0">
						<input class="form-control" placeholder="제목을 입력해 주세요." name="board_title" id="board_title" maxlength="70" value="${board.board_title}" autocomplete="off" spellcheck="false"></input>
					</div>
					<!-- 내용 -->
					<div class="row mb-2">
						<textarea class="form-control" name="board_content" id="summernote" rows="10" style="resize: none;"></textarea>
					</div>
					<!-- 해시태그 -->
					<div class="row mb-2">
						<div class="text-muted font-size-090 mb-1">
							콤마나 스페이스로 해시태그를 구분지어 주세요.
						</div>
						<div class="tag_wrap w-100">
							 <input type="hidden" name="tag" value="" id="tag" style="width:100%">
						</div>
					</div>
					<div class="text-center">
						<button type="button" onclick="doSubmit();" class="btn btn-pink">등록</button>
						<button class="btn btn-pink-outline">취소</button>
					</div>
				</div>
				<input type="hidden" name="board_no" value="${board.board_no}"/>
				<input type="hidden" name="user_id" value="${board.user_id}"/>
				<input type="hidden" name="sort_local" value="${board.sort_local}"/>
				<input type="hidden" name="sub_local" value="${board.sub_local}"/>
				<input type="hidden" name="sort_board" value="${board.sort_board}"/>
				<input type="hidden" name="has_img" value="${board.has_img}"/>
				<c:if test="${not empty board.sort_place}">
					<input type="hidden" id="place_name" name="place.place_name" value="${board.place.place_name}">
					<input type="hidden" id="place_address" name="place.place_address" value="${board.place.place_address}">
					<input type="hidden" id="place_lat" name="place.place_lat" value="${board.place.place_lat}">
					<input type="hidden" id="place_long" name="place.place_long" value="${board.place.place_long}">
					<input type="hidden" id="place_id" name="place.place_id" value="${board.place.place_id}">
				</c:if>
			</form>
		</div>
	</div>
	   
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
	<!-- summernote -->
	<script>
	$(document).ready(function() {
		var fontSizes = ['8','9','10','11','12', '13', '14','16','18','20','22','24','28','30','36','50','72'];
		var fontNames = ['Noto Sans KR', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'];
		var toolbar = [
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['color', ['color']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'codeview', 'help']]
		  	];
       
		var setting = {
		     	width : 1110,   
		        height : 600,   
		        placeholder: '내용을 입력해 주세요.',
		        lang : 'ko-KR',
		        spellCheck:false,
		        toolbar : toolbar,
	            fontSizes : fontSizes,
	            fontNames : fontNames,
	            callbacks : { 
					onImageUpload: function(files) {
						let fileList = [];

		                for (let i = files.length - 1; i >= 0; i--) {
		                    fileList.push(files[i]);
		                }
						
		                uploadFiles(fileList, this);
		         	}
		    	}
      
    	};
		
		
		$('#summernote').val('${board.board_content}');
		$('#summernote').summernote(setting);
	    
	    function uploadFiles(files, el) {
	    	console.log(files);
	    	let formData = new FormData();
			
	    	let fileSize = 0;
	    	let imgJ = /^.*\.(jpg|jpeg|png|gif)$/;
	        for (let i=0; i<files.length; i++) {
	        	if(!files[i].name.match(imgJ)) {
	        		Swal.fire({
	 		        	title: '첨부파일 업로드 실패',
	 		        	html: '이미지 파일만 업로드 가능합니다.', 
	 					allowOutsideClick: false,
	 					icon: 'error', 
	 					confirmButtonText: "확인"
	 				});
	 	            return;
	 	        } 
	            fileSize += files[i].size;
	            formData.append("files", files[i]);
	        }
	        console.log(formData);
	        console.log(fileSize);
	        
	        let maxSize = 10 * 1024 * 1024;
	        
	        if (fileSize > maxSize) {
	        	console.log("크다")
	        	Swal.fire({
		        	title: '첨부파일 업로드 실패',
		        	html: '한번에 업로드 가능한 <br>이미지 파일의 총 용량은 10MB 미만입니다.', 
					allowOutsideClick: false,
					icon: 'error', 
					confirmButtonText: "확인"
				});
	            return;
	        }
	        
			$.ajax({
					enctype : 'multipart/form-data',
					cache: false,
			        contentType: false,
			        processData: false,
			        timeout: 600000,
		            url: "${contextPath}/uploadImage",
		            data: formData,
		            method : "post",
		            success: function (data) {
		            	data = JSON.parse(data);
		            	console.log(data);
		            	console.log(data[0].filePath);
						
		                for(let i=0; i<data.length; i++) {
		                	$(el).summernote('editor.insertImage', "${contextPath}/display?img=" + data[i].filePath);
		                }
		            },
		            error: function (e) {
		                alert("error");
		            }
			});
	    }
	});
	</script>
	<!-- tag -->
	<script>
	$(document).ready(function() {
	    //태그
	    $("#tag").tagit({
	        singleField: false,
	        singleFieldNode: $('#tag'),
	        singleFieldDelimiter: ',',
	        allowSpaces: false,
// 	        placeholderText:"콤마나 스페이스로 태그를 구분하세요.",
	        preprocessTag : function(val) {
	            return val.replace(",","").replace("#","");
	        },
	        autocomplete : {
	        	 source: function(request, response) {
	                 $.ajax({
	                     type : 'get',
	                     url: '${localPath}/searchTag',
	                     dataType : 'json',
	                     data : {keyword: request.term},
	                     success : function(data) {
	                         console.log(data);
	                         response(
	                             $.map(data, function(item) {
	                                 return {
	                                     label : item.tag_name,
	                                     value : item.tag_name
	                                 }
	                             })
	                         );
	                     }
	                 })
	        	 },
	            focus: function(event, ui){ return false;},
	        }
	    });
	    // 작성했던 태그들 
	    var tagList = JSON.parse('${board.jsonTagList}');
	    console.log(tagList);
// 	    for(var i=tagList.length - 1; i >= 0; i--) {
// 	    	 console.log(i + " : " + tagList[i].tag_name);
// 	    	 $("#tag").tagit("createTag", tagList[i].tag_name);
// 	    }
	    for(var i=0; i<tagList.length; i++) {
	    	 console.log(i + " : " + tagList[i].tag_name);
	    	 $("#tag").tagit("createTag", tagList[i].tag_name);
	    }
// 	    $.each(tagList, function(index, obj) {
// 	        console.log(index + " : " + obj.tag_name);
// 	        $("#tag").tagit("createTag", obj.tag_name);
// 	  	});

	   	//태그 포커스 css
	   	$('.ui-autocomplete-input').on('focus' , function() {
	   		$('.ui-widget.ui-widget-content').css('border-color', 'var(--pink)');
	   	}); 
	   	$('.ui-autocomplete-input').on('blur' , function() {
	   		$('.ui-widget.ui-widget-content').css('border-color', '#ced4da');
	   	});
	});
	</script>
	<!-- form -->
	<script>
	$("#board_title").on("input", function(){
		var cnt = $(this).val();
		if(cnt.length == 70){
			Swal.fire({
	        	title: '제목은 최대 70자 입니다.',
				allowOutsideClick: false,
				icon: 'error', 
				confirmButtonText: "확인"
			});
		}
	});
	let form = document.forms['updtFrm'];
	let summernote = document.querySelector('#summernote');
	function validate() {
		let msg = null;
		// 1. 카테고리
// 		if (document.querySelector('#sortPlace') != null && $('#sortPlace').val() == 0) {
// 			Swal.fire({
// 	        	title: '말머리를 선택해주세요.',
// 				allowOutsideClick: false,
// 				icon: 'error', 
// 				confirmButtonText: "확인",
// 				didClose: function() {
// 					$('#sortPlace').focus();
// 				}
// 			});
// 			return false;
// 		}
		
		// 3. 제목
		if ($('#board_title').val() == null || $('#board_title').val().trim() == '') {
			Swal.fire({
	        	title: '제목을 입력해주세요.',
				allowOutsideClick: false,
				icon: 'error', 
				confirmButtonText: "확인",
				didClose: function() {
					$('#board_title').focus();
				}
			});
			return false;
		}
		// 4. 내용
		if (summernote.value == '' || $(summernote).summernote('isEmpty')) {
			Swal.fire({
	        	title: '내용을 입력해주세요.',
				allowOutsideClick: false,
				icon: 'error', 
				confirmButtonText: "확인",
				didClose: function() {
					console.log('내용')
					$('#summernote').summernote('focus');
				}
			});
			return false;
		}
		return true;
	}
	
	function doSubmit() {
		
		valResult = validate();
		console.log("유효성결과", valResult);
	    if (!valResult) {
	        return false;
	    } 
	    let div = document.createElement('div'); //임의의 div
		div.innerHTML = summernote.value;
		if (div.querySelector('img') != null) {
			console.log("이미지 있음");
			form.elements['has_img'].value = 'Y';
		} else {
			console.log("이미지 없음");
			form.elements['has_img'].value = 'N';
		}
		form.submit();
	}
	</script>
</body>
</html>