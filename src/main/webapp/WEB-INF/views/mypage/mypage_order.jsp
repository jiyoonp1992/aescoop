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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/my_order.css" />
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
</head>

<body>
	<header>
	<%@ include file="../index_header.jsp" %>
	</header>
	
	<!-- 주소록 상단 -->
    <div id="mypage_box">
        <div id="mypage_header" class="clearfix">
            <h1>환영합니다. ${user.username}님</h1>
            <input type="hidden" name="userno" value="${user.userno}" />
            <!-- 드롭다운 -->
            <div class="dropdown clearfix">
                <a id="dropdownMenu1" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">주문내역 <b class="glyphicon glyphicon-menu-down pull-right"></b></a>
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
    <!-- 주소록 상단 끝 -->
    <div id="mypage_body">
        <div id="order_hd">
        <div class="h30"><!-- height30 --></div>
            <h1>주문내역</h1>
            <span>주문한 상품의 배송상태를 확인할 수 있습니다. 언제나 빠른 발송, 배송이 가능하도록 최선을 다하겠습니다. <p class="text-info">주문번호를 클릭하시면, 자세한 사항을 볼수 있습니다.</p></span>
        </div>
        <br />
		<div id="order_body" class="clearfix">
			<div class="table-responsive">
				<table class="prod_table">
					<tr class="tr_header">
						<td>주문날짜</td>
						<td>주문번호</td>
						<td>수량</td>
						<td>금액</td>
						<td>주문상태</td>
						<td>기능</td>
					</tr>

					<tr class="tr_body">
						<c:choose>
							<c:when test="${output ==null || fn:length(output) == 0}">
								<tr class="tr_body">
									<td align="center" colspan="7">조회결과가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${output}" varStatus="status">
									<c:set var="username" value="${item.username}" />
									<tr class="tr_body">
										<td><a href="${pageContext.request.contextPath}/mypage/order_view?orderno=${item.orderno}">${item.paid} </a></td>
										<td><a href="${pageContext.request.contextPath}/mypage/order_view?orderno=${item.orderno}">${item.orderno}</a></td>
										<td><a href="${pageContext.request.contextPath}/mypage/order_view?orderno=${item.orderno}">${item.orderamount}</a></td>
										<td>₩ <fmt:formatNumber pattern="###,###,###" value="${item.tprice}" /></td>
										<td>${item.orderstatus}</td>
										<td><a href="${pageContext.request.contextPath}/mypage/order_view?orderno=${item.orderno}" class="btn btn-warning">상세보기</a>&nbsp;</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tr>

				</table>
			</div>


			<!-- 페이지 번호 표시(페이지네이션) 시작 -->
					<div class="pagination_center">
						<ul class="pagination">

							<%-- 페이지 번호 구현 --%>
							<%-- 이전 그룹에 대한 링크 --%>
							<c:choose>
								<%--    이전 그룹으로 이동 가능하다면? --%>
								<c:when test="${pageData.prevPage > 0}">
									<%--  이동할 URL 생성 --%>
									<c:url value="/admin/order_list"
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
								<c:url value="/admin/order_list" var="pageUrl">
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
									<c:url value="/admin/order_list"
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
		</div>
	</div>
    
    <footer>
	<%@ include file="../index_footer.jsp" %>
	</footer>
	
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>

</html>