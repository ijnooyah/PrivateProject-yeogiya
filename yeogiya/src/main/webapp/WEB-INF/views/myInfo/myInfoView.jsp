<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../cdn/css.jsp" %>
<title>myInfoView</title>
	<style>
	@media (min-width: 1200px) {
		.myInfo-container.container {
	    max-width: 900px !important;
		}
	}
/* 	테이블 */
	.myInfo-container .table-divider tr {
    	border: 1px solid var(--grayE1);
	}
	.myInfo-container .table-divider tr > th {
    	background-color: var(--whiteGray);
    	width: 150px;
	}
	.myInfo-container .table tr th, .myInfo-container .table tr th *, .myInfo-container .table tr td, .myInfo-container .table tr td * {
   		font-size: .85rem;
	}
	.myInfo-container .table tr th, .myInfo-container .table tr td {
	    color: var(--black);
	    font-weight: 400;
	    text-align: left;
	    padding: 15px;
	}
	
/* 	사이드바 */
	.myInfo-container .list-menu {
	    padding: 0;
	    margin: 0 0 40px 0;
	}
	.myInfo-container .list-menu li {
    	list-style-type: none;
	}
	.myInfo-container h3 {
	    font-size: 24px;
	    font-weight: normal;
	    line-height: 1.4;
	    color:var(--black);
	}
	.myInfo-container .list-menu li a {
	    display: inline-block;
	    padding: 6px 10px;
	    margin-bottom: 5px;
	    border-left-width: 1px;
	    border-left-style: solid;
	    border-left-color: transparent;
	    color: var(--gray9);
	    font-size: 0.875rem;
	    -webkit-transition: all 0.2s;
	    -moz-transition: all 0.2s;
	    -o-transition: all 0.2s;
	    transition: all 0.2s;
	}
	.myInfo-container .list-menu li a:hover {
	    border-left-color: var(--pink);
	    color: var(--pink);
	    text-decoration:none;
	}
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
	<div class="container myInfo-container my-4">
		<div class="row">
		    <div class="col-sm-9">
		      <table class="table table-divider">
					<tbody>
						<!-- 아이디 -->
						<tr>
							<th>아이디</th>
							<td class="td_body">${loginMember.user_id}</td>
						</tr>
						<!-- 이름 -->
						<tr>
							<th>이름</th>
							<td class="td_body">${loginMember.user_name}</td>
						</tr>
						<!-- 지역 -->
						<tr>
							<th>지역</th>
							<td class="td_body">${not empty loginMember.sortLocalName ? loginMember.sortLocalName : 'x'}</td>
						</tr>
						<!-- 휴대전화 -->
						<tr>
							<th>휴대전화</th>
							<td class="td_body">${loginMember.user_phone}</td>
						</tr>
						<!-- 이메일 -->
						<tr>
							<th>이메일</th>
							<td class="td_body">${loginMember.user_email}</td>
						</tr>
						<!-- 성별 -->
						<tr>
							<th>성별</th>
							<td class="td_body">
							<c:choose>
								<c:when test="${loginMember.user_gender == 'F'}">
									여
								</c:when>
								<c:when test="${loginMember.user_gender == 'M'}">
									남
								</c:when>
								<c:when test="${empty loginMember.user_gender}">
									x
								</c:when>
							</c:choose>
							</td>
						</tr>
						<!-- 가입일 -->
						<tr>
							<th>가입일</th>
							<td class="td_body">
							<fmt:formatDate value="${loginMember.sign_date}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</tbody>
				</table>
		    </div>
		    <div class="col-sm-3">
		      <h3>회원 정보</h3>
		      <hr class="hr">
		      <ul class="list-menu">
		        <li><a href="${mePath}/update?act=info">회원정보 변경</a></li>
		        <li><a href="${mePath}/update?act=email">이메일 주소 변경</a></li>
		        <li><a href="${mePath}/update?act=pw">비밀번호 변경</a></li>
		        <li><a href="${mePath}/delete">탈퇴</a></li>
		      </ul>
		    </div>  
   		</div>
	</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
<%@ include file="../cdn/js.jsp" %>
	<script>
	</script>
</body>
</html>