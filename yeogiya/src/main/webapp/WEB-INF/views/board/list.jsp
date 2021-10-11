<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
td.td_title {
min-width:400px;
}
td.td_title .short_title {
max-width:300px;
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
div.subLocal_wrap {
	border:1px solid var(--pink);
}
div.subLocal_wrap a {
	font-size:.8rem;
	color:var(--gray);
}
div.subLocal_wrap a:hover {
	text-decoration:none;
	color:var(--pink);
}
div.subLocal_wrap a.active {
	text-decoration:none;
	color:var(--pink);
}
</style>
<div class="px-4 pt-4">
	<div class="h3 logo mt-2" style="color:var(--pink);">
	<c:forEach var="sb" items="${sortBoardArr}">
		<c:if test="${bs.sortBoard == sb.sort_no || board.sort_board == sb.sort_no}">
			${sb.sort_name}
		</c:if>
	</c:forEach>
	</div>
	<div class="d-flex flex-wrap px-3 py-4 mx-1 mb-5 subLocal_wrap rounded-sm">
		<c:forEach var="sbl" items="${subLocalArr}">
			<div class="col-sm-2 my-1">
			<a href="?${sortBoard}&subLocal=${sbl.sort_no}${not empty bs.sortPlace ? '&sortPlace=all' : ''}${order}${searchQ}" 
			   class="${bs.subLocal == sbl.sort_no ? 'active' : ''}">${sbl.sort_name}</a>
			</div>
		</c:forEach>
	</div>
	<div class="d-flex mb-1">
		<c:if test="${not empty bs.sortPlace}">
			<div class="dropdown">
				<button type="button" class="btn-sm btn border-0 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				   <c:set var="flag" value="false" />
				   <c:forEach var="sp" items="${sortPlaceArr}">
			   			<c:if test="${bs.sortPlace == sp.sort_no}">
							${sp.sort_name}
			   			</c:if>
			   			<c:if test="${not flag}">
				   			<c:if test="${bs.sortPlace == 'all'}">
				   				<c:set var="flag" value="true" />
				   				말머리
			   				</c:if>
			   			</c:if>
					</c:forEach>
				</button>
				<div class="dropdown-menu" style="min-width:4rem;">
					<a class="dropdown-item" href="?${sortBoard}${subLocal}&sortPlace=all">
						전체</a>
					<c:forEach var="sp" items="${sortPlaceArr}">
						<a class="dropdown-item" href="?${sortBoard}${subLocal}&sortPlace=${sp.sort_no}">
							${sp.sort_name}</a>
					</c:forEach>
				</div>
			</div>
		</c:if>
		<div class="dropdown ml-auto">
			<button type="button" class="btn-sm btn border-0 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  ${bs.perPage}개씩
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
					<a class="dropdown-item" href="?${sortQ}&page=1&perPage=${step}${order}${searchQ}">
						${step}개씩</a>
				</c:forEach>
			</div>
		</div>
		<div class="dropdown">
			<c:set var="orderTxt" value="정렬"/>
			<c:choose>
				<c:when test="${bs.order == 'like'}">
					<c:set var="orderTxt" value="좋아요순"/>
				</c:when>
				<c:when test="${bs.order == 'date'}">
					<c:set var="orderTxt" value="최신순"/>
				</c:when>
				<c:when test="${bs.order == 'cmt'}">
					<c:set var="orderTxt" value="댓글순"/>
				</c:when>
				<c:when test="${bs.order == 'view'}">
					<c:set var="orderTxt" value="조회수순"/>
				</c:when>
			</c:choose>
			<button type="button" class="btn-sm btn border-0 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  ${orderTxt}
			</button>
			<div class="dropdown-menu" style="min-width:4rem;">
				<a class="dropdown-item" href="?${sortQ}${pageQ}&order=date${searchQ}">최신순</a>
				<a class="dropdown-item" href="?${sortQ}${pageQ}&order=cmt${searchQ}">댓글순</a>
				<a class="dropdown-item" href="?${sortQ}${pageQ}&order=like${searchQ}">좋아요순</a>
				<a class="dropdown-item" href="?${sortQ}${pageQ}&order=view${searchQ}">조회수순</a>
			</div>
		</div>
	</div>
	<!-- 글목록 -->
	<div class="table_wrap">
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>지역</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>좋아요</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
				<!-- 공지목록 -->
				<c:if test="${not empty noticeList}">
					<c:forEach var="n" items="${noticeList}">
						<tr class="tr_notice" ${board.board_no == n.board_no ? 'style="background:#f3a6c630;"' : ''}>
							<!-- 번호 -->
							<td class="td_no td_notice">
								<div class='badge badge-pink p-1'>
								공지
								</div>
							</td>
							<!-- 지역 -->
							<td class="td_subLocal">
								<a href="?sortBoard=${n.sort_board}&subLocal=${n.sub_local}${not empty n.sort_place ? '&sortPlace=all' : ''}" class="">	
								${n.subLocalName}
								</a>
							</td>
							<!-- 제목 -->
							<td class="td_title d-flex">
								<c:if test="${not empty n.sort_place}">
									<span class="place_sort mr-2 text-muted font-weight-400">
										${n.sortPlaceName}</span>
								</c:if>
								<a href="${localPath}/content/${n.board_no}?${allQ}" class="short_title">
									${n.board_title}
								</a>
								<span class="text-pink mx-2 font-weight-400">[${n.cmt_cnt}]</span>
								<c:if test="${n.has_img == 'Y'}">
									<svg xmlns="http://www.w3.org/2000/svg" width="0.95rem" height="0.95rem" fill="var(--pink50)" class="bi bi-image mr-2" viewBox="0 0 16 16" style="margin-top:2px;">
									  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
									  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
									</svg>
								</c:if>
							</td>
							<!-- 글쓴이 -->
							<td class="td_writer">
								<a href="${profilePath}/${n.user_id}" class="">
									${n.userNick}
								</a>
							</td>
							<!-- 작성일 -->
							<td class="td_date ">
							<!-- now랑 글작성일이랑 같으면 HH:mm형식으로 보여주고 같지않으면 yy.MM.dd 형식으로 보여주기 -->
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yy.MM.dd" var="today" />
							<fmt:formatDate value="${n.reg_date}" pattern="yy.MM.dd" var="regDate"/>
							<c:choose>
								<c:when test="${regDate != today}">
									${regDate}
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${n.reg_date}" pattern="HH:mm"/>
								</c:otherwise>
							</c:choose>
							</td>
							<!-- 좋아요 -->
							<td class="td_like ">${n.like_cnt}</td>
							<!-- 조회 -->
							<td  class="td_view ">${n.view_cnt}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:forEach var="b" items="${boardList}">
					<tr ${board.board_no == b.board_no ? 'style="background:#f3a6c630;"' : ''}>
						<!-- 번호 -->
						<td  class="td_no">
							${b.board_no}
						</td>
						<!-- 지역 -->
						<td class="td_subLocal">
							<a href="?sortBoard=${b.sort_board}&subLocal=${b.sub_local}${not empty b.sort_place ? '&sortPlace=all' : ''}" class="">	
							${b.subLocalName}
							</a>
						</td>
						<!-- 제목 -->
						<td class="td_title d-flex">
							<c:if test="${not empty b.sort_place}">
								<span class="place_sort mr-2 text-muted font-weight-400">
									${b.sortPlaceName}</span>
							</c:if>
							<a href="${localPath}/content/${b.board_no}?${allQ}" class="short_title">
								${b.board_title}
							</a>
							<span class="text-pink mx-2 font-weight-400">[${b.cmt_cnt}]</span>
							<c:if test="${b.has_img == 'Y'}">
								<svg xmlns="http://www.w3.org/2000/svg" width="0.95rem" height="0.95rem" fill="var(--pink50)" class="bi bi-image mr-2" viewBox="0 0 16 16" style="margin-top:2px;">
								  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
								  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
								</svg>
							</c:if>
<!-- 							지도유무 -->
<!-- 							<svg width="0.95rem" height="0.95rem" viewBox="0 0 16 16" class="bi bi-geo-alt-fill" fill="var(--pink50)" xmlns="http://www.w3.org/2000/svg" style="margin-top:2px;">  -->
<!-- 							  <path fill-rule="evenodd" d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/> -->
<!-- 							</svg> -->
						</td>
						<!-- 글쓴이 -->
						<td class="td_writer">
							<a href="${profilePath}/${b.user_id}" class="">
								${b.userNick}
							</a>
						</td>
						<!-- 작성일 -->
						<td class="td_date ">
						<!-- now랑 글작성일이랑 같으면 HH:mm형식으로 보여주고 같지않으면 yy.MM.dd 형식으로 보여주기 -->
<%-- 						<jsp:useBean id="now" class="java.util.Date" /> --%>
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
						<!-- 좋아요 -->
						<td class="td_like ">${b.like_cnt}</td>
						<!-- 조회 -->
						<td  class="td_view ">${b.view_cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<c:if test="${fn:length(boardList) == 0}">
		<div class="text-center py-5 font-size-085 text-muted">
				작성된 게시물이 없습니다.
		</div>
	</c:if>
	
	<div class="d-flex mb-1">
		<a type="button" href="${localPath}/insert?${allQ}"
			class="loginNeed btn-sm btn ml-auto mr-2 btn-plain">
			    글쓰기
		</a>
	</div>
</div>	