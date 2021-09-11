<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
/* 	카카오 */
.board-container .customoverlay {position:relative;bottom:55px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.board-container .customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.board-container .customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;overflow:hidden;background: var(--pink);background: var(--pink) url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.board-container .customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:500;}
.board-container .customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
<div id="map" class="rounded-sm border" style="width:100%;height:350px;">
</div>