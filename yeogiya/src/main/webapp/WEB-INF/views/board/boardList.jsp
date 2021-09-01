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
	<title>boardList</title>
	<style>
	@media (min-width: 1200px) {
	.container, .container-lg, .container-md, .container-sm, .container-xl {
	    max-width: 1100px !important;
		}
	}
	.card {
		border: 1px solid var(--lightGray);
		padding: 1.8rem;
		box-sizing: border-box;
		border-radius: 0.13rem;
		width:845px;
	}
	
	/* 지역바 */
	.district_bar a, .district_bar span {
		color:var(--black);
		font-weight:500;
		font-size: .95rem;
	}
	.district_bar span{
		font-weight:300;
		font-size: .9rem;
	}
	.district_bar a:hover, .district_bar a:focus, .district_bar a:active, .district_bar a.active {
	    color: var(--pink);
	    font-weight:600;
	    text-decoration: none;
	}
	/* 	검색창 */
	.search_wrap .form-control, .search_wrap .btn {
 		height: 33px; 
	    font-size: .75rem; 
	}
	.search_wrap input {
 		width: 220px !important; 
	}
	/* 	탭 */
	.nav-tabs {
	    border-bottom: 1px solid var(--pink) !important;
	}
	.nav-tabs .nav-link:focus, .nav-tabs .nav-link:hover {
	    border-color: var(--pink30) var(--pink30) var(--pink30) !important;
	}
	.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	    color: var(--pink) !important;
	    border-color: var(--pink) var(--pink) var(--white) !important;
	}
	a.nav-link {
	    color: var(--black);
	    font-size: 0.8rem;
	    font-weight: 500;
	}
	a.nav-link:hover {
	    color: var(--pink);
	}
	/* 글쓰기버튼 */
	a.btn.btn-pink-outline.ml-auto {
		transform: scale(.7);
		font-weight:500;
	}
	/*테이블*/
	.list_wrap {
	    font-size: 0.8rem;
	}
	.list_wrap table td, .list_wrap table th {
    	padding: .4rem 0 .4rem 0 !important;
	}
	.list_wrap table {
		border-collapse: unset;
		border-spacing: 0px;
	}
	.list_wrap table a{
		color: var(--black);
	    text-decoration: none;
	    background-color: transparent;
	}
	.list_wrap table a:hover, .list_wrap table a:active, .list_wrap table a:focus {
		color: var(--pink);
	    text-decoration: none;
	    background-color: transparent;
	}
	/* 	thead */
	.list_wrap table th {
		text-align: center;
		vertical-align: middle;
		font-weight: 500;
		border-top: 1px solid #bcbcbc !important;
   		border-bottom: 1px solid #e1e1e1 !important;
	}
	/* 	tbody */
	.list_wrap tbody tr:hover {
	    background-color: var(--whiteGray) !important;
	}
	.list_wrap table td {
		font-weight: 300;
		font-size: .75rem;
		border-top:unset !important;
		border-bottom: 0.5px solid var(--lightGray) !important;
	}
	.list_wrap table td:not(.td_title) {
		text-align: center;
	}
	.list_wrap table td.td_title {
    	padding-left: 0.4rem !important;
	}
	.list_wrap table .td_writer a {
		color:var(--gray) !important;
		font-size:0.7rem;
	}
	.list_wrap table .td_writer a:hover, .list_wrap table .td_writer a:active, .list_wrap table .td_writer a:focus {
		color:var(--gray) !important;
		text-decoration: underline;
	}
	.list_wrap table .td_title a:hover, .list_wrap table .td_title a:active, .list_wrap table .td_title a:focus {
		color:var(--black) !important;
		text-decoration: underline;
	}
	/* 넓이설정 */
	.list_wrap table .td_no{width:50px}.list_wrap table .td_district{width:55px}.list_wrap table .td_city{width:55px}.list_wrap table .td_sort{width:55px}.list_wrap table .td_writer{width:100px;}.list_wrap table .td_date{width:55px}.list_wrap table .td_like{width:50px}.list_wrap table .td_view{width:50px}	
	.list_wrap table .td_no:not(.td_notice), 
	.list_wrap table .td_date, 
	.list_wrap table .td_like, 
	.list_wrap table .td_view {
		font-size:0.65rem !important;
	    line-height: 1.7 !important;
		color:var(--gray) !important;
	}
	/* pagination */
	.pagination-sm .page-link {
	    padding: .2rem .5rem;
	    font-size: .75rem;
	    line-height: 1.5;
	}
	.pagination .page-item {
    	margin-left: .45rem;
	}
	.pagination .page-item:first-child .page-link,
	.pagination .page-item:last-child .page-link {
	    border: none;
	}
	.pagination .page-item:first-child .page-link:hover,
	.pagination .page-item:last-child .page-link:hover {
	    background:none !important;
	}
	
	.pagination .page-item .page-link {
	    border-radius: 3px;
	}
	.page-item.active .page-link {
	    background-color: var(--pink) !important;
	    border-color: var(--pink) !important;
	}
	.page-link:focus {
	    box-shadow: none !important;
	}
	.page-link:hover {
	    color: var(--white) !important;
	    text-decoration: none;
	    background: var(--pink) !important;
	    border-color: var(--pink) !important;
	}
	.pagination .page-link, .pagination .page-link > svg, .pagination .page-link:hover > svg  {
	    color: var(--black);
	}
	</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div class="container d-md-flex my-4">
		<%@ include file="../common/sidebar.jsp" %>
		<div class="row card ml-auto">
			<div class="district_bar text-center" >
				<a class="active" href="">전체</a> <span class=""> |</span> 
				<a class="" href="">남구</a> <span class=""> |</span> 
				<a class="" href="">동구</a> <span class=""> |</span> 
				<a class="" href="">북구</a>
			</div>
			<!-- 검색 -->
			<div class="search_wrap text-center mt-4">
				<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0">
                       <div class="input-group">
                      		 <select class="form-control">
							<option value="titcont">제목+내용</option>
							<option value="title">제목</option>
							<option value="writer">작성자</option>
						</select>
						 <div class="input-group-append">
                            <input type="text" class="form-control rounded-0" placeholder="검색어를 입력하세요.">
						 </div>
                           <div class="input-group-append">
                               <button class="btn btn-pink" type="button">
                                   <i class="fa fa-search font-size-090"></i>
                               </button>
                           </div>
                       </div>
                  	</form>
		   </div>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs mt-3">
			  <li class="nav-item">
			    <a class="nav-link active" data-toggle="tab" href="#all">전체</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu1">맛집</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu2">병원</a>
			  </li>
			  <a href="" class="btn btn-pink-outline ml-auto">글쓰기</a>
			</ul>
	
			<!-- Tab panes -->
			<div class="tab-content px-3">
			  <div id="all" class="tab-pane fade show active"><br>
				<div class="list_wrap">
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
									<!-- 공지목록 -->
								<c:forEach var="v" begin="1" end="3">
									<tr>
										<!-- 번호 -->
										<td class="td_no td_notice">
											<div class='badge p-1 bg-pink text-white font-weight-500'>
											공지
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
											<svg xmlns="http://www.w3.org/2000/svg" width="0.95rem" height="0.95rem" fill="var(--pink50)" class="bi bi-image" viewBox="0 0 16 16">
											  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
											  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
											</svg>
										</td>
										<!-- 글쓴이 -->
										<td class="td_writer">
											<a href=""  class="">
												관리자
											</a>
										</td>
										<!-- 날짜 -->
										<td  class="td_date">
										21.08.27
										</td>
										<!-- 좋아요 -->
										<td  class="td_like">113</td>
										<!-- 조회 -->
										<td  class="td_view">1003</td>
									</tr>
								</c:forEach>
								<c:forEach var="v" begin="1" end="10">
									<tr>
										<!-- 번호 -->
										<td  class="td_no">
											${v}
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
											<svg xmlns="http://www.w3.org/2000/svg" width="0.95rem" height="0.95rem" fill="var(--pink50)" class="bi bi-image" viewBox="0 0 16 16">
											  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
											  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
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
			  </div>
			  <!-- 탭 content end -->
			  <div id="menu1" class="tab-pane fade"><br>
			  </div>
			  <div id="menu2" class="tab-pane fade"><br>
			  </div>
			</div>
			<!-- Tab panes end -->
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
	<%@ include file="../cdn/js.jsp" %>
</body>
</html>