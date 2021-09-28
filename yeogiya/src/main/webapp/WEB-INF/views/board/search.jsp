<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<!-- pagination -->
	<div class="page_wrap mt-5">
		<nav class="pagination-sm">
			<ul class="pagination justify-content-center">
			<c:set var="prev" value="${bs.startPage - 1}"/>
           	<c:set var="next" value="${bs.endPage + 1}"/>
           	<c:if test="${prev > 0}">
           		<li class="page-item left">
					<a class="page-link" href="?${sortQ}&page=${prev}${perPage}${order}${searchQ}">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
					</svg></a>
				</li>
            </c:if>
            	<c:forEach var="v" begin="${bs.startPage}" end="${bs.endPage}">
            		<li class="page-item ${v == bs.page ? 'active' : '' }">
						<a class="page-link" href="?${sortQ}&page=${v}${perPage}${order}${searchQ}">${v}</a>
					</li>
				</c:forEach>
				<c:if test="${next <= bs.totalPage}">
               		 <li class="page-item right">
						<a class="page-link" href="?${sortQ}&page=${next}${perPage}${order}${searchQ}">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
						</svg></a>
					</li>
                </c:if>
			</ul>
		</nav>
	</div>
	<!-- pagination end -->
	<!-- 검색 -->
	<div class="search_wrap text-center mb-4">
		<form id="searchFrm" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0">
			<input type="hidden" name="sortBoard" value="${bs.sortBoard}">
			<c:if test="${bs.sortBoard != 'all'}">
				<input type="hidden" name="subLocal" value="${bs.subLocal}">
			</c:if>
			<c:if test="${not empty bs.sortPlace}">
				<input type="hidden" name="sortPlace" value="${bs.sortPlace}">
			</c:if>
<%-- 			<c:if test="${not empty bs.page}"> --%>
<%-- 				<input type="hidden" name="page" value="${bs.page}"> --%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${not empty bs.perPage}"> --%>
<%-- 				<input type="hidden" name="perPage" value="${bs.perPage}"> --%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${not empty bs.order}"> --%>
<%-- 				<input type="hidden" name="order" value="${bs.order}"> --%>
<%-- 			</c:if> --%>
			<div class="input-group">
				<select class="form-control rounded-0" name="searchType">
					<c:if test="${not empty bs.sortPlace}">
						<option value="p" ${bs.searchType == 'p' ? 'selected' : ''}>장소</option>
					</c:if>
					<option value="tc" ${bs.searchType == 'tc' ? 'selected' : ''}>제목+내용</option>
					<option value="t" ${bs.searchType == 't' ? 'selected' : ''}>제목</option>
					<option value="w" ${bs.searchType == 'w' ? 'selected' : ''}>작성자</option>
				</select>
				<div class="input-group-append">
					<input type="text" id="inputSearch" name="keyword" value="${bs.keyword}" class="form-control rounded-0"
						placeholder="검색어를 입력하세요.">
				</div>
				<div class="input-group-append">
					<button class="btn btn-pink btn-sm rounded-0" onclick="doSubmit();" type="button">
						<i class="fa fa-search font-size-090"></i>
					</button>
				</div>
			</div>
		</form>
	</div>

<script>
 function doSubmit() {
	 console.log('클릭');
	 console.log('val', $('#inputSearch').val());
	 if($('#inputSearch').val().trim() == '') {
		 Swal.fire({
	        	title: '검색어를 입력해 주세요!',
				allowOutsideClick: false,
				icon: 'error', 
				confirmButtonText: "확인",
				didClose: function() {
					$('#inputSearch').focus();
				}
		});
		return;
	 } else {
		 $('#searchFrm').submit();
	 }
 }
</script>
