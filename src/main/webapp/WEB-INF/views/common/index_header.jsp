<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/header.css" />
<script src="${pageContext.request.contextPath}/assets/js/header.js"></script>

<!-- 로그인, 유효성 검사 -->
<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
<script src="${pageContext.request.contextPath}/assets/js/login.js"></script>


<div class="page_top_free clearfix"><a href="#" id="free_txt">전 제품 무료 표준 배송 혜택을 즐겨보세요.<img class="pull-right plus_img" src="${pageContext.request.contextPath}/assets/img/plus.png"></a></div>
<div id="header" class="show clearfix">
    <div class="hamburger_logo pull-left"><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/img/logo.png" class="menu_logo_img" /></a></div>
    <a href="${pageContext.request.contextPath}/cart" class="cart_button">카트 <span class="cart_num">2</span></a>
    <a href="#" class="hamburger-button pull-right">
        <span></span>
        <span></span>
    </a>
    <div class="overlay">
    	<div class="hamburger_logo pull-left"><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/img/logo.png" class="menu_logo_img" /></a></div>
	    <a href="${pageContext.request.contextPath}/cart" class="cart_button">카트 <span class="cart_num">2</span></a>
	    <a href="#" class="hamburger-button-exit pull-right">
	        <span></span>
	        <span></span>
	    </a>
        <nav class="menu">
            <ul>
                <li><a href="#">스킨</a></li>
                <li><a href="#">헤어</a></li>
                <li><a href="#">바디 & 핸드</a></li>
                <li><a href="${pageContext.request.contextPath}">향수</a></li>
                <li><a href="#">홈</a></li>
                <li><a href="#">읽기</a></li>
                <li><a href="${pageContext.request.contextPath}/search/store">스토어</a></li>
            </ul>
        </nav>
        <div class="log_sear">
            <c:choose>
				<c:when test="${user.username == null}">
					<a href="${pageContext.request.contextPath}/login" class="login pull-left" data-toggle="modal" data-target="#myModal">로그인</a>
				</c:when>
			
				<c:when test="${user.username != null}">
					<a href="${pageContext.request.contextPath}/mypage/main" class="pull-left">${user.username}</a>
				</c:when>
			</c:choose>
            <a href="#" class="search pull-right">검색</a>
        </div>
    </div>
    
    <div class="overlay1">
    	<div class="hamburger_logo pull-left"><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/img/logo.png" class="menu_logo_img2" /></a></div>
	    <a href="${pageContext.request.contextPath}/cart" class="cart_button">카트 <span class="cart_num">2</span></a>
	    <a href="#" class="hamburger-button-exit pull-right">
	        <span></span>
	        <span></span>
	    </a>
        <nav class="menu1">
            <ul>
                <li><a href="${pageContext.request.contextPath}/product/prod_skin.do">모두 보기</a></li>
                <li><a href="${pageContext.request.contextPath}">클렌저</a></li>
                <li><a href="${pageContext.request.contextPath}">각질 제거</a></li>
                <li><a href="${pageContext.request.contextPath}">트리트먼트 & 마스크</a></li>
                <li><a href="${pageContext.request.contextPath}">토너</a></li>
                <li><a href="${pageContext.request.contextPath}">립 & 아이</a></li>
                <li><a href="${pageContext.request.contextPath}">쉐이빙</a></li>
                <li><a href="${pageContext.request.contextPath}">선 케어 / SPF</a></li>
            </ul>
        </nav>
    </div>
    <div class="overlay2">
    	<div class="hamburger_logo pull-left"><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/img/logo.png" class="menu_logo_img2" /></a></div>
	    <a href="${pageContext.request.contextPath}/cart" class="cart_button">카트 <span class="cart_num">2</span></a>
	    <a href="#" class="hamburger-button-exit pull-right">
	        <span></span>
	        <span></span>
	    </a>
    	<nav class="menu2">
    		<ul>
    			<li><a href="${pageContext.request.contextPath}">모두 보기</a></li>
    			<li><a href="${pageContext.request.contextPath}">샴푸</a></li>
    			<li><a href="${pageContext.request.contextPath}">컨디셔너</a></li>
    			<li><a href="${pageContext.request.contextPath}">트리트먼트</a></li>
    			<li><a href="${pageContext.request.contextPath}">그루밍</a></li>
    		</ul>
    	</nav>
    </div>
    <div class="overlay3">
    	<div class="hamburger_logo pull-left"><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/img/logo.png" class="menu_logo_img2" /></a></div>
	    <a href="${pageContext.request.contextPath}/cart" class="cart_button">카트 <span class="cart_num">2</span></a>
	    <a href="#" class="hamburger-button-exit pull-right">
	        <span></span>
	        <span></span>
	    </a>
    	<nav class="menu3">
    		<ul>
    			<li><a href="${pageContext.request.contextPath}">모두 보기</a></li>
    			<li><a href="${pageContext.request.contextPath}">핸드</a></li>
    			<li><a href="${pageContext.request.contextPath}">바디</a></li>
    			<li><a href="${pageContext.request.contextPath}">퍼스널 케어</a></li>
    			<li><a href="${pageContext.request.contextPath}">번들</a></li>
    		</ul>
    	</nav>
    </div>
    <div class="overlay5">
    	<div class="hamburger_logo pull-left"><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/img/logo.png" class="menu_logo_img2" /></a></div>
	    <a href="${pageContext.request.contextPath}/cart" class="cart_button">카트 <span class="cart_num">2</span></a>
	    <a href="#" class="hamburger-button-exit pull-right">
	        <span></span>
	        <span></span>
	    </a>
    	<nav class="menu5">
    		<ul>
    			<li><a href="${pageContext.request.contextPath}">모두 보기</a></li>
    			<li><a href="${pageContext.request.contextPath}">홈</a></li>
    			<li><a href="${pageContext.request.contextPath}">문학</a></li>
    		</ul>
    	</nav>
    </div>
    <div class="overlay6">
    	<div class="hamburger_logo pull-left"><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/img/logo.png" class="menu_logo_img2" /></a></div>
	    <a href="${pageContext.request.contextPath}/cart" class="cart_button">카트 <span class="cart_num">2</span></a>
	    <a href="#" class="hamburger-button-exit pull-right">
	        <span></span>
	        <span></span>
	    </a>
   		<nav class="menu6">
   			<ul>
   				<li><a href="${pageContext.request.contextPath}/read/story">브랜드 스토리</a></li>
   				<li><a href="${pageContext.request.contextPath}/read/prod">제품 철학</a></li>
   				<li><a href="${pageContext.request.contextPath}/read/design">디자인 철학</a></li>
   			</ul>	
   		</nav>
    </div>
    <div class="overlay_delivery">
   		<nav class="menu_delivery clearfix">
   			<a href="#" class="exit-button">
		        <span></span>
		        <span></span>
		    </a>
		    <div class="delivery_box">
		    	<div class="delivery_box2">
			    	<span class="dv_title">전 구매 무료 배송</span>
			    	<div class="dv_border">
				    	<table class="dv_table">
				    		<tr>
				    			<td colspan="2" style="color:#333333;">우체국 택배</td>
				    		</tr>
				    		<tr>
				    			<td>전 제품</td>
				    			<td class="dv_txt_right">무료 배송</td>
				    		</tr>
				    		<tr>
				    			<td>전 지역</td>
				    			<td class="dv_txt_right">영업일 기준, 1-3일</td>
				    		</tr>
				    	</table>
				    </div>
			    </div>
		    </div>
   		</nav>
    </div>
    
    <!-- 로그인 모달 시작 -->
    <div class="modal fade" id="myModal">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <!-- 이 곳에 modal-login.html 파일 연결 됨 -->
	        </div>
	    </div>
	</div>
	<!-- 로그인 모달 끝 -->

	<!-- 검색 -->
	<div class="overlay_prod_search">
		<div class="hamburger_logo pull-left">
			<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/img/logo.png" class="menu_logo_img2" /></a>
		</div>
		<a href="${pageContext.request.contextPath}/cart" class="cart_button">카트 <span class="cart_num">2</span></a>
		<a href="#" class="hamburger-button-exit pull-right">
			<span></span>
			<span></span>
		</a>
		<nav class="menu_prod_search">
			<ul>
				<li>
					<div class="form-group">
						<input type="text" class="form-control" id="prod_search" name="prod_search">
						<div class="search_bt">
							<button type="submit"></button>
						</div>
					</div>
				</li>
				<li>인기 검색어</li>
				<li><a href="#">클렌저</a></li>
				<li><a href="#">페뷸러스</a></li>
				<li><a href="#">파슬리</a></li>
				<li><a href="#">향수</a></li>
			</ul>
		</nav>
	</div>
	<!-- 검색 끝 -->
</div>
