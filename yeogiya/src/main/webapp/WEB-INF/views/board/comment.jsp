<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<c:if test="${param.type == 'A'}">A</c:if> --%>
<style>
.comment-row{
	 padding: 1rem 2rem;
	 border-top: 1px solid var(--lightGray);
}
.comment-row:first-child{
	border-top: none;
}

.comment-row.recomment-row{
	 padding-left: 4rem;;
	 padding-top: 10px;
	 border-top:none;
}

.comment_right_top {
	line-height: 1;
}
.comment_right_top .c_user_nick, .updateCommentDiv .c_user_nick {
	font-size: .85rem;
	font-weight: 500;
	color: var(--black);
	line-height: 1;
    vertical-align: top;
}

.comment_right_middle {
	font-size: .8rem;
	font-weight: 400;
}

.comment_right_bottom {
	font-size: .7rem;
	color: var(--gray);
}

#reply_div {
    width: 100%;
    margin-top: 10px;
}
</style>
<div class="bg-light w-100">
	<!-- 댓글목록 -->
	<div class="commentList-container" id="commentContainer">
		<div class="comment-row">
			<input type="hidden" class="c_no" value=""/>
			<input type="hidden" class="re_group" value=""/>
			<div class="updateCommentDiv d-none">
				<div class="d-flex">
					<div class="d-table-cell profile-img mr-2" 
					 	 style="background:url(${contextPath}/resources/image/profile.jpg);
					 		 width:34px; height:34px;"></div>
					<div class="d-table-cell">
						<a href="" class="align-middle c_user_nick">윤지</a>
					</div>
					<a class="cancel ml-auto text-muted font-size-080" href="javascript:cancelUpdate();">취소</a>
				</div>
				<div class="input-group px-5">
					<textarea name="c_content" spellcheck="false" autocomplete="off"
						class="form-control rounded-0"
						 style="height:100px; resize:none;"></textarea>
					<div class="input-group-append">
						<button class="loginNeed btn btn-pink rounded-0 updateBtn" type="button" style="width:100px;" 
							onclick="updateComment()">등록</button>
					</div>
				</div>
			</div>
			<div class="view_comment d-flex">
					<div class="comment_left">
						<div class="profile-img" 
						 	 style="background:url(${contextPath}/resources/image/profile.jpg);
						 		 width:34px; height:34px;"></div>
					</div>
					<div class="comment_right w-100 pl-2">
						<div class="comment_right_top d-flex">
							<div class="d-table-cell mr-1">
								<a href="" class="c_user_nick">윤지</a>
							</div>
							<div class="d-table-cell">
								<span class="is_hobby_writer badge badge-pill badge-pink font-size-060 align-top">글주인</span>
							</div>
							<!-- 댓글, 수정 삭제 -->
							<svg id="dropdownMenuButton" class="bi bi-three-dots-vertical cursor-pointer ml-auto" data-toggle="dropdown" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
								<path d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
							</svg>
								<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton"
									style="min-width: 4rem;font-size: 13px;">
									 <a class="dropdown-item doUpdateComment" 
									 	href="javascript:void(0);" >수정</a> 
									 <a class="dropdown-item deleteComment" 
									 	href="javascript:void(0);">삭제</a>
								</div>
							<!-- //댓글, 수정 삭제 -->
						</div>
						<div class="comment_right_middle py-1">
							<span class="c_parent_user_nick font-weight-500">@하윤지 </span> 
							<span class="c_content">댓글내용 댓글댓글내용 댓글댓글내용 11</span>
						</div>
						<div class="comment_right_bottom">
							<span class="c_reg_date">21.09.02 20:05</span>
							<span>|</span>
							<span class="loginNeed doRecomment cursor-pointer" onclick="doRecomment()">답글</span>
							<span>|</span>
							<span class="cursor-pointer" onclick="신고()">신고</span>
						</div>
					</div>
			</div>
			<div class="row replyCommentDiv"></div>
		</div>
	</div>
	<!-- 댓글 더보기 버튼-->
	<div class="text-center mt-3">
		<button type="button" id="btnMoreComments"
			onclick="moreViewToggle(this);" style="color:white;"
			class="btn btn-sm btn-pink">댓글 더보기</button>
	</div>
	<!--댓글 작성 -->
	<div class="commentWrite-container my-4">
		<div class="input-group px-5">
			<textarea id="c_content" name="c_content" spellcheck="false" autocomplete="off"
				class="form-control rounded-0" placeholder="댓글을 남겨주세요."
				 style="height:100px; resize:none;"></textarea>
			<div class="input-group-append">
				<button class="loginNeed btn btn-pink rounded-0" type="button" style="width:100px;" 
					onclick="insertComment(this)">등록</button>
			</div>
		</div>
	</div>
	<!-- d-none -->
		<!--답댓글 작성 -->
		<div id="reply_div" class="d-none">
			<div class="input-group px-5">
				<input type="hidden" id="parent_c_no" value=""/>
				<textarea id="re_c_content" class="form-control rounded-0" spellcheck="false" autocomplete="off"
					 style="height:100px; resize:none;" placeholder="답댓글을 남겨보세요."></textarea>
				<div class="input-group-append">
					<button class="loginNeed btn btn-pink rounded-0 insertRecomment" type="button" style="width:100px;" 
						onclick="insertRecomment(this)">등록</button>
				</div>
			</div>
		</div>
		<!-- moreviewdiv -->
		<div id="moreViewDiv d-none"></div>
		<!-- //moreviewdiv -->
</div>