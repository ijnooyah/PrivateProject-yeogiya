<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.yj.yeogiya.model.vo.Sort"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%	
	//지역 카테고리 리스트
	List<Sort> sortLocalList = (List<Sort>) request.getAttribute("sortLocalList");
	List<Sort> sortLocalPArr = new ArrayList<>(); // 상위 지역 카테고리 초기화
	for (Sort sortLocalP : sortLocalList) { // 상위 지역 카테고리 담기
		 if(sortLocalP.getSort_level() == 1) {
			 sortLocalPArr.add(sortLocalP);
		 }
	}
	List<Sort> sortLocalCArr = new ArrayList<>(); //하위 지역 카테고리 초기화
	for (Sort sortLocalC : sortLocalList) { //하위 지역 카테고리 담기
		 if(sortLocalC.getSort_level() == 2) {
			 sortLocalCArr.add(sortLocalC);
		 }
	}
	
	JSONArray slJsonArr = JSONArray.fromObject(sortLocalList);
// 	// 현재 상위지역 객체 얻기
// 	Sort sortLocalP = (Sort) request.getAttribute("sortLocalP"); 
// 	// 게시판 카테고리 
// 	List<Sort> sortBoardArr = (List<Sort>) request.getAttribute("sortBoardList");
// 	// 장소 카테고리
// 	List<Sort> sortPlaceArr = (List<Sort>) request.getAttribute("sortPlaceList");
// 	// 현재 상위 지역에 따른 하위지역담을 리스트 초기화
// 	List<Sort> subLocalArr = new ArrayList<>();	
// 	// 하위 지역중 전체 카테고리 만들기
// 	Sort subLocalAll = new Sort("all", "전체", 2, sortLocalP.getSort_no());
// 	// 하위지역 리스트에 담기
// 	subLocalArr.add(subLocalAll);
// 	// 하위지역 리스트에 담기
// 	for (Sort subLocal : sortLocalList) {
// 		if (subLocal.getParent_sort() != null) {
// 			 if(subLocal.getParent_sort().equals(sortLocalP.getSort_no())) {
// 				 subLocalArr.add(subLocal);
// 			 }
// 		}
// 	}
	
%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<c:set var="sortLocalPArr" value="<%=sortLocalPArr%>" scope="application"/>
<c:set var="sortLocalCArr" value="<%=sortLocalCArr%>" scope="application"/>
<c:set var="slJsonArr" value="<%=slJsonArr%>" scope="application"/>
<%-- <c:set var="subLocalArr" value="<%=subLocalArr%>" scope="application"/> --%>
<%-- <c:set var="sortBoardArr" value="<%=sortBoardArr%>" scope="application"/> --%>
<%-- <c:set var="sortPlaceArr" value="<%=sortPlaceArr%>" scope="application"/> --%>

<%-- <c:set var="localPath" value="${contextPath}/${sortLocalP.eng_name}" scope="application"/> --%>
<%-- <c:set var="listPath" value="${contextPath}/${sortLocalP.eng_name}/list" scope="application"/> --%>
<c:set var="noProfile" value="${contextPath}/resources/image/no-profile.png" scope="application"/>


<c:if test="${not empty bs.sortBoard}">
	<c:set var="sortBoard" value="sortBoard=${bs.sortBoard}" scope="request"/>
</c:if>
<c:if test="${not empty bs.subLocal}">
	<c:set var="subLocal" value="&subLocal=${bs.subLocal}" scope="request"/>
</c:if>
<c:if test="${not empty bs.sortPlace}">
	<c:set var="sortPlace" value="&sortPlace=${bs.sortPlace}" scope="request"/>
</c:if>
<c:if test="${not empty bs.page }">
	<c:set var="page" value="&page=${bs.page}" scope="request"/>
</c:if>
<c:if test="${not empty bs.perPage }">
	<c:set var="perPage" value="&perPage=${bs.perPage}" scope="request"/>
</c:if>
<c:if test="${not empty bs.order }">
	<c:set var="order" value="&order=${bs.order}" scope="request"/>
</c:if>
<c:if test="${not empty bs.searchType }">
	<c:set var="searchType" value="&searchType=${bs.searchType}" scope="request"/>
</c:if>
<c:if test="${not empty bs.keyword }">
	<c:set var="keyword" value="&keyword=${bs.keyword}" scope="request"/>
</c:if>
<c:set var="pageQ" value="${page}${perPage}" scope="request"/>
<c:set var="searchQ" value="${searchType}${keyword}" scope="request"/>
<c:set var="sortQ" value="${sortBoard}${subLocal}${sortPlace}" scope="request"/>
<c:set var="allQ" value="${sortQ}${pageQ}${order}${searchQ}" scope="request"/>
	
    <!-- font awsome-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
    <!-- fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
    <!-- bootstrap css-->
   	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

	<!--summernote -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

	<!-- tagit -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/tag-it/2.0/css/jquery.tagit.css" rel="stylesheet">
   	
   	<!-- my css -->
   	<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
   	<link rel="stylesheet" href="${contextPath}/resources/css/navbar.css">
   	
   	<!-- 카카오 지도 -->
   	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8902730ec3b20695d83c6d6757b1881a&libraries=services,clusterer,drawing"></script>