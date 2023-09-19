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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>4조 이숲 관리자</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- 공통 style -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_common.css" />

<!-- 개별 style -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_mem_out.css" />
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
	<!-------------------------------------------- 메뉴 -------------------------------------------->
	<div id="menu" class="pull-left">
		<!-- [공통] 로고 (admin_common.css) -->
		<%@ include file="admin_menu.jsp"%>
		<!--// 아코디언 영역 -->
	</div>

	<!-------------------------------------------- 내용 -------------------------------------------->
	<div id="content" class="pull-left">
		<div id="content_pd">

			<!-- 우측 상단 버튼 (admin_common.css) -->
			<div class="btn_right">
				<a href="${pageContext.request.contextPath}/admin/logout"
					class="btn btn-info">LOGOUT</a>&nbsp;&nbsp; <a
					href="${pageContext.request.contextPath}" class="btn btn-info">HOME</a>
			</div>

			<!-- [공통] 타이틀 (admin_common.css) -->
			<div class="title">탈퇴회원</div>

			<!-- 조건 검색 및 분류 -->
			<div class="search_box">
				<!-- [공통] (admin_common.css) -->

				<!-- 조건 검색 -->
				<div class="clearfix">

					<!-- 타이틀 -->
					<form method="get"
						action="${pageContext.request.contextPath}/admin/mem_out">
						<div class="sc_title pull-left">회원검색</div>

						<!-- 폼(2) - 회원명/상품코드 -->
						<div class="form-group pull-left">
							<select name="mem_out" id="mem_out" class="form-control pull-left" >
								<option value="username"<c:if test="${mem_out == 'username'}">selected</c:if>>회원 이름</option>
								<option value="userid"<c:if test="${mem_out == 'userid'}">selected</c:if>>회원 아이디</option>
								<option value="reason"<c:if test="${mem_out == 'reason'}">selected</c:if>>탈퇴 사유</option>
							</select>
						</div>

						<!-- 폼(3) - 검색창 -->
						<div class="form-group pull-left">
							<div class="form-group pull-left">
								<input type="search" name="keyword" id="keyword"
									class="form-control" value="${keyword}">
							</div>
						</div>
						<div class="pull-left">
							<button type="submit" class="btn btn-success">검색</button>
						</div>
					</form>
				</div>
			</div>

			<div class="h30"></div>

			<!-- 탭 페이지 구성(단일페이지) -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane fade in active" id="admin_mem">


					<!-- 회원목록 테이블 시작 -->
					<table class="prod_table" border="0" cellspacing="0"
						cellpadding="0">
						<tr class="tr_header">
							<td width="20%">회원번호</td>
							<td width="15%">이름</td>
							<td width="15%">아이디</td>
							<td width="25%">탈퇴사유</td>
							<td width="12%">탈퇴일</td>
							<td width="13%">정보</td>
						</tr>
						<c:choose>
							<%-- 조회결과가 없는경우 --%>
							<c:when test="${output == null || fn:length(output) == 0}">
								<tr class="tr_body">
									<td colspan="6" align="center">조회결과가 없습니다.</td>
								</tr>
							</c:when>
							<%-- 조회결과가 있는 경우 --%>
							<c:otherwise>
								<%-- 조회 결과에 따른 반복 처리 --%>
								<c:forEach var="item" items="${output}" varStatus="status">
									<%-- 출력을 위해 준비한 유저이름 변수 --%>
									<c:set var="username" value="${user.username}" />
									<tr class="tr_body">
										<td width="20%">${item.userno}</td>
										<td width="13%">${item.username}</td>
										<td width="12%">${item.userid}</td>
										<td width="22%">${item.reason}</td>
										<td width="12%">${item.outdate}</td>
										<td width="12%"><a href="${pageContext.request.contextPath}/admin/mem_view?userno=${item.userno}">
										<button type="submit" class="btn btn-warning">
										정보</button></a>										
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<!-- 회원목록 테이블 끝 -->

					<!-- 페이지 번호 표시(페이지네이션) 시작 -->
					<div class="pagination_center">
						<ul class="pagination">

							<%-- 페이지 번호 구현 --%>
							<%-- 이전 그룹에 대한 링크 --%>
							<c:choose>
								<%--    이전 그룹으로 이동 가능하다면? --%>
								<c:when test="${pageData.prevPage > 0}">
									<%--  이동할 URL 생성 --%>
									<c:url value="/admin/mem_out"
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
								<c:url value="/admin/mem_out" var="pageUrl">
									<c:param name="page" value="${i}" />
									<c:param name="keyword" value="${keyword}" />
								</c:url>

								<%-- 페이지 번호 출력 --%>
								<c:choose>
									<%--  현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
									<c:when test="${pageData.nowPage == i}">
										<li class="active"><a><strong>${i}</strong></a></li>
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
									<c:url value="/admin/mem_out"
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
				<!-- tab-pane 끝 -->
			</div>
			<!-- tab-content 끝 -->
		</div>
		<!-- content_pd 끝 -->
	</div>



	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>
</html>