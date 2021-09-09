<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.yj.yeogiya.model.vo.Sort"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%	
	List<Sort> sortLocalList = (List<Sort>) request.getAttribute("sortLocalList");
	List<Sort> sortLocalPArr = new ArrayList<>();	
	for (Sort sortLocalP : sortLocalList) {
		 if(sortLocalP.getSort_level() == 1) {
			 sortLocalPArr.add(sortLocalP);
		 }
	}
	List<Sort> sortLocalCArr = new ArrayList<>();	
	for (Sort sortLocalC : sortLocalList) {
		 if(sortLocalC.getSort_level() == 2) {
			 sortLocalCArr.add(sortLocalC);
		 }
	}
	Sort sortLocalP = (Sort) request.getAttribute("sortLocalP");
	List<Sort> sortBoardArr = (List<Sort>) request.getAttribute("sortBoardList");
	List<Sort> sortPlaceArr = (List<Sort>) request.getAttribute("sortPlaceList");
	List<Sort> subLocalArr = new ArrayList<>();	
	for (Sort subLocal : sortLocalList) {
		if (subLocal.getParent_sort() != null) {
			 if(subLocal.getParent_sort().equals(sortLocalP.getSort_no())) {
				 subLocalArr.add(subLocal);
			 }
		}
	}
	
%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<c:set var="sortLocalPArr" value="<%=sortLocalPArr%>" scope="application"/>
<c:set var="sortLocalCArr" value="<%=sortLocalCArr%>" scope="application"/>
<c:set var="subLocalArr" value="<%=subLocalArr%>" scope="application"/>
<c:set var="sortBoardArr" value="<%=sortBoardArr%>" scope="application"/>
<c:set var="sortPlaceArr" value="<%=sortPlaceArr%>" scope="application"/>
<c:set var="listPath" value="${contextPath}/${sortLocalP.eng_name}/list" scope="application"/>
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