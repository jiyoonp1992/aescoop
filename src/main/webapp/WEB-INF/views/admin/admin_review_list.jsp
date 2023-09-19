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
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>4조 이숲 관리자</title>
	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="../assets/ico/favicon.ico" />
	<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-144-precomposed.png" />
	<!-- bootstrap -->
	<link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css" />
	<!-- 공통 style -->
	<link rel="stylesheet" type="text/css" href="../assets/css/admin_common.css" />
	<!-- 개별 style -->
	<link rel="stylesheet" type="text/css" href="../assets/css/admin_qna_list.css" />
	<link rel="stylesheet" type="text/css" href="../assets/css/admin_review_list.css" />
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
	<!-- 웹 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<script src="../assets/js/jquery.min.js"></script>

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
			<div class="title">Review</div>
			<!-- 조건 검색 및 분류 -->
			<div class="search_box">
				<ul class="nav nav-pills" id="mytab">
					<li><a
						href="${pageContext.request.contextPath}/admin/admin_notice_list.do">공지사항</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/admin_qna_list.do">Q&A</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/admin_review_list.do" class="active">Review</a></li>

				</ul>

				<div class="c_search clearfix">

					<!-- 타이틀 -->

					<form method="get"
						action="${pageContext.request.contextPath}/admin/admin_review_list.do">

						<div class="sc_title pull-left">조건검색</div>

						<!-- 폼(1) - 분류 -->
						<div class="form-group pull-left">
							<select name="review_view" id="review_view"
								class="form-control pull-left">
								<option value="pname"
									<c:if test="${review_view == 'pname'}">selected</c:if>>상품명</option>
								<option value="username"
									<c:if test="${review_view == 'username'}">selected</c:if>>작성자</option>
								<option value="content"
									<c:if test="${review_view == 'content'}">selected</c:if>>내용</option>
							</select>
						</div>



						<!-- 폼(3) - 검색창 -->


						<div class="form-group pull-left">
							<input type="search" name="keyword" id="keyword"
								class="form-control" value="${keyword}">
						</div>

						<!-- 버튼 -->
						<div class="pull-left">
							<button type="submit" class="btn btn-success">검색</button>
						</div>
					</form>
				</div>
			</div>
			<div class="h30"></div>
			<!-- 탭 페이지 구성(단일페이지) -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane fade in active" id="dept">
					<div class="clearfix btn-pd" style="padding-bottom: 17px;">
						<button type="submit" class="btn btn-danger pull-left"
							onclick="deleteValue();">게시물삭제</button>
						<br />
					</div>
					<!-- 제품리스트 테이블 시작 -->
					<table class="prod_table" border="0" cellspacing="0"
						cellpadding="0">
						<tr class="tr_header">
							<td width="20%">상품명</td>
							<td width="10%">작성자</td>
							<td>내용</td>
							<td width="10%">평점</td>
							<td width="12%">기능</td>
						<tbody>
							<c:choose>
								<%-- 조회결과가 없는 경우 --%>
								<c:when test="${output == null || fn:length(output) == 0}">
									<tr class="tr_body">
										<td colspan="8" align="center">조회결과가 없습니다.</td>
									</tr>
								</c:when>
								<%-- 조회결과가 있는  경우 --%>
								<c:otherwise>
									<%-- 조회 결과에 따른 반복 처리 --%>
									<c:forEach var="item" items="${output}" varStatus="status">
										<%-- 출력을 위해 준비한 교수이름 변수 --%>
										<c:set var="content" value="${item.content}" />

										<tr class="tr_body">
											<td align="center">${item.pname}</td>
											<td align="center">${item.userid}</td>
											<td align="center">${item.content}</td>
											<td align="center">
												<div class="review_rating">
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
											</td>
											<td align="center">
												
												<button type="button" class="btn btn-danger"
													onclick="location.href='${pageContext.request.contextPath}/admin/admin_review_delete_ok.do?reviewno=${item.reviewno}'"
													id="btn-delete">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>


					</table>
					<!-- 제품리스트 테이블 끝 -->
					<!-- 페이지 번호 표시(페이지네이션) 시작 -->
					<div class="pagination_center">
						<ul class="pagination" style="width: 310px;">

							<%-- 페이지 번호 구현 --%>


							<%-- 이전 그룹에 대한 링크 --%>
							<c:choose>
								<%--    이전 그룹으로 이동 가능하다면? --%>
								<c:when test="${pageData.prevPage > 0}">
									<%--  이동할 URL 생성 --%>
									<c:url value="/admin/admin_reivew_list.do" var="prevPageUrl">
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
								<c:url value="/admin/admin_review_list.do" var="pageUrl">
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
									<c:url value="/admin/admin_review_list.do" var="nextPageUrl">
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


					<!-- 하단 버튼 -->
					<!-- <div class="clearfix btn-pd">
						<button type="submit" class="btn btn-danger pull-left">삭제</button>
					</div> -->
					<div class="clearfix btn-pd" style="padding-bottom: 17px;">
						<button type="submit" class="btn btn-danger pull-left"
							onclick="deleteValue();">게시물삭제</button>
						<br />
					</div>

					<!-- tab-pane 끝 -->
				</div>
				<!-- tab-content 끝 -->
			</div>
			<!-- content_pd 끝 -->
		</div>
		<!-- content 끝 -->


		<!-- Javascript -->
		<script src="../assets/js/bootstrap.min.js"></script>
		<!-- AjaxHelper -->
		<script src="../assets/plugins/ajax/ajax_helper.js"></script>
		<!-- handlebar plugin -->
		<script src="../assets/plugins/handlebars/handlebars-v4.0.11.js"></script>
		<!-- Ajax로 읽어온 내용을 출력하는데 사용될 HTML 템플릿 -->
		<script id="category_item_tmpl" type="text/x-handlebars-template">
        {{#each item}}
            <option value="{{value}}">{{text}}</option>
        {{/each}}
    	</script>
		<!-- validate 플러그인 참조 -->
		<script src="../assets/plugins/validate/jquery.validate.min.js"></script>
		<script src="../assets/plugins/validate/additional-methods.min.js"></script>
		<script src="../assets/js/validate_admin_notice_write.js"></script>
</body>

</html>