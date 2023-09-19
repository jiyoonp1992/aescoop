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
<title>4조 이숲</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<!-- 공통 style -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/reset.css" />

<!-- style -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/product/prod_list.css" />

<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>

<!-- 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

</head>

<body>
	<header>
		<%@ include file="../index_header.jsp"%>
	</header>
	<div id="container">
		<!-- 큰 제목 -->

		<div class="list_theme">
			<h1>
				<c:choose>
					<c:when test="${cateno==0 and subcateno==0}">
            	검색결과
            </c:when>
					<c:otherwise>
						<c:if test="${subcateno == '' && cateno == 1}">스킨</c:if>
						<c:if test="${subcateno == '' && cateno == 2}">헤어</c:if>
						<c:if test="${subcateno == '' && cateno == 3}">바디&핸드</c:if>
						<c:if test="${subcateno == '' && cateno == 4}">향수</c:if>
						<c:if test="${subcateno == '' && cateno == 5}">홈</c:if>
						<c:if test="${subcateno == 11}">클렌저</c:if>
						<c:if test="${subcateno == 12}">트리트먼트 & 마스크</c:if>
						<c:if test="${subcateno == 13}">토너</c:if>
						<c:if test="${subcateno == 14}">립 & 아이</c:if>
						<c:if test="${subcateno == 15}">선케어 / SPF</c:if>
						<c:if test="${subcateno == 21}">샴푸</c:if>
						<c:if test="${subcateno == 22}">컨디셔너</c:if>
						<c:if test="${subcateno == 23}">트리트먼트</c:if>
						<c:if test="${subcateno == 31}">핸드</c:if>
						<c:if test="${subcateno == 32}">바디</c:if>
						<c:if test="${subcateno == 33}">퍼스널</c:if>
						<c:if test="${subcateno == 41}">향수</c:if>
						<c:if test="${subcateno == 51}">홈 케어</c:if>
						<c:if test="${subcateno == 52}">문학</c:if>
					</c:otherwise>
				</c:choose>
			</h1>
		</div>
		<!-- 제품 리스트 -->
		<div class="list_theme_detail_list">
			<ul class="list_theme_detail">
				<c:choose>
						<c:when test="${cateno==0 && subcateno==0}">
                		"${prod_search}"의 검색결과입니다.
                	</c:when>
						<c:otherwise>
							<li><a
								href="${pageContext.request.contextPath}/product?cateno=${cateno}">모두
								보기</a></li>
				<c:forEach var="item" items="${output2}" varStatus="status">
					<li><a
						href="${pageContext.request.contextPath}/product?cateno=${cateno}&subcateno=${item.subcateno}">${item.sub_category}</a></li>
				</c:forEach>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<input type="hidden" name="cateno" id="cateno" value="${cateno}">
		<input type="hidden" name="subcateno" id="subcateno"
			value="${subcateno}">
		<!-- 제품 리스트 끝 -->
		

		<div class="clearfix">

			<!-- 제품 정보 -->

			<c:forEach var="item" items="${output}" varStatus="status">
				<div class="prod_info col-md-4 col-sm-6">
					<a
						href="${pageContext.request.contextPath}/product_view?prodno=${item.prodno}"
						class="prod_info_link"> <img class="prod_info_link_img"
						src="${item.file}">
						<div class="prod_info_link_text">
							${item.pname} <br> ${item.size}mL / ￦
							<fmt:formatNumber pattern="###,###,###" value="${item.price}" />
						</div>
					</a>
					<form class="addCartForm"
						action="${pageContext.request.contextPath}/add_cart">
						<input type="hidden" name="prodno" value="${item.prodno}"/>
						<button type="submit" class="prod_info_cart btn btn-success">
							카트에 추가 - ￦
							<fmt:formatNumber pattern="###,###,###" value="${item.price}" />
						</button>
					</form>

				</div>
			</c:forEach>

		</div>

	</div>
	<footer>
		<%@ include file="../index_footer.jsp"%>
	</footer>
	<!-- Javascript -->
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	>
	<script
		src="${pageContext.request.contextPath}/assets/js/product/prod_skin_skin-care-spf.js"></script>


	<!--Google CDN 서버로부터 jQuery 참조 -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- jQuery Ajax Form plugin CDN -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<!-- jQuery Ajax Setup -->
	<script
		src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<!-- User Code -->

	<script type="text/javascript">
		$(function() {
			// #addForm에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
			$(".addCartForm").ajaxForm({
				// 전송 메서드 지정
				method : "GET",
				// 서버에서 200 응답을 전달한 경우 실행됨
				success : function(json) {
					console.log(json);

					// json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
					
				}
			});
		});
	</script>



</body>

</html>