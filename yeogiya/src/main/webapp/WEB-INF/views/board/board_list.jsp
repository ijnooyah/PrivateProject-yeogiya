<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>main</title>
	
	<!-- pagination -->
	<link rel="stylesheet" href="${contextPath}/resources/yeogiya/css/main_pagination.css">
	<style>
/* 	공통사항 */
	@media (min-width: 768px)
	.d-md-flex {
	    display: -webkit-box!important;
	    display: -ms-flexbox!important;
	    display: flex!important;
	}
	
	.container-fluid{
		background:#f2f2f3;
		padding:2rem 5rem !important;
	}
	
	.card {
/* 		background: #fff; */
    	margin-left: 1.3rem !important;
    	border-radius: .15rem !important;
    	border:none !important;
    	padding:0 !important;
	}
	
/* 	테이블 */
	#list_table {
	    background: #fff;
	}
	#list_table th {
		text-align: center;
		vertical-align: middle;
		font-weight: 500;
	}
	#list_table td:not(.board_title) {
		text-align: center;
	}
	#list_table td:hover {
		cursor: pointer;
	}
	
	.list_wrapper {
/* 	    margin-left: 10rem; */
/* 	    margin-right: 10rem; */
	    font-size: 11px !important;
	}
	
	.table-hover tbody tr:hover {
	    background-color: rgb(242 198 194) !important;
	}
	
	.table td, .table th {
    	padding: .4rem 0 .4rem 0 !important;
	}
	
	td.board_title {
    	padding-left: 0.4rem !important;
	}
	
	#list_table th {
   		border-top: 1.5px solid #f2c6c2 !important;
   		border-bottom: 1px solid #f2c6c2 !important;
	}
	
	#list_table td {
		border-top:unset !important;
		border-bottom: 0.5px solid #f2c6c282 !important;
	}
	
	#list_table {
		border-collapse: unset;
		border-spacing: 0px;
	}
	
	#list_table a{
		color: #2e415d;
	    text-decoration: none;
	    background-color: transparent;
	}
	
	#list_table a:hover {
		color: #fff;
		font-weight:400 !important;
	    text-decoration: none;
	    background-color: transparent;
	}
	
	#list_table a:active, #list_table a:focus {
		color: #BF522A;
		font-weight:400 !important;
	}
	
/* 	탭 */
a.nav-link {
    color: #2e415d;
    font-size: 12px;
    font-weight: 500;
}
a.nav-link:hover {
    color: #F2C6C2;
}

.nav-tabs .nav-link:focus, .nav-tabs .nav-link:hover {
    border-color: #f2c6c275 #f2c6c270 #f2c6c273 !important;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #F2C6C2 !important;
    border-color: #f2c6c2 #f2c6c2 #f8f9fa !important;
}

.nav-tabs {
    border-bottom: 1px solid #f2c6c2 !important;
}

/* 기타 */
a.btn.btn_outline_pink.ml-auto {
transform: scale(.7);
font-weight:500;
}

.district_bar {
	background:#F2C6C2;
    text-align: center;
}

a.white_color, span.white_color {
	font-weight:500;
	font-size: 14px;
}

