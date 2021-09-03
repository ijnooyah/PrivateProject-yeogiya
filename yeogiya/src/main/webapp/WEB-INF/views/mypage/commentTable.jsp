<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="pl-4">
	<!-- 상단 -->
	<div class="d-flex mb-1">
		<svg xmlns="http://www.w3.org/2000/svg" width="1.15rem" height="1.15rem" fill="currentColor" class="bi bi-trash-fill text-muted cursor-pointer mt-2 ml-1" viewBox="0 0 16 16" style="opacity:.7;">
		  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
		</svg>
		  <button type="button" class="btn-sm btn border dropdown-toggle ml-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    10개씩
		  </button>
		  <div class="dropdown-menu">
			  <c:forEach begin="10" end="50" step="10" var="v">
				<a class="dropdown-item" href="#">${v}개씩</a>
			</c:forEach>
		  </div>
	</div>
	 <!-- 목록 -->
	<div class="table_wrap">
		<table class="table">
			<thead>
				<tr>
					<th>
					<div class="custom-control custom-checkbox">
						 <input class="custom-control-input" type="checkbox" id="allCheck">
						 <label class="custom-control-label" for="allCheck"></label>
					</div>
					</th>
					<th>작성일</th>
					<th>작성자</th>
					<th>댓글내용</th>
					<th>원문제목</th>
				</tr>
			</thead>
			<tbody>
				<!--조회된 게시글 목록 있을 때 -->
				<c:forEach var="v" begin="1" end="10">
					<tr>
						<td>
							<!-- 자기 글일때만 체크 버튼 보이기 -->
							<div class="custom-control custom-checkbox">
								 <input class="${v>0 ?  'custom-control-input' : 'd-none'}" type="checkbox" id="board${v}">
								 <label class="${v>0 ?  'custom-control-label' : ''}" for="board${v}"></label>
							</div>
						</td>
						<!-- 작성일 -->
						<td class="td_date ">
							<!-- now랑 글작성일이랑 같으면 HH:mm형식으로 보여주고 같지않으면 yy.MM.dd 형식으로 보여주기 -->
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yy.MM.dd" var="today" />
							<c:out value="${today}" />
						</td>
						<!-- 작성자 -->
						<td class="td_writer">
							<a href="" class="">
								닉네임
							</a>
						</td>
						<td class="td_title short_title" style="width:305px;">
						 	댓글 내용
						</td>
						<td class="td_title" style="width:305px;">
						 	<a href="" class="short_title">
						 	제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목
							</a>
						</td>
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