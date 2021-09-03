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
	
	.mypage-container .dropdown-toggle {
		border-radius: 0;
		font-size: .75rem;
	}
	.mypage-container .dropdown-menu {
		min-width: 4.2rem;
		margin-top: -1px;
	}
	
	.mypage-container .dropdown-item {
		padding: .25rem 0;
    	text-align: center;
	}
	
	.short_title {
		overflow: hidden;
		display: -webkit-box;
		-webkit-line-clamp: 1;
		-webkit-box-orient: vertical;
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
				</ul>
				<!-- Tab panes -->
				<div class="tab-content px-4">
					<div id="all" class="px-3 tab-pane fade show active">
						<br>
						<jsp:include page="./boardList.jsp" flush="false"/>
					</div>
					<div id="menu1" class="px-3 tab-pane fade">
						<br>
						<div class="pl-4">
							<!-- 상단 -->
							<div class="d-flex mb-1">
								<svg xmlns="http://www.w3.org/2000/svg" width="1.15rem" height="1.15rem" fill="currentColor" class="bi bi-trash text-muted cursor-pointer mt-2 ml-1" viewBox="0 0 16 16">
								  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
								  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
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
					</div>
					<div id="menu2" class="px-3 tab-pane fade">
						<br>
						<jsp:include page="./boardList.jsp" flush="false"/>
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