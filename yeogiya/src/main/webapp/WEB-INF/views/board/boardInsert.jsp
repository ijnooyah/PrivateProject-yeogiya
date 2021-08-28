<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>insert</title>
	
	<style>
	.container {
		border: 1px solid #efefef;
		padding: 19px 27px 15px;
		box-sizing: border-box;
		border-radius: 2px;
	}
/* 셀렉트 박스 */
select#district, select#city, select#sort {
	font-size:80%;
	width: 150px;
}
/* 제목 입력 */
.titleArea {
	width: 100%;
	font-size: 23px;
	border: none;
}
.titleArea:focus {
	outline: none;
}

/* 썸머노트 */
.note-modal-footer {
    height: 50px !important;
}
.note-editor {
	width: 100% !important;
}

.note-fontname .note-icon-caret, .note-fontsize .note-icon-caret, .note-para .note-icon-caret, .note-height .note-icon-caret{
/*  color:red; */
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
#placesList .info .tel {color: var(--blue);}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(${contextPath}/resources/temp/pin.png) no-repeat center; background-size: 35px;}
/* #placesList .item .marker_1 {background-position: 0 -10px;} */
/* #placesList .item .marker_2 {background-position: 0 -56px;} */
/* #placesList .item .marker_3 {background-position: 0 -102px} */
/* #placesList .item .marker_4 {background-position: 0 -148px;} */
/* #placesList .item .marker_5 {background-position: 0 -194px;} */
/* #placesList .item .marker_6 {background-position: 0 -240px;} */
/* #placesList .item .marker_7 {background-position: 0 -286px;} */
/* #placesList .item .marker_8 {background-position: 0 -332px;} */
/* #placesList .item .marker_9 {background-position: 0 -378px;} */
/* #placesList .item .marker_10 {background-position: 0 -423px;} */
/* #placesList .item .marker_11 {background-position: 0 -470px;} */
/* #placesList .item .marker_12 {background-position: 0 -516px;} */
/* #placesList .item .marker_13 {background-position: 0 -562px;} */
/* #placesList .item .marker_14 {background-position: 0 -608px;} */
/* #placesList .item .marker_15 {background-position: 0 -654px;} */
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
#searchPlace {
   	border-radius: .2rem;
    padding: 1px 4px;
    border: 1px solid var(--pink);
    background: var(--pink);
    color: var(--white);
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

	
	</style>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class="container mb-5">
		<div class="row">
			<div class="col-md-12">
				<form action="test" method="get">
					<div class="col-md-12">
						<div class="row">
							<div class="form-row">
								<select class="form-control" id="district">
									<option value="">울산</option>
								</select>
								<select class="form-control" id="city">
									<option value="">동구</option>
								</select>
								<select class="form-control" id="sort">
									<option value="">맛집</option>
								</select>
							</div>
							<div class="col-md-12 py-2">
								<input class="form-control" placeholder="제목을 입력해 주세요." autocomplete="off" spellcheck="false"></input>
							</div>
						</div>
						
						<!--지도 -->
						<div class="map_wrap">
						    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
						
						    <div id="menu_wrap" class="bg_white">
						        <div class="option">
						            <div>
						                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15" autocomplete="off"> 
						                  <input type="button" id="searchPlace" onclick="searchPlaces()" value="검색">
						            </div>
						        </div>
						        <hr>
						        <ul id="placesList"></ul>
						        <div id="pagination"></div>
						    </div>
	   						<input type="hidden" id="placeName" name="placeName" value="">
							<input type="hidden" id="latitude" name="latitude" value="">
							<input type="hidden" id="longitude" name="longitude" value="">
							<div id="result"></div>
						</div>
						<!-- 지도끝 -->
						
						<!-- 내용 -->
						<div class="form-group">
							<textarea class="form-control" name="" id="summernote" rows="10" style="resize: none;"></textarea>
						</div>
		

						<div class="text-center">
							<button type="submit" class="btn btn-sm btn_pink">등록</button>
							<a class="btn btn-sm btn_outline_pink">취소</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- container 끝 -->
	<%@ include file="../include/footer.jsp" %>
	<script>
	$(document).ready(function() {
	    $('#summernote').summernote({
	        width : 1110,   
	        height : 600,   
	        placeholder: '내용을 입력해 주세요.',
	        disableResizeEditor: true,
	        spellCheck:false,
	        toolbar: [
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link','video']],
				  	],
					fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
					fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	        
	
	        // 이미지 업로드 이벤트가 발생했을 때 콜백함수 수행
	        callbacks : {
	            onImageUpload : function(files){
	                // files : 업로드된 이미지가 배열로 저장되어 있음
	                // editor == this : 이미지가 업로드된 섬머노트 에디터
	                sendFile(files[0], this);
	            }
	        }
	    });
	    
	    $('#summernote').summernote('fontSize', 13);
	});
	
	
	//카카오 지도
	
	// 키워드 검색창에서 엔터 칠 경우 페이지 이동 방지
	$("#keyword").on("keydown", () => {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	    }
	})

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
	        	
	            kakao.maps.event.addListener(marker, 'click', (function(placePosition) {
// 	                displayInfowindow(marker, title);
	                return function() {
	                    // 좌표정보를 파싱하기 위해 hidden input에 값 지정
	                    $("#latitude").val(placePosition.La);
	                    $("#longitude").val(placePosition.Ma);
	                    $("#placeName").val(title);
	                    // #result 영역에 좌표정보 출력
	                    var resultDiv = document.getElementById('result');
	                    resultDiv.innerHTML = '선택하신 위치는 ' +'"'+title+'"' +placePosition+' 입니다';
	                    console.log('선택하신 위치는 ' +'"'+title+'"' +placePosition+' 입니다');
	                    console.log(place.address_name);
	                }
	            })(placePosition));
				
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	            
	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	
	            itemEl.onclick =  (function(placePosition) {
// 	                displayInfowindow(marker, title);
	                return function() {
	                    // 좌표정보를 파싱하기 위해 hidden input에 값 지정
	                    $("#latitude").val(placePosition.La);
	                    $("#longitude").val(placePosition.Ma);
	                    $("#placeName").val(title);
	                    // #result 영역에 좌표정보 출력
	                    var resultDiv = document.getElementById('result');
	                    resultDiv.innerHTML = '선택하신 위치는 ' +'"'+title+'"' +placePosition+' 입니다';
	                    console.log('선택하신 위치는 ' +'"'+title+'"' +placePosition+' 입니다');
	                    console.log(place.address_name);
	                }
	            })(placePosition);
	
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
	    var imageSrc = '${contextPath}/resources/temp/marker.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
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