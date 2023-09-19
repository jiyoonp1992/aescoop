<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>

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
	href="${pageContext.request.contextPath}/assets/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/my_main.css" />
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
	<!-- 마이페이지 상단 -->
	<div id="mypage_box">
		<div id="mypage_header" class="clearfix">
			<h1>환영합니다. ${user.username}님</h1>
			<!-- 드롭다운 -->
			<div class="dropdown clearfix">
				<a id="dropdownMenu1" href="#" role="button" class="dropdown-toggle"
					data-toggle="dropdown">계정정보 <b
					class="glyphicon glyphicon-menu-down pull-right"></b></a>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenu1">
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
	<div id="accountInfo">
		<!-- 개인정보 수정 -->
		<div id="account" class="clearfix">
			<div id="account_hd">
				<!-- 개인정보 편집 아코디언 -->
				<div class="panel-group" id="accordion">
					<!-- 배송주소 -->
					<div class="panel panel-default">
						<a class="accordion-toggle clearfix" data-toggle="collapse"
							data-parent="#accordion" href="#collapse_ac_one"> <span
							class="pull-left">개인정보</span> <span class="pull-right">편집</span>
						</a>
						<div id="collapse_ac_one" class="panel-collapse collapse">
							<form class="edit_account" name="account_form" id="account_form"
								method="POST"
								action="${pageContext.request.contextPath}/mypage/name_edit_ok">
								<input type="hidden" name="userno" value="${user.userno}" />
								<div class="form-group">
									<label for="username" class="form_name">이름</label>
									<div class="form_cont">
										<div class="form_cont">
											<input type="text" name="username" id="username"
												class="form-control" value="${user.username}" />
										</div>
									</div>
									<div class="form-group">
										<label for="email" class="form_name">이메일 </label>
										<div class="form_cont">
											<input type="email" name="usermail" id="usermail"
												class="form-control" disabled placeholder="${user.usermail}" />
										</div>
									</div>
									<!-- 생일(날짜, 달, 년) 드롭 -->
									<div class="form-group">
										<label for="birthdate" class="form_name">생년월일</label>
										<div class="form_cont">
											<input type="date" name="birthdate" id="birthdate"
												class="form-control" />
										</div>
									</div>
									<!-- 생일(날짜, 달, 년) 드롭 끝 -->

									<button type="submit" class="btn btn-success">저장</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 개인정보 편집 아코디언 -->
		</div>
		<div id="account_body">
			<div>${user.username}님</div>
			<div>${user.usermail}</div>
			<div>${user.birthdate}</div>
		</div>
		<!-- 개인정보 수정 끝-->
		<hr />
		<!-- 패스워드 수정 -->
		<div id="account_Pw" class="clearfix">
			<div id="account_Pw_hd" class="clearfix">
				<!-- 패스워드 편집 아코디언 -->
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<a class="accordion-toggle clearfix" data-toggle="collapse"
							data-parnet="#accordion" href="#collapse_ac_Two"> <span
							class="pull-left">비밀번호</span> <span class="pull-right">편집</span></a>
						<div id="collapse_ac_Two" class="panel-collapse collapse">
							<form class="edit_account" name="account_form" id="account_form"
								method="POST"
								action="${pageContext.request.contextPath}/mypage/pw_edit_ok">
								<input type="hidden" name="userno" value="${user.userno}" />
								<div class="form-group">
									<div class="form_cont">
										<input type="password" name="userpw" id="userpw"
											class="form-control" placeholder="현재 비밀번호" />
									</div>
								</div>
								<div class="form-group">
									<div class="form_cont">
										<input type="password" name="new_pw" id="new_pw"
											class="form-control" placeholder="새 비밀번호" />
									</div>
								</div>
								<div class="form-group">
									<div class="form_cont">
										<input type="password" name="userpwconfirm" id="userpwconfirm"
											class="form-control" placeholder="비밀번호 확인" />
									</div>
								</div>
								<button type="submit" class="btn btn-success">저장</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 패스워드 편집 아코디언 끝 -->
			<div id="account_Pw_body">
				<div>●●●●●●●●●●</div>
			</div>
			<!-- 패스워드 수정 끝 -->

		</div>
	</div>
	<!-- 주소록 하단 끝-->
	<footer>
		<%@ include file="../index_footer.jsp"%>
	</footer>
	<!-- Javascript -->
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>

</html>