<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<%@ include file="../cdn/css.jsp" %>
	<title>boardList</title>
	<style>
	@media (min-width: 1200px) {
	.board-container.container {
	    max-width: 1100px !important;
		}
	}
	.board-container .card {
		border: 1px solid var(--grayEF);
		box-sizing: border-box;
		border-radius: 0.13rem;
		width:845px;
	}
	
	/* 지역바 */
	.board-container .district_wrap a, .board-container .district_wrap span {
		color:var(--black);
		font-weight:500;
		font-size: .95rem;
	}
	.board-container .district_wrap span{
		font-weight:300;
		font-size: .9rem;
	}
	.board-container .district_wrap a:hover, .board-container .district_wrap a:focus, .board-container .district_wrap a:active, .board-container .district_wrap a.active {
	    color: var(--pink);
	    font-weight:600;
	    text-decoration: none;
	}
	/* 	탭 */
	.board-container .nav-tabs .nav-link {
	    font-size: 13px;
	    font-weight: 500;
	}
	/*테이블*/
	.board-container .table_wrap {
	    font-size: 0.8rem;
	}
	.board-container .table_wrap table td, .board-container .table_wrap table th {
    	padding: .4rem 0 .4rem 0 !important;
	}
	.board-container .table_wrap table {
		border-collapse: unset;
		border-spacing: 0px;
	}
	.board-container .table_wrap table a{
		color: var(--black);
	    text-decoration: none;
	    background-color: transparent;
	}
	.board-container .table_wrap table a:hover, .board-container .table_wrap table a:active, .board-container .table_wrap table a:focus {
		color: var(--pink);
	    text-decoration: none;
	    background-color: transparent;
	}
	/* 	thead */
	.board-container .table_wrap table th {
		text-align: center;
		vertical-align: middle;
		font-weight: 500;
		border-top: 1px solid #bcbcbc !important;
   		border-bottom: 1px solid #e1e1e1 !important;
	}
	/* 	tbody */
	.board-container .table_wrap tbody tr:hover {
	    background-color: var(--whiteGray) !important;
	}
	.board-container .table_wrap table td {
		font-weight: 300;
		font-size: .75rem;
		border-top:unset !important;
		border-bottom: 0.5px solid var(--grayEF) !important;
	}
	.board-container .table_wrap table td:not(.td_title) {
		text-align: center;
	}
	.board-container .table_wrap table td.td_title {
    	padding-left: 0.4rem !important;
	}
	.board-container .table_wrap table .td_writer a {
		color:var(--gray) !important;
		font-size:0.7rem;
	}
	.board-container .table_wrap table .td_writer a:hover, .board-container .table_wrap table .td_writer a:active, .board-container .table_wrap table .td_writer a:focus {
		color:var(--gray) !important;
		text-decoration: underline;
	}
	.board-container .table_wrap table .td_title a:hover, .board-container .table_wrap table .td_title a:active, .board-container .table_wrap table .td_title a:focus {
		color:var(--black) !important;
		text-decoration: underline;
	}
	/* 넓이설정 */
	.board-container .table_wrap table .td_no{width:50px}.board-container .table_wrap table .td_district{width:55px}.board-container .table_wrap table .td_city{width:55px}.board-container .table_wrap table .td_sort{width:55px}.board-container .table_wrap table .td_writer{width:100px;}.board-container .table_wrap table .td_date{width:55px}.board-container .table_wrap table .td_like{width:50px}.board-container .table_wrap table .td_view{width:50px}	
	.board-container .table_wrap table .td_no:not(.td_notice), 
	.board-container .table_wrap table .td_date, 
	.board-container .table_wrap table .td_like, 
	.board-container .table_wrap table .td_view {
		font-size:0.65rem !important;
	    line-height: 1.7 !important;
		color:var(--gray) !important;
	}
	/* pagination */
	.board-container .pagination-sm .page-link {
	    padding: .2rem .5rem;
	    font-size: .75rem;
	    line-height: 1.5;
	}
	.board-container .pagination .page-item {
    	margin-left: .45rem;
	}
	.board-container .pagination .page-item:first-child .page-link,
	.board-container .pagination .page-item:last-child .page-link {
	    border: none;
	}
	.board-container .pagination .page-item:first-child .page-link:hover,
	.board-container .pagination .page-item:last-child .page-link:hover {
	    background:none !important;
	}
	
	.board-container .pagination .page-item .page-link {
	    border-radius: 3px;
	}
	.board-container .pagination .page-item.active .page-link {
	    background-color: var(--pink) !important;
	    border-color: var(--pink) !important;
	    color: var(--white) !important;
	}
	.board-container .pagination .page-link:focus {
	    box-shadow: none !important;
	}
	.board-container .pagination .page-link:hover {
	    color: var(--white) !important;
	    text-decoration: none;
	    background: var(--pink) !important;
	    border-color: var(--pink) !important;
	}
	.board-container .pagination .page-link, .board-container .pagination .page-link > svg, .board-container .pagination .page-link:hover > svg  {
	    color: var(--black);
	}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container board-container d-md-flex my-4">
		<jsp:include page="./sidebar.jsp" flush="false"/>
		<div class="row card ml-auto">
			<!-- 탑 -->
			<jsp:include page="./top.jsp" flush="false"/>
			<!-- 리스트 -->
			<!-- Nav tabs -->
			<ul class="nav nav-tabs mt-3 mx-4">
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
			<div class="tab-content px-4">
				<div id="all" class="tab-pane fade show active">
					<br>
					<jsp:include page="./list.jsp" flush="false"/>
				</div>
				<div id="menu1" class="tab-pane fade">
					<br>
					<jsp:include page="./list.jsp" flush="false"/>
				</div>
				<div id="menu2" class="tab-pane fade">
					<br>
					<jsp:include page="./list.jsp" flush="false"/>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
</body>
</html>