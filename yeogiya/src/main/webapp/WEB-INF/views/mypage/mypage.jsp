<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../cdn/css.jsp" %>
<title>mypage</title>
	<style>
	@media (min-width: 1200px) {
	.mypage-container.container {
	    max-width: 900px !important;
		}
	}
	
	.mypage-container .nav-tabs .nav-link {
	    font-size: 14px;
	    font-weight: 500;
	}
	
	/* pagination */
	.mypage-container .pagination-sm .page-link {
	    padding: .2rem .5rem;
	    font-size: .75rem;
	    line-height: 1.5;
	}
	.mypage-container .search_wrap .form-control, .mypage-container .search_wrap .btn {
 		height: 30px; 
	    font-size: .75rem; 
	}
	.mypage-container .search_wrap input {
 		width: 220px !important; 
	}
	
	.mypage-container .table_wrap {
	    font-size: 0.8rem;
	}
	.mypage-container .table_wrap table td, .mypage-container .table_wrap table th {
    	padding: .4rem 0 .4rem 0 !important;
	}
	.mypage-container .table_wrap table {
		border-collapse: unset;
		border-spacing: 0px;
	}
	.mypage-container .table_wrap table a{
		color: var(--black);
	    text-decoration: none;
	    background-color: transparent;
	}
	.mypage-container .table_wrap table a:hover, .mypage-container .table_wrap table a:active, .mypage-container .table_wrap table a:focus {
		color: var(--pink);
	    text-decoration: none;
	    background-color: transparent;
	}
	/* 	thead */
	.mypage-container .table_wrap table th {
		text-align: center;
		vertical-align: middle;
		font-weight: 500;
		border-top: 1px solid #bcbcbc !important;
   		border-bottom: 1px solid #e1e1e1 !important;
	}
	/* 	tbody */
	.mypage-container .table_wrap tbody tr:hover {
	    background-color: var(--whiteGray) !important;
	}
	.mypage-container .table_wrap table td {
		font-weight: 300;
		font-size: .75rem;
		border-top:unset !important;
		border-bottom: 0.5px solid var(--grayEF) !important;
	}
	.mypage-container .table_wrap table td:not(.td_title) {
		text-align: center;
	}
	.mypage-container .table_wrap table td.td_title {
    	padding-left: 0.4rem !important;
	}
	.mypage-container .table_wrap table .td_writer a {
		color:var(--gray) !important;
		font-size:0.7rem;
	}
	.mypage-container .table_wrap table .td_writer a:hover, .mypage-container .table_wrap table .td_writer a:active, .mypage-container .table_wrap table .td_writer a:focus {
		color:var(--gray) !important;
		text-decoration: underline;
	}
	.mypage-container .table_wrap table .td_title a:hover, .mypage-container .table_wrap table .td_title a:active, .mypage-container .table_wrap table .td_title a:focus {
		color:var(--black) !important;
		text-decoration: underline;
	}
	/* 넓이설정 */
	.mypage-container .table_wrap table .td_no{width:50px}.mypage-container .table_wrap table .td_district{width:55px}.mypage-container .table_wrap table .td_city{width:55px}.mypage-container .table_wrap table .td_sort{width:55px}.mypage-container .table_wrap table .td_writer{width:100px;}.mypage-container .table_wrap table .td_date{width:55px}.mypage-container .table_wrap table .td_like{width:50px}.mypage-container .table_wrap table .td_view{width:50px}	
	.mypage-container .table_wrap table .td_no:not(.td_notice), 
	.mypage-container .table_wrap table .td_date, 
	.mypage-container .table_wrap table .td_like, 
	.mypage-container .table_wrap table .td_view {
		font-size:0.65rem !important;
	    line-height: 1.7 !important;
		color:var(--gray) !important;
	}
	
	/* 	체크박스 사이즈 */
	.mypage-container .custom-control-label::before {
		width:.8rem;
		height:.8rem;
	}
	.mypage-container .custom-control-label::after {
		width:.8rem;
		height:.8rem;
	}
	
	.mypage-container .custom-control {
		min-height:unset;
		padding-left: 0;
	}
	
	.mypage-container .custom-control label {
   		margin-bottom: 0;
	}
	
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container mypage-container my-4">
		<div class="mypage_top row">
				<div class="mypage_top_left">
					<div class="profile-img" 
						 style="background: url(${contextPath}/resources/image/profile.jpg);
						  width:80px; height:80px;"></div>
				</div>
				<div class="mypage_top_right ml-4">
					<div class="font-size-105 font-weight-500 mb-1">
						윤지
					</div>
					<div class="font-size-090 mb-1">
						<span class="text-muted">지역 </span><span class="text-pink mr-3">울산</span>
						<span class="mr-3 text-muted">총 게시물 <span class="text-pink">100</span>개</span>
						<span class="text-muted">총 댓글 <span class="text-pink">200</span>개</span>
					</div>
					<div class="font-size-090">
						<span class="mr-2 text-muted">자기소개</span><span>맛집 찾아 삼만리</span>
					</div>
				</div>
		</div>
		<div class="mypage_middle">
			<!-- Nav tabs -->
				<ul class="nav nav-tabs mt-3 mx-4">
				  <li class="nav-item">
				    <a class="nav-link active" data-toggle="tab" href="#all">작성한 글</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" data-toggle="tab" href="#menu1">작성한 댓글</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" data-toggle="tab" href="#menu2">북마크한 게시글</a>
				  </li>
				  <a href="" class="btn btn-pink-outline ml-auto">글쓰기</a>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content px-4">
					<div id="all" class="tab-pane fade show active px-3">
						<br>
						<div class="px-4">
	<!-- 글목록 -->
	<div class="table_wrap">
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>지역</th>
					<th>구역</th>
					<th>분류</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>좋아요</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
				<!--조회된 게시글 목록 있을 때 -->
				<c:forEach var="v" begin="300" end="310">
					<tr>
						<!-- 번호 -->
						<td  class="td_no">
							<!-- 자기 글일때만 체크 버튼 보이기 -->
							<div class="custom-control custom-checkbox">
								 <input class="${v>3 ?  'custom-control-input' : 'd-none'}" type="checkbox" id="board${v}">
								  <label class="${v>3 ?  'custom-control-label' : ''}" for="board${v}">
								 	${v}
								  </label>
							</div>
						</td>
						<!-- 구역 -->
						<td class="td_district">
							<a href="" class="district ">
								충청남도
							</a>
						</td>
						<!-- 지역 -->
						<td class="td_city">
							<a href="" class="city ">
								천안
							</a>
						</td>
						<!-- 분류 -->
						<td class="td_sort">
							<a href="" class="">	
								맛집
							</a>
						</td>
						<!-- 제목 -->
						<td class="td_title">
							<a href="" class="">
								제목
							</a>
							<span class="text-pink mx-1">[3]</span>
							<!-- 사진유무 -->
							<svg xmlns="http://www.w3.org/2000/svg" width="0.95rem" height="0.95rem" fill="var(--pink50)" class="bi bi-image" viewBox="0 0 16 16">
							  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
							  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
							</svg>
							<!-- 지도유무 -->
							<svg width="0.95rem" height="0.95rem" viewBox="0 0 16 16" class="bi bi-geo-alt-fill" fill="var(--pink50)" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
							</svg>
						</td>
						<!-- 글쓴이 -->
						<td class="td_writer">
							<a href="" class="">
								닉네임
							</a>
						</td>
						<!-- 작성일 -->
						<td class="td_date ">
						<!-- now랑 글작성일이랑 같으면 HH:mm형식으로 보여주고 같지않으면 yy.MM.dd 형식으로 보여주기 -->
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yy.MM.dd" var="today" />
						<c:out value="${today}" />
						</td>
						<!-- 좋아요 -->
						<td class="td_like ">113</td>
						<!-- 조회 -->
						<td  class="td_view ">1003</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- pagination -->
	<div class="page_wrap mt-4">
		<nav class="pagination-sm">
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<a class="page-link" href="#">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
					</svg></a>
				</li>
				<li class="page-item active">
					<a class="page-link" href="#">1</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">2</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">3</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">4</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">5</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
					</svg></a>
				</li>
			</ul>
		</nav>
	</div>
	<!-- pagination end -->
	<!-- 검색 -->
	<div class="search_wrap text-center mb-4">
		<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0">
			<div class="input-group">
				<select class="form-control rounded-0">
					<option value="titcont">제목+내용</option>
					<option value="title">제목</option>
					<option value="writer">작성자</option>
				</select>
				<div class="input-group-append">
					<input type="text" class="form-control rounded-0"
						placeholder="검색어를 입력하세요.">
				</div>
				<div class="input-group-append">
					<button class="btn btn-pink btn-sm rounded-0" type="button">
						<i class="fa fa-search font-size-090"></i>
					</button>
				</div>
			</div>
		</form>
	</div>
</div>	
					</div>
					<div id="menu1" class="tab-pane fade">
						<br>
					</div>
					<div id="menu2" class="tab-pane fade">
						<br>
					</div>
				</div>
		</div>
	</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
<%@ include file="../cdn/js.jsp" %>
	<script>
	</script>
</body>
</html>