<%@page import="com.yj.yeogiya.model.vo.Sort"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/* li.sideMenu > div.active > a { */
/* 	color:var(--pink) !important; */
/* } */

.underline {
	text-decoration:underline;
}
</style>
	<nav class="sidebar">
		<div class="title_wrap">
			<a href="${listPath}?sortBoard=all" class="sideMenuTitle">${sortLocalP.sort_name}</a>
		</div>
		<div class="menu_wrap">
			<ul class="list-unstyled components">
			  <c:forEach var="sb" items="${sortBoardArr}">
			  	  <%-- url설정--%> 
				  <c:if test="${not empty sb.sort_no}">
					<c:set var="sbQuery" value="sortBoard=${sb.sort_no}" />
				  </c:if>
					<li class="sideMenu">
						<div data-toggle="collapse" ${sb.sort_no == bs.sortBoard ? 'aria-expanded="true"' : 'aria-expanded="false"'}>
							<a href="${listPath}?${sbQuery}&subLocal=all${sb.has_sort_place == 'Y' ? '&sortPlace=all' : ''}"
							   class="${sb.sort_no == bs.sortBoard ? 'text-pink' : ''} ${sb.sort_no == bs.sortBoard && bs.subLocal == 'all' ? 'underline' : ''}">
								${sb.sort_name}
							</a>
						</div>
						<ul class="collapse list-unstyled ${sb.sort_no == bs.sortBoard ? 'show' : ''}" id="">
							<c:forEach var="sbl" items="${subLocalArr}">
							<%-- url설정--%> 
							  <c:if test="${not empty sbl.sort_no}">
								<c:set var="sblQuery" value="&subLocal=${sbl.sort_no}" />
							  </c:if>
							  <c:if test="${sbl.sort_no != 'all'}">
								<li class="sideSubMenu">
									<div <c:if test="${sb.has_sort_place == 'Y'}">
											data-toggle="collapse"
											<c:choose>
												<c:when test="${sb.sort_no == bs.sortBoard && sbl.sort_no == bs.subLocal && bs.sortPlace != 'all'}">
												aria-expanded="true"
												</c:when>
												<c:otherwise>
												aria-expanded="false"
												</c:otherwise>
											</c:choose>
										</c:if>
									>
										<a href="${listPath}?${sbQuery}${sblQuery}${sb.has_sort_place == 'Y' ? '&sortPlace=all' : ''}"
											<c:if test="${sb.sort_no == bs.sortBoard && sbl.sort_no == bs.subLocal}">
												<c:choose>
													<c:when test="${empty bs.sortPlace}">
													 class="underline"
													</c:when>
													<c:when test="${bs.sortPlace == 'all'}">
													 class="underline"
													</c:when>
												</c:choose>
											</c:if>
										   >
											${sbl.sort_name}
										</a>
									</div>
									<c:if test="${sb.has_sort_place == 'Y'}">
										<ul class="collapse ${sb.sort_no == bs.sortBoard && sbl.sort_no == bs.subLocal && bs.sortPlace != 'all' ? 'show' : ''} list-unstyled" id="">
											<c:forEach var="sp" items="${sortPlaceArr}">
											<%-- url설정--%> 
											  <c:if test="${not empty sp.sort_no}">
												<c:set var="spQuery" value="&sortPlace=${sp.sort_no}" />
											  </c:if>
												<li ${sb.sort_no == bs.sortBoard && sbl.sort_no == bs.subLocal && sp.sort_no == bs.sortPlace ? 'class="underline"' : ''}>
													<a href="${listPath}?${sbQuery}${sblQuery}${spQuery}">${sp.sort_name}</a>
												</li>
											</c:forEach>
										</ul>
									</c:if>
								</li>
								</c:if>
							</c:forEach>
						</ul>
					</li>
			  </c:forEach>
			</ul>
		</div>
	</nav>
