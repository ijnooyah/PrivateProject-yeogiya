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
	
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container board-container d-md-flex my-4">
		<jsp:include page="./sidebar.jsp" flush="false"/>
		<div class="row card ml-auto">
		<c:choose>
			<c:when test="${bs.sortBoard == 'all'}">
				<jsp:include page="./listAll.jsp" flush="false"/>
			</c:when>
			<c:otherwise>
				<jsp:include page="./list.jsp" flush="false"/>
			</c:otherwise>
		</c:choose>
		<jsp:include page="./search.jsp" flush="false"/>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" flush="false"/>
	<%@ include file="../cdn/js.jsp" %>
</body>
</html>