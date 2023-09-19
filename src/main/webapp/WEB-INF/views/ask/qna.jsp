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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/header_ask.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/footer.css" />

<!-- style -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/ask.css" />

<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>

<!-- 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

</head>

<body>
	<!-- 헤더 영역 시작-->
	<header>
		<%@ include file="../index_header.jsp"%>
	</header>
	<!-- 헤더 영역 끝 -->

	<!------------------------ 이숲에게 묻는다 시작 -------------------------------->
	<div class="ask_box">
		<div class="ask_box_pd">
			<h1>이숲에게 묻는다</h1>
		</div>
	</div>
	<!------------------------ 이숲에게 묻는다 끝 -------------------------------->

	<!------------------------ 문의하기 시작 -------------------------------->
	<div class="content-wrapper">
		<div class="content clearfix">
			<div class="main_box clearfix">

				<div>Aesoop 도움</div>
				<h1>이숲에게 문의하기</h1>

				<div class="call">전화</div>
				<h3>
					1800-1987
				</h3>

				<div class="send">메일 보내기</div>
				<form id="addForm" method="post"
					action="${pageContext.request.contextPath}/admin/admin_qna_write_ok.do">

					<div class="input_group_ask">
						<select name="title" id="title">
							<option value="">문의하고자 하는 질문을 선택해 주세요</option>
							<option value="기타 문의">기타 문의</option>
							<option value="주문 문의">주문 문의</option>
							<option value="제품 문의">제품 문의</option>
							<option value="고객 서비스">고객 서비스</option>
						</select>
					</div>

					<div class="form-body">
						<div class="form-group form-parents">
							<input type="text" class="form-control2" id="prod_search"
								name="email" placeholder="이메일 주소">
						</div>
					</div>

					<div class="form-body">
						<div class="form-group form-parents">
							<input type="text" class="form-control2" id="prod_search"
								name="username" placeholder="이름">
						</div>
					</div>

					<div class="form-body">
						<div class="form-group form-parents">
							<input type="text" class="form-control2" id="prod_search"
								name="tel" placeholder="연락처">
						</div>
					</div>

					<br> <br> <br> <br>

					<div>
						<textarea name="content" id="text_form2" style="resize: none;"
							placeholder="문의사항을 입력해주세요."></textarea>
					</div>

					<div class="submit">
						<button type="submit" class="btn btn-success btn-100">제출</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!------------------------ 문의하기 끝 -------------------------------->
	<br>
	<br>

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