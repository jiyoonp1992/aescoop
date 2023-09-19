<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>4조 이숲 관리자</title>
    
    <!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />
	
	<!-- bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
	
	<!-- 공통 style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
	
	<!-- 개별 style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_login.css" />
	
	
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
	
	<!-- 웹 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/ajax-form/jquery.form.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/validate/jquery.validate.min.js"></script>
</head>

<body>
    <div class="content">
		<div class="login_logo"><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/img/logo.png"></a></div>
		<div class="login_box">
			<div class="title">관리자 로그인</div>
			<form id="login-form" class="form-inline" method="post" action="${pageContext.request.contextPath}/admin/login_ok">
				<div class="form-group">
					<input type="text" class="form-control" id="userid" placeholder="아이디" name="userid">
				</div>
				<div class="form-group" style="margin-bottom: 0">
					<input type="password" class="form-control" id="userpw" placeholder="패스워드" name="userpw">
				</div>
				<div class="h20"><!-- height20 --></div>	
				<button type="submit" class="btn btn-success btn-width">로그인</button>
			</form>
		</div>
	</div>

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>

</html>