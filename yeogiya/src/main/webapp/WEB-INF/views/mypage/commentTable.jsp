<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 <!-- 목록 -->
	<div class="table_wrap">
		<table class="table">
			<thead>
				<tr>
					<th>
					<div class="custom-control custom-checkbox">
						<c:if test="${loginMember.user_id == member.user_id}">
						 <input class="custom-control-input" type="checkbox" id="allCheck">
						 <label class="custom-control-label" for="allCheck"></label>
						 </c:if>
					</div>
					</th>
					<th>작성일</th>
					<th>작성자</th>
					<th>댓글내용</th>
					<th>원문제목</th>
				</tr>
			</thead>
			<tbody>
				<!--조회된 게시글 목록 있을 때 -->
				<c:forEach var="c" items="${member.commentList}">
					<tr>
						<td>
							<!-- 자기 글일때만 체크 버튼 보이기 -->
							<div class="custom-control custom-checkbox">
								<c:if test="${loginMember.user_id == member.user_id}">
								 <input class="custom-control-input rowCheck" type="checkbox" name="rowCheck" id="${c.c_no}">
								 <label class="custom-control-label"></label>
								</c:if>
							</div>
						</td>
						<!-- 작성일 -->
						<td class="td_date ">
						<!-- now랑 글작성일이랑 같으면 HH:mm형식으로 보여주고 같지않으면 yy.MM.dd 형식으로 보여주기 -->
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yy.MM.dd" var="today" />
						<fmt:formatDate value="${c.reg_date}" pattern="yy.MM.dd" var="regDate"/>
						<c:choose>
							<c:when test="${regDate != today}">
								${regDate}
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${c.reg_date}" pattern="HH:mm"/>
							</c:otherwise>
						</c:choose>
						</td>
						<td class="td_writer">
							<a href="" class="">
								${member.user_nick}
							</a>
						</td>
						<td class="td_title short_title" style="width:305px;">
						 	<a href="${contextPath}/${c.sortLocalEngName}/content/${c.b_no}?${c.boardQuery}" class="short_title">
								${c.c_content}
							</a>
						</td>
						<td class="td_title" style="width:305px;">
						 	<a href="${contextPath}/${b.sortLocalEngName}/content/${c.b_no}?${c.boardQuery}" class="short_title">
								${c.boardTitle}
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
