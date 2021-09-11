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
	<title>boardInsert</title>
	
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
			<form action="insertRun" method="post" id="instFrm" name="instFrm">
				<div class="inner_form">
					<!--셀렉트박스 -->
					<div class="row mb-2">
						<select class="form-control mr-1" name="sub_local" id="subLocal">
							<option value="" ${empty bs.subLocal ? 'selected' : ''}>지역</option>
							<c:forEach var="subLocal" items="${subLocalArr}">
								<option value="${subLocal.sort_no}" ${subLocal.sort_no == bs.subLocal ? 'selected' : ''}>
								${subLocal.sort_name}
								</option>
							</c:forEach>
						</select>
						<select class="form-control mr-1" name="sort_board" id="sortBoard" onchange="selectSortBoard(this);">
							<option value="0" ${empty bs.sortBoard ? 'selected' : ''} data-haschild="false">분류</option>
							<c:forEach var="sortBoard" items="${sortBoardArr}">
								<option value="${sortBoard.sort_no}" 
										${sortBoard.sort_no == bs.sortBoard ? 'selected' : ''}
										data-haschild="${sortBoard.has_sort_place == 'Y' ? true : false }">
								${sortBoard.sort_name}
								</option>
							</c:forEach>
						</select>
					</div>
					<!-- 제목 -->
					<div class="row mb-2 border-0">
						<input class="form-control" placeholder="제목을 입력해 주세요." name="board_title" id="board_title" autocomplete="off" spellcheck="false"></input>
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
				<input type="hidden" name="user_id" value="ijnooyah"/>
				<input type="hidden" name="sort_local" value="${sortLocalP.sort_no}"/>
				<input type="hidden" name="has_img" value=""/>
				<input type="hidden" id="place_name" name="place.place_name" value="">
				<input type="hidden" id="place_address" name="place.place_address" value="">
				<input type="hidden" id="place_lat" name="place.place_lat" value="0">
				<input type="hidden" id="place_long" name="place.place_long" value="0">
				<input type="hidden" id="place_id" name="place.place_id" value="0">
			</form>
		</div>
	</div>
	<!-- The Modal -->
	  <div class="modal fade" id="modalMap">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <span class="font-weight-500">
					<svg width="1rem" height="1rem" viewBox="0 0 16 16" class="bi bi-map" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path fill-rule="evenodd" d="M15.817.113A.5.5 0 0 1 16 .5v14a.5.5 0 0 1-.402.49l-5 1a.502.502 0 0 1-.196 0L5.5 15.01l-4.902.98A.5.5 0 0 1 0 15.5v-14a.5.5 0 0 1 .402-.49l5-1a.5.5 0 0 1 .196 0L10.5.99l4.902-.98a.5.5 0 0 1 .415.103zM10 1.91l-4-.8v12.98l4 .8V1.91zm1 12.98l4-.8V1.11l-4 .8v12.98zm-6-.8V1.11l-4 .8v12.98l4-.8z"/>
					</svg>
					지도에서 장소 선택	
				</span>	
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <!-- Modal body -->
	        <div class="modal-body p-4">
				<div class="row ml-1 text-gray9">
					<span class="fa fa-info-circle my-auto mr-1"></span>
					<span class="font-size-075 font-weight-500" style="letter-spacing: 1px;">
						장소 선택 후 완료 버튼까지 눌러야 변경사항이 적용됩니다!</span>
				</div>
				<div class="row mx-3 mb-3">
					<span class="pt-1 mr-1">선택한 장소
						<svg width="16" height="16" viewBox="0 0 16 16" class="bi bi-chevron-double-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
						  <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
						</svg>
					</span>
					<span id="selectedPlace" class="text-muted pt-1">선택한 장소가 없습니다.</span>
					<button class="btn btn-pink btn-sm ml-2 mt-auto font-size-085" style="padding:.1rem .3rem; height:23px; line-height:.7;" onclick="doComplete();">완료</button>
				</div>
	       		 <!--지도 -->
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				
				    <div id="menu_wrap" class="bg_white">
				        <div class="option">
				            <div>
				                    키워드 : <input type="text" value="${sortLocalP.sort_name}" id="keyword" size="15" autocomplete="off" spellcheck="false"> 
				                  <input type="button" id="btnSearch" onclick="searchPlaces()" value="검색">
				            </div>
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				</div>
				<!-- 지도끝 -->
	        </div>
	      </div>
	    </div>
	  </div>			
	   
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
	<script>
	let sortPlace = 
		'<select class="form-control" id="sortPlace" name="sort_place">'
			+'<option value="0" ${empty bs.sortPlace ? "selected" : ""}>말머리</option>'
			+'<c:forEach var="sortPlace" items="${sortPlaceArr}">'
				+'<option value="${sortPlace.sort_no}" ${sortPlace.sort_no == bs.sortPlace ? "selected" : ""}>'
					+'${sortPlace.sort_name}'
				+'</option>'
			+'</c:forEach>'
		+ '</select>';
		
	let divPlace = 
		'<div class="row mb-2" id="divPlace">'
			+'<svg width="1rem" height="1rem" viewBox="0 0 16 16" class="bi bi-geo-alt-fill text-pink my-auto mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">'
				+'<path fill-rule="evenodd" d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>'
			+'</svg>'
			+'<span class="modalMapToggle" data-toggle="modal" data-target="#modalMap" data-backdrop="static" data-keyboard="false">'
				+'장소 선택'
			+'</span>'
			+'<small class="text-muted my-auto" id="resultPlace">선택된 장소가 없습니다.</small>'
		+ '</div>';
		
	//뒤로가기 할때 자식있는게 선택된 상태에 말머리 박스 안나오는 거 해결 
	$(document).ready(function() {
		let sortBoard = document.querySelector('#sortBoard');
		let i = sortBoard.selectedIndex;
		console.log(sortBoard.options[i]);
		if(sortBoard.options[i].dataset['haschild'] == 'true') {
			console.log('ready');
			$(sortBoard).after(sortPlace);
			$('.inner_form').prepend(divPlace);
		} 
	})
	function selectSortBoard(el) {
		if(el.options[el.selectedIndex].dataset['haschild'] == 'true') {
			$(el).after(sortPlace);
			$('.inner_form').prepend(divPlace);
		} else {
			if(document.querySelector('#sortPlace') != null) {
				document.querySelector('#sortPlace').remove();
			}
			if(document.querySelector('#divPlace') != null) {
				document.querySelector('#divPlace').remove();
			}
			
		}
	}
	</script>
	<script>
	
	var isShown = false; 
	$(document).ready(function() {
	    $('#summernote').summernote({
	        width : 1110,   
	        height : 600,   
	        placeholder: '내용을 입력해 주세요.',
	        lang : 'ko-KR',
// 	        disableResizeEditor: true,
	        spellCheck:false,
// 	        focus:true,
	        toolbar: [
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['color', ['color']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'codeview', 'help']]
			  	],
				fontNames: ['Noto Sans KR', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12', '13', '14','16','18','20','22','24','28','30','36','50','72'],
			callbacks : { 
				onImageUpload: function(files) {
					let fileList = [];

	                for (let i = files.length - 1; i >= 0; i--) {
	                    fileList.push(files[i]);
	                }
					
	                uploadFiles(fileList, this);
	         	}
	    	}
	    });
	    
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
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    // 카카오맵 잘림 현상 해결
	    $('#modalMap').on('shown.bs.modal', function (e) {
	    	$("#keyword").focus();
	    	map.relayout();
	    	
	    	if(!isShown) {
	    		searchPlaces();
	    		isShown = true;
	    	}
	    	
	    	// 키워드 검색창에서 엔터 칠 경우 키워드 검색하기
	    	$("#keyword").on("keydown", function(e) {
	    		if (e.keyCode == 13) {
	    	        e.preventDefault();
	    	        searchPlaces();
	    	    }
	    	});
		});
	    
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
	            source: ['사과', '배', '사진', '사랑', '사랑니', '사진기']
	        }
	    });
	});
	
	
	function doSubmit() {
		let form = document.forms['instFrm'];
		let summernote = document.querySelector('#summernote')
		if (summernote.value == '') {
			console.log("빔");
// 			return false;
		}
		if ($('#summernote').summernote('isEmpty')) {
	    	  alert('editor content is empty');
// 	    	  return false
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
		console.log(form);
		form.submit();
// 		console.log(summernote.value.querySelector('img'));
// 		$("#istFrm").submit();
		
	}
	
	
	
	
	
	
	
	
	
	
	var isChange = null; // input에 값 다 담기기전에 완료버튼 누르는거 방지
	var isClick = false; // 완료버튼 클릭 여부
	//원래 클릭여부에 따라 닫기 창 누르는 상황 다르게 했는데 사용자를 
	// 너무 귀찮게 하는것 같아서 없앰
	
	//카카오 지도
	function selectPlace(place) {
		//장소 표시될 span
		isClick = false; // 장소 선택할때마다 완료버튼 누른거 초기화
		isChange = false;
		console.log("1input변경전", isChange);
    	var selectedPlace = document.getElementById('selectedPlace');
		$("#place_name").val(place.place_name);
    	$("#place_address").val(place.address_name);
    	$("#place_lat").val(place.y);
    	$("#place_long").val(place.x);
    	$("#place_id").val(place.id);
    	selectedPlace.innerHTML = place.place_name + ' (' + place.address_name + ')';
    	console.log("2출력변경후", isChange);
    	isChange = true;
    	console.log("3 isChangetrue후", isChange);
	}
	function doComplete() {
		console.log("4완료버튼클릭",isChange)
		isClick = true;
		if(isChange == null) {
			Swal.fire({
	        	title: '장소를 선택하지 않으셨어요!',
// 	        	html: '장소를 선택하지 않으셨어요!', 
				allowOutsideClick: false,
				icon: 'error', 
				confirmButtonText: "확인",
				didClose: function() {
					console.log("에러후", isChange);
				}
			});
		} else if (isChange) {
			Swal.fire({
	        	title: '장소 선택 완료',
				allowOutsideClick: false,
				icon: 'success', 
				confirmButtonText: "확인",
				didClose: function() {
					console.log("swal 닫힘");
					$("#resultPlace").text($("#selectedPlace").text());
				}
			});
		}
		
	}
	
	// 마커를 담을 배열입니다
	var markers = [];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	
	    var keyword = document.getElementById('keyword').value;
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);
	
	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	
	    }
	}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);

	            
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, place) {
	        	var title = place.place_name;
	        	
	        	
	        	// 마커에 클릭 이벤트 설정
	            kakao.maps.event.addListener(marker, 'click', (function(placePosition) {
	                
	                return function() {
	                	selectPlace(place);
	                }
	                
	            })(placePosition));
				
	            // 검색결과에 클릭 이벤트 설정
	            itemEl.onclick =  (function(placePosition) {

	            	return function() {
	            		selectPlace(place);
	                }
	            	
	            })(placePosition);
	        	
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	            
	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	            
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	            
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	            
       		})(marker, places[i]);

	        fragment.appendChild(itemEl);
	    }
	
	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
	
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = '${contextPath}/resources/image/marker.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(29, 42),  // 마커 이미지의 크기
	        imgOptions =  {
// 	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
// 	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(14, 39) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}	
	 
	</script>
</body>
</html>