a.white_color:hover, a.white_color:focus, a.white_color:active, a.white_color.active {
    color: #3339A6;
    font-weight:600;
    text-decoration: none;
}
	</style>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class="container-fluid d-md-flex">
		<%@ include file="../include/sidebar.jsp" %>
		<div class="container card">
			<div class="district_bar" >
				<a class="white_color active" href="">전체</a> <span class="white_color"> |</span> 
				<a class="white_color" href="">남구</a> <span class="white_color"> |</span> 
				<a class="white_color" href="">동구</a> <span class="white_color"> |</span> 
				<a class="white_color" href="">북구</a>
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
			  <a href="" class="btn btn_outline_pink ml-auto">글쓰기</a>
			</ul>
	
			<!-- Tab panes -->
			<div class="tab-content">
			  <div id="all" class="container tab-pane active"><br>
			  		<!-- 글목록 -->
					<div class="list_wrapper">
							<table class="table table-hover" id="list_table">
								<thead>
									<tr>
										<th>번호</th>
										<th>지역</th>
										<th>구역</th>
										<th>카테고리</th>
										<th>제목</th>
										<th>글쓴이</th>
										<th>작성일</th>
										<th>좋아요</th>
										<th>조회</th>
									</tr>
								</thead>
				
								<%-- 게시글 목록 출력 --%>
								<tbody>
									<%-- 조회된 게시글 목록이 있을 때 --%>
									<c:forEach var="v" begin="1" end="3">
										<tr>
											<%-- 게시글 번호 --%>
											<td style="width:5%;">
												<div class='badge p-1 font-weight-normal orange_background white_color'>
												공지
												</div>
											</td>
											<%-- 지역 --%>
											<td style="width:6%;">
												<a href="" class="district font-weight-300">
													충청남도
												</a>
											</td>
											<%-- 구역 --%>
											<td style="width:6%;">
												<a href="" class="city font-weight-300">
													천안
												</a>
											</td>
											<%-- 분류 --%>
											<td style="width:6%;">
												<a href="" class="font-weight-300">	
													맛집
												</a>
											</td>
											<%-- 제목 --%>
											<td style="width:35%;" class="board_title">
												<a href="" class="font-weight-300">
													제목
												</a>
												<span class="orange_color mx-1">[3]</span>
												<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#bf522a85" class="bi bi-card-image" viewBox="0 0 16 16">
											  		<path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
											  		<path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm13 1a.5.5 0 0 1 .5.5v6l-3.775-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12v.54A.505.505 0 0 1 1 12.5v-9a.5.5 0 0 1 .5-.5h13z"/>
												</svg>
											</td>
											<%-- 글쓴이 --%>
											<td style="width:7%;">
												<a href=""  class="font-weight-300">
													관리자
												</a>
											</td>
											<%-- 작성일 --%>
											<td style="width:6%;" class="font-weight-300">
											2021.08.27
											</td>
											<%-- 좋아요 --%>
											<td style="width:4.5%;" class="font-weight-300">113</td>
											<%-- 조회 --%>
											<td style="width:4.5%;" class="font-weight-300">1003</td>
										</tr>
									</c:forEach>
									<%-- 조회된 게시글 목록이 있을 때 --%>
									<c:forEach var="v" begin="1" end="10">
										<tr>
											<%-- 게시글 번호 --%>
											<td style="width:5%;" class="font-weight-300">
												${v}
											</td>
											<%-- 지역 --%>
											<td style="width:6%;">
												<a href="" class="district font-weight-300">
													충청남도
												</a>
											</td>
											<%-- 구역 --%>
											<td style="width:6%;">
												<a href="" class="city font-weight-300">
													천안
												</a>
											</td>
											<%-- 분류 --%>
											<td style="width:6%;">
												<a href="" class="font-weight-300">	
													맛집
												</a>
											</td>
											<%-- 제목 --%>
											<td style="width:35%;" class="board_title">
												<a href="" class="font-weight-300">
													제목
												</a>
												<span class="orange_color mx-1">[3]</span>
												<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#bf522a85" class="bi bi-card-image" viewBox="0 0 16 16">
											  		<path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
											  		<path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm13 1a.5.5 0 0 1 .5.5v6l-3.775-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12v.54A.505.505 0 0 1 1 12.5v-9a.5.5 0 0 1 .5-.5h13z"/>
												</svg>
											</td>
											<%-- 글쓴이 --%>
											<td style="width:7%;">
												<a href="" class="font-weight-300">
													닉네임
												</a>
											</td>
											<%-- 작성일 --%>
											<td style="width:6%;" class="font-weight-300">
											<!-- now랑 글작성일이랑 같으면 HH:mm형식으로 보여주고 같지않으면 yyyy.MM.dd 형식으로 보여주기 -->
											<jsp:useBean id="now" class="java.util.Date" />
											<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
											<c:out value="${today}" />
											</td>
											<%-- 좋아요 --%>
											<td style="width:4.5%;" class="font-weight-300">113</td>
											<%-- 조회 --%>
											<td style="width:4.5%;" class="font-weight-300">1003</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 글목록 end -->
						<!-- pagination -->
						<div class="page-content page-container mt-4" id="page-content">
				        <div class="d-flex justify-content-center">
				            <div class="col-md-4 col-sm-6 grid-margin stretch-card">
			                    <nav>
			                        <ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
			                            <li class="page-item"><a class="page-link" href="#"><span class="fa fa-angle-left"></span></a></li>
			                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
			                            <li class="page-item"><a class="page-link" href="#" >2</a></li>
			                            <li class="page-item"><a class="page-link" href="#" >3</a></li>
			                            <li class="page-item"><a class="page-link" href="#" >4</a></li>
			                            <li class="page-item"><a class="page-link" href="#"><span class="fa fa-angle-right"></span></a></li>
			                        </ul>
			                    </nav>
				            </div>
				        </div>
					</div>
					<!-- pagination end -->
			  </div>
			  <!-- 탭 content end -->
			  <div id="menu1" class="container tab-pane fade"><br>
			  </div>
			  <div id="menu2" class="container tab-pane fade"><br>
			  </div>
			</div>
			<!-- Tab panes end -->
		</div>
	</div>
	<!-- container-fluid 끝 -->
	<%@ include file="../include/footer.jsp" %>
</body>
</html>