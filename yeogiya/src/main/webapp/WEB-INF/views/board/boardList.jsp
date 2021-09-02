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
		border: 1px solid var(--grayEF);
		padding: 1.8rem;
		box-sizing: border-box;
		border-radius: 0.13rem;
		width:845px;
	}
	
	/* 지역바 */
	.district_wrap a, .district_wrap span {
		color:var(--black);
		font-weight:500;
		font-size: .95rem;
	}
	.district_wrap span{
		font-weight:300;
		font-size: .9rem;
	}
	.district_wrap a:hover, .district_wrap a:focus, .district_wrap a:active, .district_wrap a.active {
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
		border-bottom: 0.5px solid var(--grayEF) !important;
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
	<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container d-md-flex my-4">
		<jsp:include page="./sidebar.jsp" flush="false"/>
		<div class="row card ml-auto">
			<!-- 탑 -->
			<jsp:include page="./top.jsp" flush="false"/>
			<!-- 리스트 -->
			<jsp:include page="./list.jsp" flush="false"/>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
</body>
</html>