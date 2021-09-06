<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<nav class="sidebar">
		<div class="title_wrap">
			<a href="#" class="sideMenuTitle">타이틀</a>
		</div>
		<div class="menu_wrap">
			<ul class="list-unstyled components">
				<li class="sideMenu" >
					<div data-toggle="collapse" aria-expanded="false">
						<a href="${contextPath }/list">1차카테고리</a>
					</div>
					<ul class="collapse list-unstyled" id="">
						<li class="sideSubMenu">
							<div data-toggle="collapse" aria-expanded="false">
								<a href="${contextPath }/list">2차</a>
							</div>
							<ul class="collapse list-unstyled" id="">
								<li><a href="#">3차</a></li>
								<li><a href="#">3차</a></li>
								<li><a href="#">3차</a></li>
							</ul>
						</li>
						<li class="sideSubMenu"><a href="#">2차</a></li>
						<li class="sideSubMenu"><a href="#">2차</a></li>
					</ul>
				</li>
				<li class="sideMenu" >
					<div data-toggle="collapse" aria-expanded="false">
						<a href="${contextPath }/list">1차카테고리</a>
					</div>
					<ul class="collapse list-unstyled" id="">
						<li class="sideSubMenu">
							<div data-toggle="collapse" aria-expanded="false">
								<a href="#">2차</a>
							</div>
							<ul class="collapse list-unstyled" id="">
								<li><a href="#">3차</a></li>
								<li><a href="#">3차</a></li>
								<li><a href="#">3차</a></li>
							</ul>
						</li>
						<li class="sideSubMenu"><a href="#">2차</a></li>
						<li class="sideSubMenu"><a href="#">2차</a></li>
					</ul>
				</li>
				<li class="sideMenu" >
					<div data-toggle="collapse" aria-expanded="false">
						<a href="${contextPath }/list">1차카테고리</a>
					</div>
					<ul class="collapse list-unstyled" id="">
						<li class="sideSubMenu">
							<div data-toggle="collapse" aria-expanded="false">
								<a href="#">2차</a>
							</div>
							<ul class="collapse list-unstyled" id="">
								<li><a href="#">3차</a></li>
								<li><a href="#">3차</a></li>
								<li><a href="#">3차</a></li>
							</ul>
						</li>
						<li class="sideSubMenu"><a href="#">2차</a></li>
						<li class="sideSubMenu"><a href="#">2차</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
