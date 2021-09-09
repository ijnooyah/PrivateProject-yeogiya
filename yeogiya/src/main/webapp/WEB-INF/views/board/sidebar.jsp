<%@page import="com.yj.yeogiya.model.vo.Sort"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
li.sideMenu > div.active > a {
	color:var(--pink) !important;
}

li.sideSubMenu > div.active > a, li.sideSubMenu li.active {
	text-decoration:underline;
}
</style>
	<nav class="sidebar">
		<div class="title_wrap">
			<a href="${listPath}?subLocal=all" class="sideMenuTitle">${sortLocalP.sort_name}</a>
		</div>
		<div class="menu_wrap">
			<ul class="list-unstyled components">
			  <c:forEach var="slc" items="${subLocalArr}">
			  	  <!-- url설정 -->
				  <c:if test="${not empty slc.sort_no}">
					<c:set var="subLocal" value="subLocal=${slc.sort_no}" />
				  </c:if>
					<li class="sideMenu" >
						<div data-toggle="collapse" ${slc.sort_no == bs.subLocal ? 'aria-expanded="true"' : 'aria-expanded="false"'}
							  class="${slc.sort_no == bs.subLocal ? 'active' : ''}">
							<a href="${listPath}?${subLocal}&sortBoard=all">
								${slc.sort_name}
							</a>
						</div>
						<ul class="collapse list-unstyled ${slc.sort_no == bs.subLocal ? 'show' : ''}" id="">
							<c:forEach var="sb" items="${sortBoardArr}">
							<!-- url설정 -->
							  <c:if test="${not empty sb.sort_no}">
								<c:set var="sortBoard" value="&sortBoard=${sb.sort_no}" />
							  </c:if>
								<li class="sideSubMenu">
									<div ${sb.sort_no == bs.sortBoard && slc.sort_no == bs.subLocal ? 'class="active"' : ''}
										<c:if test="${sb.has_sort_place == 'Y'}">
											data-toggle="collapse"
											<c:choose>
												<c:when test="${sb.sort_no == bs.sortBoard && slc.sort_no == bs.subLocal}">
												aria-expanded="true"
												</c:when>
												<c:otherwise>
												aria-expanded="false"
												</c:otherwise>
											</c:choose>
										</c:if>
									>
										<a href="${listPath}?${subLocal}${sortBoard}${sb.has_sort_place == 'Y' ? '&sortPlace=all' : ''}">
											${sb.sort_name}
										</a>
									</div>
									<c:if test="${sb.has_sort_place == 'Y'}">
										<ul class="collapse ${sb.sort_no == bs.sortBoard && slc.sort_no == bs.subLocal ? 'show' : ''} list-unstyled" id="">
											<c:forEach var="sp" items="${sortPlaceArr}">
											<!-- url설정 -->
											  <c:if test="${not empty sp.sort_no}">
												<c:set var="sortPlace" value="&sortPlace=${sp.sort_no}" />
											  </c:if>
												<li ${sb.sort_no == bs.sortBoard && slc.sort_no == bs.subLocal && sp.sort_no == bs.sortPlace ? 'class="active"' : ''}>
													<a href="${listPath}?${subLocal}${sortBoard}${sortPlace}">${sp.sort_name}</a>
												</li>
											</c:forEach>
										</ul>
									</c:if>
								</li>
							</c:forEach>
						</ul>
					</li>
			  </c:forEach>
			</ul>
		</div>
	</nav>
