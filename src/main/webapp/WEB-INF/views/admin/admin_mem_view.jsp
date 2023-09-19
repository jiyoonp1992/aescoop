<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_mem_view.css" />

<!-- AjaxHelper style -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />


<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

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
			<div class="title">탈퇴 회원정보</div>

			<!-- [공통] (admin_common.css) -->
			<div class="write_box clearfix">
				<form method="get" name="mem_view_form" id="mem_view_form"
					action="${pageContext.request.contextPath}/admin/mem_view">
					<div class="form_box">
						<!-- --------------- 시작: 첫 form 그룹  ---------------- -->

						<!-- 회원 아이디 시작 -->
						<div class="form-group col-md-6 no_left_padding">
							<label for="mem_id" class="form_title">아이디</label> <input
								type="text" class="form-control" name="mem_id" id="mem_id"
								placeholder="${output.userid}" disabled>
						</div>
						<!-- 회원 아이디 끝 -->

						<!-- 회원명 시작 -->
						<div class="form-group col-md-6 no_left_padding">
							<label for="mem_name" class="form_title">회원명</label> <input
								type="text" class="form-control" name="mem_name" id="mem_name"
								placeholder="${output.username}" disabled>
						</div>
						<!-- 회원명 끝 -->

						<!-- 회원 탈퇴 사유 시작-->
						<div class="form-group col-md-6 no_left_padding">
							<label for="mem_out_reason" class="form_title">탈퇴 사유</label> <input
								type="text" class="form-control" name="mem_out_reason"
								id="mem_out_reason" placeholder="${output.reason}" disabled>
						</div>
						<!-- 회원 탈퇴 사유 끝 -->

						<!-- 회원 탈퇴 날짜 시작-->
						<div class="form-group col-md-6 no_left_padding">
							<label for="mem_out_date" class="form_title">탈퇴 날짜</label> <input
								type="text" class="form-control" name="mem_out_date"
								id="mem_out_date" placeholder="${output.outdate}" disabled>
						</div>
						<!-- 회원 탈퇴 날짜 끝 -->

						<!-- 관리자 주석 시작 -->
						<div class="form-group no_left_padding">
							<label for="mem_out_reason" class="form_title">기타 사유</label>
							<div class="message_box">
								<textarea name="message" class="message" style="resize: none;">${output.reason}</textarea>
							</div>
						</div>
						<!-- 관리자 주석 끝 -->

						<br>

						<div class="form-group ">
							<div class="btn_right clearfix">
								<a href="${pageContext.request.contextPath}/admin/mem_out" class="btn btn-danger">
										이전</a>
							</div>
						</div>
					</div>
				</form>
				<!-- 하단버튼 -->

			</div>
		</div>
		<!-- content_pd 끝 -->
	</div>
	<!-- content 끝 -->



	<!-- Javascript -->
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>


	<!-- validate 플러그인 참조 -->
	<script src="${pageContext.request.contextPath}/assets/plugins/validate/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/validate/additional-methods.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/validate_admin_mem_register.js"></script>

</body>

</html>