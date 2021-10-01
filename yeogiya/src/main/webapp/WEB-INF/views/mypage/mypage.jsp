<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../cdn/css.jsp" %>
<title>mypage</title>
	<style>
	@media (min-width: 1200px) {
	.mypage-container.container {
	    max-width: 900px !important;
		}
	}
	
	
	/* 	체크박스 사이즈 */
	.mypage-container .custom-checkbox .custom-control-label::before {
		width:.8rem;
		height:.8rem;
	}
	.mypage-container .custom-checkbox .custom-control-label::after {
		width:.8rem;
		height:.8rem;
	}
	
	.mypage-container .custom-control {
		min-height:unset;
		padding-left: 0;
	}
	
	.mypage-container .custom-control label {
   		margin-bottom: 0;
	}
	
	.mypage-container .dropdown-toggle {
		border-radius: 0;
		font-size: .75rem;
	}
	.mypage-container .dropdown-menu {
		min-width: 4.2rem;
		margin-top: -1px;
	}
	
	.mypage-container .dropdown-item {
		padding: .25rem 0;
    	text-align: center;
	}
	</style>
</head>
<body>
<c:if test="${not empty bs.tab}">
	<c:set var="tab" value="tab=${bs.tab}" scope="request"/>
</c:if>
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container mypage-container my-4">
		<div class="mypage_top row mb-5 mx-4">
				<div class="mypage_top_left">
					<div class="d-table-cell mr-2 set-bg rounded-circle border" 
						 data-setbg="${empty member.user_img ? noProfile : member.user_img}"
						 style="width:80px; height:80px;"></div>
				</div>
				<div class="mypage_top_right ml-4">
					<div class="font-size-105 mb-1">
						<span class="font-weight-500">${member.user_nick}</span>
						<span class="text-muted">|</span>
						<span class="text-muted font-size-100 mr-1">${member.is_quit == 'Y' ? '탈퇴 회원' : member.userGradeName }</span>
						<a href="" class="fa fa-cog text-muted" style="text-decoration:none;"></a>						
					</div>
					<div class="font-size-090 mb-1">
						<span class="text-muted">지역 </span><span class="text-pink mr-3">${member.sortLocalName}</span>
						<span class="mr-3 text-muted">총 게시물 <span class="text-pink">${member.post_cnt}</span>개</span>
						<span class="text-muted">총 댓글 <span class="text-pink">${member.cmt_cnt}</span>개</span>
					</div>
					<div class="font-size-090">
						<span class="mr-2 text-muted">자기소개</span>
						<div>
						${empty member.user_intro ? '자기소개 없음' : member.user_intro}
						</div>
					</div>
				</div>
		</div>
		<div class="mypage_middle">
			<!-- Nav tabs -->
				<ul class="nav nav-tabs mt-3 mx-4">
				  <li class="nav-item">
				    <a class="nav-link ${bs.tab == 'board' ? 'active' : '' }" href="?tab=board">작성한 글</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link ${bs.tab == 'comment' ? 'active' : '' }" href="?tab=comment">작성한 댓글</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link ${bs.tab == 'bookmark' ? 'active' : '' }" href="?tab=bookmark">북마크한 게시글</a>
				  </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content px-4">
					<div class="px-3">
						<br>
						<c:choose>
							<c:when test="${bs.tab == 'board'}">
								<jsp:include page="./boardTable.jsp" flush="false"/>
							</c:when>
							<c:when test="${bs.tab == 'comment'}">
								<jsp:include page="./commentTable.jsp" flush="false"/>
							</c:when>
							<c:when test="${bs.tab == 'bookmark'}">
								<jsp:include page="./boardTable.jsp" flush="false"/>
							</c:when>
						</c:choose>
						<jsp:include page="./search.jsp" flush="false"/>
					</div>
				</div>
		</div>
	</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
<%@ include file="../cdn/js.jsp" %>
	<!-- 글목록 -->
	<script>
	$("#allCheck").click(function() {
		console.log($(this).is(":checked"));
		$('.rowCheck').prop("checked", $(this).is(":checked"));
	});
	
	 $(".trash").click(function(){
		 Swal.fire({
				title: '삭제하시겠습니까?', 
				allowOutsideClick: false,
				padding: '2em',
//		 		iconColor: "#1f5e43",
//		 		icon: 'question', 
				confirmButtonText: "확인",
//		 		confirmButtonColor: "#1f5e43",
				cancelButtonText: "취소",
				showCancelButton: true,
			}).then(function(result) {
				if(result.isConfirmed) {
					var checkArr = new Array();
					 
					$("input[name=rowCheck]:checked").each(function() {
						checkArr.push($(this).attr("id"));
					});
					 
					$.ajax({
						url : "${profilePath}/delete",
						type : "post",
						data : {chbox : checkArr, tab : "${bs.tab}"},
						success : function() {
							location.href="?${tab}${pageQ}${searchQ}";
						}
					});
				} 
			});
	});
	</script>
</body>
</html>