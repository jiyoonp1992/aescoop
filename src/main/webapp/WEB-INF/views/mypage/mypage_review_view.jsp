<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>4조 이숲</title>
    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <!-- 공통 style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
    <!-- style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/my_review.css" />
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
</head>

<body>
	<header>
	<%@ include file="../index_header.jsp" %>
	</header>
	<!-- 마이페이지 상단 -->
	<div id="mypage_box">
		<div id="mypage_header" class="clearfix">
			<h1>환영합니다. ${user.username}님</h1>
			<!-- 드롭다운 -->
			<div class="dropdown clearfix">
				<a id="dropdownMenu1" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">계정정보 <b class="glyphicon glyphicon-menu-down pull-right"></b></a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath}/mypage/main">계정정보</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath}/mypage/address?userno=${user.userno}">주소록</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath}/mypage/order?userno=${user.userno}">주문내역</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath}/mypage/review?userno=${user.userno}">후기</a></li>
					<li role="presentation" class="divider"></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath}/mypage/withdrawal">회원탈퇴</a></li>
				</ul>
			</div>
			<!-- 드롭다운 끝 -->
		</div>
	</div>
	<!-- 마이페이지 상단 끝 -->
	<!-- 마이페이지 하단 -->
	<!------------------------ 내용 시작 -------------------------------->
	<div class="content">

		<div class="con_box">
	
			<!-- 리뷰 시작 -->
			<h1>내가 쓴 후기</h1>
			
			<form id="edit_review" method="post" action="${pageContext.request.contextPath}/mypage/review_edit_ok">
				<input type="hidden" name="userno" value="${user.userno}" />
				<input type="hidden" name="reviewno" value="${output.reviewno}" />
				<ul class="review_output_ul">
					<li class="clearfix pd_bottom_3"><span class="review_userid pull-left">${output.pname}</span>
						<div class="review_rating">
							<fieldset class="rating">
								<input type="radio" id="rating_1_star5" name="rate" value="5"<c:if test="${output.rate == 5}"> checked</c:if>><label for="rating_1_star5"></label>
								<input type="radio" id="rating_1_star4" name="rate" value="4"<c:if test="${output.rate == 4}"> checked</c:if>><label for="rating_1_star4"></label>
								<input type="radio" id="rating_1_star3" name="rate" value="3"<c:if test="${output.rate == 3}"> checked</c:if>><label for="rating_1_star3"></label>
								<input type="radio" id="rating_1_star2" name="rate" value="2"<c:if test="${output.rate == 2}"> checked</c:if>><label for="rating_1_star2"></label>
								<input type="radio" id="rating_1_star1" name="rate" value="1"<c:if test="${output.rate == 1}"> checked</c:if>><label for="rating_1_star1"></label>
							</fieldset>
						</div>
					</li>
					<li class="review_output_li">
						<textarea name="content" id="text_form" style="resize:none;">${output.content}</textarea>
					</li>
				</ul>
	
				<!-- 버튼 시작 ------------------------------------------------------------------->
				<div class="form-group">
					<div class="btn_right">
						<button type="submit" class="btn btn-danger">수정</button>&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/mypage/review?userno=${user.userno}" class="btn btn-warning" id="font-white">목록</a>
					</div>
				</div>
				<!-- 버튼 끝 ------------------------------------------------------------------->
			</form>

			<!-- 리뷰 끝 -->
		</div>

	</div>
	<!------------------------ 내용 끝 -------------------------------->


	<!-- 풋터 영역 시작 -->
	<footer>
	<%@ include file="../index_footer.jsp" %>
	</footer>
	
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>

</html>