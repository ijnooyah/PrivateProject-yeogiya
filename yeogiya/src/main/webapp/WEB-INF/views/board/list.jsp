<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
td.td_title {
min-width:397px;
}
tr.tr_notice td.td_title .short_title {
width:310px;
}
tr:not(.tr_notice) td.td_title .short_title {
width:290px;
}

.board-container .dropdown-menu {
    margin-top: -1px;
}
.board-container .dropdown-item {
    padding: .25rem 0;
    text-align: center;
}

div.local_title span {
	font-family:'logo';
	font-size:1.3rem;
	color:var(--pink);
	position:relative;
}
div.local_title span::after {
	position: absolute;
    bottom: 0;
    left: 0;
    content: '';
    display: block;
    width: 100%;
    height: 1.5px;
    background: var(--pink);
}
.local_wrap a, .local_wrap span {
	color:var(--gray);
	font-family:'logo';
	font-size: .9rem;
}
.local_wrap span{
	font-weight:300;
	font-size: .9rem;
}
.local_wrap a:hover, .local_wrap a:focus, .local_wrap a:active, .local_wrap a.active {
    color: var(--pink);
    text-decoration: none;
}
</style>
<div class="px-4">
	<!-- 분류 -->
	<div class="d-flex mb-1">
		<div class="dropdown">
			<button type="button" class="btn-sm btn border-0 dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  분류
			</button>
			<div class="dropdown-menu" style="min-width:3.55rem;">
				<a class="dropdown-item" href="#">전체</a>
				<a class="dropdown-item" href="#">사담</a>
				<a class="dropdown-item" href="#">추천</a>
			</div>
		</div>
		<div class="dropdown">
			<button type="button" class="btn-sm btn border-0 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  말머리
			</button>
			<div class="dropdown-menu" style="min-width:4rem;">
				<a class="dropdown-item" href="#">전체</a>
				<a class="dropdown-item" href="#">식당</a>
				<a class="dropdown-item" href="#">카페</a>
				<a class="dropdown-item" href="#">운동</a>
				<a class="dropdown-item" href="#">미용실</a>
			</div>
		</div>
		<div class="dropdown ml-auto">
			<button type="button" class="btn-sm btn border-0 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  최신순
			</button>
			<div class="dropdown-menu" style="min-width:4rem;">
				<a class="dropdown-item" href="#">최신순</a>
				<a class="dropdown-item" href="#">댓글순</a>
				<a class="dropdown-item" href="#">좋아요순</a>
				<a class="dropdown-item" href="#">조회수순</a>
			</div>
		</div>
	</div>
	<!-- 글목록 -->
	<div class="table_wrap">
		<table class="table" style="margin-bottom:.5rem;">
			<thead>
				<tr>
					<th>번호</th>
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
					<tr class="tr_notice">
						<!-- 번호 -->
						<td class="td_no td_notice">
							<div class='badge badge-pink p-1'>
							공지
							</div>
						</td>
						<!-- 분류 -->
						<td class="td_sort">
							<a href="" class="">	
								추천
							</a>
						</td>
						<!-- 제목 -->
						<td class="td_title d-flex">
							<span class="place_sort mr-1 text-muted font-weight-400">[맛집]</span>
							<a href="" class="short_title">
								제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목
							</a>
							<span class="text-pink mx-1">[3]</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="0.95rem" height="0.95rem" fill="var(--pink50)" class="bi bi-image" viewBox="0 0 16 16" style="margin-top:2px;">
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
						<!-- 분류 -->
						<td class="td_sort">
							<a href="" class="">	
								사담
							</a>
						</td>
						<!-- 제목 -->
						<td class="td_title d-flex">
							<span class="place_sort mr-1 text-muted font-weight-400">[맛집]</span>
							<a href="" class="short_title">
								제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목
							</a>
							<span class="text-pink mx-1">[3]</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="0.95rem" height="0.95rem" fill="var(--pink50)" class="bi bi-image mr-1" viewBox="0 0 16 16" style="margin-top:2px;">
							  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
							  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
							</svg>
							<!-- 지도유무 -->
							<svg width="0.95rem" height="0.95rem" viewBox="0 0 16 16" class="bi bi-geo-alt-fill" fill="var(--pink50)" xmlns="http://www.w3.org/2000/svg" style="margin-top:2px;"> 
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
	<div class="d-flex">
		<a type="button" class="btn-sm btn border ml-auto mr-2 font-size-075 rounded-0">
			    글쓰기
		</a>
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