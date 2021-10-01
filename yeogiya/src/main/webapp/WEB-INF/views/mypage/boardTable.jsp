<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="pl-4">
	<!-- 상단 -->
	<div class="d-flex mb-1 dropdown">
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
				<a class="dropdown-item" href="?${tab}${page}&perPage=${step}${searchQ}">
					${step}개씩</a>
			</c:forEach>
		</div>
		<svg xmlns="http://www.w3.org/2000/svg" width="1.15rem" height="1.15rem" fill="currentColor" class="bi bi-trash-fill trash text-muted cursor-pointer mt-2 ml-auto mr-2" viewBox="0 0 16 16" style="opacity:.6;">
		  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
		</svg>
	</div>
	 <!-- 목록 -->
	<div class="table_wrap">
		<table class="table">
			<thead>
				<tr>
					<th>
					<div class="custom-control custom-checkbox">
						 <input class="custom-control-input" type="checkbox" id="allCheck">
						 <label class="custom-control-label" for="allCheck"></label>
					</div>
					</th>
					<th>번호</th>
					<th>지역</th>
					<th>게시판</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>좋아요</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
				<!--조회된 게시글 목록 있을 때 -->
				<c:forEach var="b" items="${member.boardList}">
					<tr>
						<td>
							<!-- 자기 글일때만 체크 버튼 보이기 -->
							<div class="custom-control custom-checkbox">
								 <input class="custom-control-input rowCheck ${v>0 ?  'custom-control-input' : 'd-none'}" type="checkbox" name="rowCheck" id="${b.board_no}">
								 <label class="custom-control-label ${v>0 ?  'custom-control-label' : ''}" for="${b.board_no}"></label>
							</div>
						</td>
						<!-- 번호 -->
						<td  class="td_no">
						 	${b.board_no}
						</td>
						<!-- 지역 -->
						<td class="td_sortLocal">
							<a href="" class=" ">
								${b.sortLocalName}
							</a>
						</td>
						<!-- 게시판 -->
						<td class="td_sortBoard">
							<a href="" class="">	
								${b.sortBoardName}
							</a>
						</td>
						<!-- 제목 -->
						<td class="td_title d-flex" style="min-width:340px;">
							<a href="${contextPath}/${sortLocalEngName}/content/${b.board_no}?sortBoard=${b.sort_board}&subLocal=${b.sub_local}${not empty b.sort_place ? ('&sortPlace=' += b.sort_place) : ''}" class="short_title">
								${b.board_title}
							</a>
							<span class="text-pink mx-2 font-weight-400">[${b.cmt_cnt}]</span>
							<c:if test="${b.has_img == 'Y'}">
								<svg xmlns="http://www.w3.org/2000/svg" width="0.95rem" height="0.95rem" fill="var(--pink50)" class="bi bi-image mr-2" viewBox="0 0 16 16" style="margin-top:2px;">
								  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
								  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
								</svg>
							</c:if>
						</td>
						<!-- 글쓴이 -->
						<td class="td_writer">
							<a href="" class="">
								${member.user_nick}
							</a>
						</td>
						<!-- 작성일 -->
						<td class="td_date ">
						<!-- now랑 글작성일이랑 같으면 HH:mm형식으로 보여주고 같지않으면 yy.MM.dd 형식으로 보여주기 -->
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
						<!-- 좋아요 -->
						<td class="td_like ">${b.like_cnt}</td>
						<!-- 조회 -->
						<td  class="td_view ">${b.view_cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>	