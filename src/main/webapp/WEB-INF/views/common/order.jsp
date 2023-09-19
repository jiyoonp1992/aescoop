<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>4조 이숲</title>
	
	<!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />
    
    
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    

    <!-- 공통 style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />


    <!-- style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/order.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />


    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
    <!-- 자바스크립트 -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/assets/js/bootstrap.min.js"></script>
    
    <!-- 다음 주소 API -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/address.js"></script>
</head>
<body>
	<div class="page_top_cart clearfix" onclick=" location='${pageContext.request.contextPath}/cart'">
		<div class="pull-left">카트&nbsp;&nbsp;<span class="badge"></span></div>
		<div class="pull-right">₩ <fmt:formatNumber value="${tprice}" pattern="#,###" /></div>
	</div>
    
    <div class="content">
	    <!-- 로고 -->
	    <div class="order_logo">
	        <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/img/logo.png" /></a>
	    </div>
	    
	    <div class="orderer">주문을 어디로 보내시겠습니까?</div>
	    
	    <form method="post" name="order_form" id="order_form" action="${pageContext.request.contextPath}/order_add">
	    <input type="hidden" name="tprice" value="${tprice}">
			<div class="form-group">
				<div class="cart_form_title">이름 <span class='identify'>*</span></div>
				<input type="text" class="form-control" id="user_name" name="user_name" value="${user.username}">
			</div>
			<div class="form-group">
				<div class="cart_form_title">연락처 <span class='identify'>*</span> (숫자만 입력하세요.)</div>
				<input type="tel" class="form-control" name="tel" id="tel" value="${user.usertel}" />
			</div>
			<div class="form-group">
				<div class="cart_form_title">주소 <span class='identify'>*</span></div>
				<input type="text" id="postno" name="postno" class="form-control-add1" placeholder="우편번호" value="${user.postno}">
				<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-success" value="우편번호 찾기"><br>
				<input type="text" id="address1" name="address1" class="form-control-add3" placeholder="주소" value="${user.address1}"><br>
				<input type="text" id="address2" name="address2" class="form-control-add4" placeholder="상세주소" value="${user.address2}">
				<br	class="visible-xs">
				<br class="visible-sm">
				<input type="text" id="address3" name="address3" class="form-control-add5" placeholder="지번" value="${user.address3}">
			</div>


			<div class="form-group">
				<div class="cart_form_title2">원하는 배송 방법을 선택하십시오</div>
				<div class="box_free">
					<input type="radio" id="free" name="free" value="free" checked>
					<label for="free">무료 배송 - ₩ 0</label>
					<div class="free_txt">
						배송 예정일<br>영업일 기준 1~3일 소요
					</div>
				</div>
			</div>


			<div class="form-group">
				<div class="cart_form_title2">배송 시 요청 사항</div>
				<textarea name="requirement" id="order_request" style="resize: none;"></textarea>
			</div>


			<div class="orderer2">어떻게 지불하시겠습니까?</div>
			<input type="radio" id="card" name="card" value="card" checked>
			<label for="free">신용카드</label>

			<div class="order_checkbox">
				<input type="checkbox" id="order_check" name="order_check">
				<label for="order_check"><a href="${pageContext.request.contextPath}/ask/tac">이용 약관에 동의합니다.</a></label>
			</div>


			<button type="submit" class="btn btn-success btn-100">구매완료</button>
		</form>
    </div>
    
    <!-- validate 플러그인 참조 -->
    <!-- script src="${pageContext.request.contextPath}/assets/plugins/validate/jquery.validate.min.js"></script -->
    <!-- script src="${pageContext.request.contextPath}/assets/plugins/validate/additional-methods.min.js"></script -->
    <!-- sweetalert 플러그인 참조 -->
    <script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/js/validate_order.js"></script>
</body>
</html>