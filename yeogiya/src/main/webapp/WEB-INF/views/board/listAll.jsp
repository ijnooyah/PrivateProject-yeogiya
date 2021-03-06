<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
td.td_title {
min-width:350px;
}
td.td_title .short_title {
max-width:350px;
}

.board-container .dropdown-menu {
    margin-top: -1px;
}
.board-container .dropdown-item {
    padding: .25rem 0;
    text-align: center;
}

.dropdown-chevron > .dropdown-toggle::after,  .dropdown-chevron > .dropdown-toggle[aria-expanded=true]::after{
	background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE2LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgd2lkdGg9IjQ1MS44NDdweCIgaGVpZ2h0PSI0NTEuODQ2cHgiIHZpZXdCb3g9IjAgMCA0NTEuODQ3IDQ1MS44NDYiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDQ1MS44NDcgNDUxLjg0NjsiDQoJIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPHBhdGggZD0iTTI0OC4yOTIsMTA2LjQwNmwxOTQuMjgxLDE5NC4yOWMxMi4zNjUsMTIuMzU5LDEyLjM2NSwzMi4zOTEsMCw0NC43NDRjLTEyLjM1NCwxMi4zNTQtMzIuMzkxLDEyLjM1NC00NC43NDQsMA0KCQlMMjI1LjkyMywxNzMuNTI5TDU0LjAxOCwzNDUuNDRjLTEyLjM2LDEyLjM1NC0zMi4zOTUsMTIuMzU0LTQ0Ljc0OCwwYy0xMi4zNTktMTIuMzU0LTEyLjM1OS0zMi4zOTEsMC00NC43NUwyMDMuNTU0LDEwNi40DQoJCWM2LjE4LTYuMTc0LDE0LjI3MS05LjI1OSwyMi4zNjktOS4yNTlDMjM0LjAxOCw5Ny4xNDEsMjQyLjExNSwxMDAuMjMyLDI0OC4yOTIsMTA2LjQwNnoiLz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjwvc3ZnPg0K) !important;
	width: 10px !important;
    height: 10px !important;
    background-size: 10px !important;
    opacity: 1;
    content: '';
    border: 0;
    transform:rotate(90deg);
    position:absolute;
    left: 45px;
    top: 13px;
}
.dropdown-plain > .dropdown-toggle::after {
	content: none;
}
.dropdown-chevron > .dropdown-toggle, .dropdown-plain > .dropdown-toggle {
	font-weight:500;
}
</style>
<div class="px-4 pt-4">
	<div class="mt-2 mb-4" style="color:var(--pink);">
	<span class="h3 logo">${sortLocalP.sort_name}</span>
	<c:if test="${not empty bs.tag}">
		<span class="ml-2">&num;${bs.tag}</span>
	</c:if>
	</div>
	<div class="d-flex mb-1">
		<div class="dropdown ml-auto">
			<button type="button" class="btn-sm btn border-0 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  ${bs.perPage}??????
			</button>
			<div class="dropdown-menu" style="min-width:4rem;">
				<c:set var="step" value="5"/>
				<c:forEach var="v" begin="1" end="7" varStatus="vs">
					<c:if test="${vs.count < 4}">
						<c:set var="step" value="${step + 5}"/>
					</c:if>
					<c:if test ="${vs.count >=4 }">
						<c:set var="step" value="${step + 10}"/>
					</c:if>
					<a class="dropdown-item" href="?${sortQ}${tag}&page=1&perPage=${step}${order}${searchQ}">
						${step}??????</a>
				</c:forEach>
			</div>
		</div>
		<div class="dropdown">
			<c:set var="orderTxt" value="??????"/>
			<c:choose>
				<c:when test="${bs.order == 'like'}">
					<c:set var="orderTxt" value="????????????"/>
				</c:when>
				<c:when test="${bs.order == 'date'}">
					<c:set var="orderTxt" value="?????????"/>
				</c:when>
				<c:when test="${bs.order == 'cmt'}">
					<c:set var="orderTxt" value="?????????"/>
				</c:when>
				<c:when test="${bs.order == 'view'}">
					<c:set var="orderTxt" value="????????????"/>
				</c:when>
			</c:choose>
			<button type="button" class="btn-sm btn border-0 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  ${orderTxt}
			</button>
			<div class="dropdown-menu" style="min-width:4rem;">
				<a class="dropdown-item" href="?${sortQ}${tag}${pageQ}&order=date${searchQ}">?????????</a>
				<a class="dropdown-item" href="?${sortQ}${tag}${pageQ}&order=cmt${searchQ}">?????????</a>
				<a class="dropdown-item" href="?${sortQ}${tag}${pageQ}&order=like${searchQ}">????????????</a>
				<a class="dropdown-item" href="?${sortQ}${tag}${pageQ}&order=view${searchQ}">????????????</a>
			</div>
		</div>
	</div>
	<!-- ????????? -->
	<div class="table_wrap">
		<table class="table">
			<thead>
				<tr>
					<th>??????</th>
					<th>?????????</th>
