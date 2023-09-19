<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<title>4조 이숲</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- 공통 style -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/header_ask.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/footer.css" />

<!-- style -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ask.css" />

<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>


</head>



<body>


	<!-- 헤더 영역 시작 -->
	<header>
		<%@ include file="../index_header.jsp"%>
	</header>
	<!-- 헤더 영역 끝 -->


	<div class="ask_box">
		<div class="ask_box_pd">
			<h1>이숲의 새로운 소식입니다.</h1>
			<h2>공지사항을 확인해주세요.</h2>


		</div>
	</div>



	<div class="content">
		<div class="tab_content">
			<h1 class="notice_title">공지사항</h1>

			<div id="notice_body" class="clearfix">
				<div class="table-responsive">
					<table class="notice_table">
						<tr class="tr_header">
							<td width="80px">번호</td>
							<td>제목</td>
							<td width="80px">글쓴이</td>
							<td width="80px">조회수</td>
						</tr>

						<tr class="tr_body">
							<c:choose>
								<c:when test="${output ==null || fn:length(output) == 0}">
									<tr class="tr_body">
										<td align="center" colspan="4">조회결과가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${output}" varStatus="status">
										<tr class="tr_body">
											<td><a
												href="${pageContext.request.contextPath}/ask/notice_view?notino=${item.notino}">${item.notino}
											</a></td>
											<td><a
												href="${pageContext.request.contextPath}/ask/notice_view?notino=${item.notino}">${item.title}</a></td>
											<td><a
												href="${pageContext.request.contextPath}/ask/notice_view?notino=${item.notino}">관리자</a></td>
											<td><fmt:formatNumber pattern="###,###,###"
													value="${item.view}" /></td>
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
								<c:url value="/ask/notice" var="prevPageUrl">
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
							<c:url value="/ask/notice" var="pageUrl">
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
								<c:url value="/ask/notice" var="nextPageUrl">
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
	</div>



	<!-- 풋터 영역 시작 -->
	<footer>
		<%@ include file="../index_footer.jsp"%>
	</footer>
	<!-- 풋터 영역 끝 -->



	<!-- Javascript -->
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>


</body>
</html>