<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row px-2">   
	<!-- 구역 카테고리 -->
	<div class="district_wrap">
		<a class="active" href="">전체</a> <span class=""> |</span> 
		<a class="" href="">남구</a> <span class=""> |</span> 
		<a class="" href="">동구</a> <span class=""> |</span> 
		<a class="" href="">북구</a>
	</div>
	<!-- 검색 -->
	<div class="search_wrap ml-auto">
		<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0">
			<div class="input-group">
				<select class="form-control">
					<option value="titcont">제목+내용</option>
					<option value="title">제목</option>
					<option value="writer">작성자</option>
				</select>
				<div class="input-group-append">
					<input type="text" class="form-control rounded-0"
						placeholder="검색어를 입력하세요.">
				</div>
				<div class="input-group-append">
					<button class="btn btn-pink" type="button">
						<i class="fa fa-search font-size-090"></i>
					</button>
				</div>
			</div>
		</form>
	</div>
</div>