<!-- 					<th>??????</th> -->
					<th>??????</th>
					<th>?????????</th>
					<th>?????????</th>
					<th>?????????</th>
					<th>??????</th>
				</tr>
			</thead>
			<tbody>
				<!--????????? ????????? ?????? ?????? ??? -->
				<c:forEach var="b" items="${boardList}">
					<tr>
						<!-- ?????? -->
						<td  class="td_no">
							${b.board_no}
						</td>
						<!-- ????????? -->
						<td class="td_sortBoard">
							<c:forEach var="sb" items="${sortBoardArr}">
								<c:if test="${b.sort_board == sb.sort_no}">
									<a href="?sortBoard=${b.sort_board}&subLocal=all&sortPlace=all" class="">	
									${sb.sort_name}
									</a>
								</c:if>
							</c:forEach>
						</td>
						<!-- ?????? -->
<!-- 						<td class="td_subLocal"> -->
<%-- 							<a href="?sortBoard=${b.sort_board}&subLocal=${b.sub_local}${not empty b.sort_place ? '&sortPlace=all' : ''}" class="">	 --%>
<%-- 							${b.subLocalName} --%>
<!-- 							</a> -->
<!-- 						</td> -->
						<!-- ?????? -->
						<td class="td_title d-flex">
							<c:if test="${not empty b.sort_place}">
<!-- 								<span class="place_sort mr-2 text-muted font-weight-400"> -->
<%-- 									${b.sortPlaceName}</span> --%>
							</c:if>
							<a href="${localPath}/content/${b.board_no}?sortBoard=${b.sort_board}&subLocal=${b.sub_local}${not empty b.sort_place ? ('&sortPlace=' += b.sort_place) : ''}" class="short_title">
								${b.board_title}
							</a>
							<span class="text-pink mx-2 font-weight-400">[${b.cmt_cnt}]</span>
							<c:if test="${b.has_img == 'Y'}">
								<svg xmlns="http://www.w3.org/2000/svg" width="0.95rem" height="0.95rem" fill="var(--pink50)" class="bi bi-image mr-2" viewBox="0 0 16 16" style="margin-top:2px;">
								  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
								  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
								</svg>
							</c:if>
							<!-- ???????????? -->
<!-- 							<svg width="0.95rem" height="0.95rem" viewBox="0 0 16 16" class="bi bi-geo-alt-fill" fill="var(--pink50)" xmlns="http://www.w3.org/2000/svg" style="margin-top:2px;">  -->
<!-- 							  <path fill-rule="evenodd" d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/> -->
<!-- 							</svg> -->
						</td>
						<!-- ????????? -->
						<td class="td_writer">
							<a href="${profilePath}/${b.user_id}" class="">
								${b.userNick}
							</a>
						</td>
						<!-- ????????? -->
						<td class="td_date ">
						<!-- now??? ?????????????????? ????????? HH:mm???????????? ???????????? ??????????????? yy.MM.dd ???????????? ???????????? -->
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yy.MM.dd" var="today" />
						<fmt:formatDate value="${b.reg_date}" pattern="yy.MM.dd" var="regDate"/>
						<c:choose>
							<c:when test="${regDate != today}">
								${regDate}
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${b.reg_date}" pattern="HH:mm"/>
							</c:otherwise>
						</c:choose>
						</td>
						<!-- ????????? -->
						<td class="td_like ">${b.like_cnt}</td>
						<!-- ?????? -->
						<td  class="td_view ">${b.view_cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<c:if test="${fn:length(boardList) == 0}">
		<div class="text-center py-5 font-size-085 text-muted">
				????????? ???????????? ????????????.
		</div>
	</c:if>
	
	<div class="d-flex mb-1">
		<a type="button" href="${localPath}/insert?${allQ}"
			class="loginNeed btn-sm btn ml-auto mr-2 btn-plain">
			    ?????????
		</a>
	</div>
</div>	