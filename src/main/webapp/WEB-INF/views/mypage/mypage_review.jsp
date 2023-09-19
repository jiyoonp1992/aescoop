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
				<a id="dropdownMenu1" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">후기 <b class="glyphicon glyphicon-menu-down pull-right"></b></a>
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
			<!-- 제품리스트 테이블 시작 -->

			<c:choose>
					<c:when test="${output ==null || fn:length(output) == 0}">
						<div class="review_none">조회결과가 없습니다.</div>
					</c:when>
					<c:otherwise>
						<ul class="review_output_ul">
							<c:forEach var="item" items="${output}" varStatus="status">
								<li class="clearfix pd_bottom_3">
							        <span class="review_userid pull-left">${item.pname}</span>
							        <div class="review_rating pull-left">
										<fieldset class="rating">
											<c:if test="${item.rate == 5}">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
											</c:if>
											<c:if test="${item.rate == 4}">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
											</c:if>
											<c:if test="${item.rate == 3}">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
											</c:if>
											<c:if test="${item.rate == 2}">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
											</c:if>
											<c:if test="${item.rate == 1}">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
											</c:if>
										</fieldset>
									</div>
							    </li>
							    <li class="review_output_li">
							    	<span class="review_text">${item.content}</span>
						        </li>
						        <li class="clearfix">
									<div class="pull-right">
										<a href="${pageContext.request.contextPath}/mypage/review_view?reviewno=${item.reviewno}" id="btn-style2">수정</a>&nbsp;<a href="${pageContext.request.contextPath}/mypage/review_del?reviewno=${item.reviewno}&userno=${user.userno}" id="btn-style">삭제</a>
									</div>
						        </li>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>

			<!-- 제품리스트 테이블 끝 -->
			
				<!-- 페이지 번호 표시(페이지네이션) 시작 -->
					<div class="pagination_center">
						<ul class="pagination">

							<%-- 페이지 번호 구현 --%>
							<%-- 이전 그룹에 대한 링크 --%>
							<c:choose>
								<%--    이전 그룹으로 이동 가능하다면? --%>
								<c:when test="${pageData.prevPage > 0}">
									<%--  이동할 URL 생성 --%>
									<c:url value="/mypage/review?userno=${userno}"
										var="prevPageUrl">
										<c:param name="page" value="${pageData.prevPage}" />
										<c:param name="keyword" value="${keyword}" />
									</c:url>
									<li><a href="${prevPageUrl}">&laquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a>&laquo;</a></li>
								</c:otherwise>
							</c:choose>

							<%--  페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
							<c:forEach var="i" begin="${pageData.startPage}"
								end="${pageData.endPage}" varStatus="status">
								<%-- 이동할 URL 생성 --%>
								<c:url value="/mypage/review?userno=${userno}" var="pageUrl">
									<c:param name="page" value="${i}" />
									<c:param name="keyword" value="${keyword}" />
								</c:url>

								<%-- 페이지 번호 출력 --%>
								<c:choose>
									<%--  현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
									<c:when test="${pageData.nowPage == i}">
										<li class="active"><a>${i}</a></li>
									</c:when>
									<%-- 나머지 페이지의 경우 링크 적용함 --%>
									<c:otherwise>
										<li><a href="${pageUrl}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<%-- 다음 그룹에 대한 링크 --%>
							<c:choose>
								<%-- 다음 그룹으로 이동 가능하다면? --%>
								<c:when test="${pageData.nextPage > 0}">
									<%-- 이동할 URL 생성 --%>
									<c:url value="/mypage/review?userno=${userno}"
										var="nextPageUrl">
										<c:param name="page" value="${pageData.nextPage}" />
										<c:param name="keyword" value="${keyword}" />
									</c:url>
									<li><a href="${nextPageUrl}">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a>&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- 페이지 번호 표시(페이지네이션) 끝 -->
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