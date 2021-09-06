<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
li.sideMenu {
	min-width:210px;
    font-size: 1rem;
    font-weight: 500;
    padding: 1rem 0 0 2rem;
    display: block;
    color: var(--black);
    position: static;
}
li.sideMenu > div {
	width: 150px;
    display: inline-block;
}
li.sideMenu > div > a {
    color: var(--black);
}
li.sideSubMenu > div {
	width: 100px;
    display: inline-block;
}
li.sideMenu > ul {
	position: relative;
	padding-top: .8rem;
	left:5%;
	font-size: 0.9rem;
}
li.sideMenu > ul > li:not(:first-child) {
	padding-top: .7rem;
}
li.sideMenu > ul > li > div > a {
	color: var(--gray) !important;
}
li.sideSubMenu > ul > li:not(:first-child) {
	padding-top: .5rem;
}
li.sideSubMenu > ul > li > div > a {
	color: var(--gray) !important;
}
li.sideSubMenu > ul {
	position: relative;
	padding-top: .8rem;
	left:15%;
}
li.sideMenu[aria-expanded=false] > div + span::after {
	display: inline-block;
    vertical-align: .255em;
    content: "";
    border-top: .3em solid;
    border-right: .3em solid transparent;
    border-bottom: 0;
    border-left: .3em solid transparent;
}
li.sideMenu[aria-expanded=true] > div + span::after {
	display: inline-block;
    vertical-align: .255em;
    content: "";
	border-top: 0;
	border-right: .3em solid transparent;
    border-bottom: .3em solid;
    border-left: .3em solid transparent;
}
li.sideSubMenu[aria-expanded=false] > div + span::after {
	display: inline-block;
    vertical-align: .255em;
    content: "";
    border-top: .3em solid;
    border-right: .3em solid transparent;
    border-bottom: 0;
    border-left: .3em solid transparent;
}
li.sideSubMenu[aria-expanded=true] > div + span::after {
	display: inline-block;
    vertical-align: .255em;
    content: "";
	border-top: 0;
	border-right: .3em solid transparent;
    border-bottom: .3em solid;
    border-left: .3em solid transparent;
}
</style>
	<nav class="sidebar">
		<div class="">
			<div class="title_wrap">
				<a href="#" class="sideMenuTitle">울산</a>
			</div>
			<ul class="list-unstyled components mb-5">
				<li data-toggle="collapse" aria-expanded="false" class="sideMenu" >
					<div><a href="${contextPath }/list" class="sideMenu">1차카테고리</a></div><span></span>
					<ul class="collapse list-unstyled" id="">
						<li data-toggle="collapse" id="" aria-expanded="false" class="sideSubMenu">
							<div><a href="#">2차</a></div><span></span>
							<ul class="collapse list-unstyled" id="">
								<li><a href="#">3차</a></li>
								<li><a href="#">3차</a></li>
								<li><a href="#">3차</a></li>
							</ul>
						</li>
						<li><a href="#">2차</a></li>
						<li><a href="#">2차</a></li>
					</ul>
				</li>
				<li data-toggle="collapse" aria-expanded="false" class="sideMenu" >
					<a href="#" >1차카테고리 </a><span></span>
					<ul class="collapse list-unstyled" id="">
						<li data-toggle="collapse" id="" aria-expanded="false" class="sideSubMenu">
							<a href="#">2차</a><span></span>
							<ul class="collapse list-unstyled" id="">
								<li><a href="#">3차</a></li>
								<li><a href="#">3차</a></li>
								<li><a href="#">3차</a></li>
							</ul>
						</li>
						<li><a href="#">2차</a></li>
						<li><a href="#">2차</a></li>
					</ul>
				</li>
				<li data-toggle="collapse" aria-expanded="false" class="sideMenu" >
					<a href="#" >1차카테고리 </a><span></span>
					<ul class="collapse list-unstyled" id="">
						<li data-toggle="collapse" id="" aria-expanded="false" class="sideSubMenu">
							<a href="#">2차</a><span></span>
							<ul class="collapse list-unstyled" id="">
								<li><a href="#">3차</a></li>
								<li><a href="#">3차</a></li>
								<li><a href="#">3차</a></li>
							</ul>
						</li>
						<li><a href="#">2차</a></li>
						<li><a href="#">2차</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
