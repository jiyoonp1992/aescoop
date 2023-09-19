<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>이숲 아이디/비밀번호 찾기</title>
	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />
	<!-- bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
	<!-- 공통 style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
	<!-- style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/register.css" />
	<!-- 하단 스토어 슬라이드 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/ImageSlider/slider2.css" />
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
	<!-- 웹 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/register.js"></script>
</head>
<body>
	<header></header>
    <div id="container">
    <div id="form-horizontal_hd">아이디를 잊으셨습니까?</div>
        <form method="post" class="form-horizontal" name="join_form" id="join_form" action="${pageContext.request.contextPath}/id_find_ok">
            <div class="form-group">
                <label for="username" class="form_name">이름 <span class="identify">*</span></label>
                <div class="form_cont">
                    <input type="text" name="username" id="username" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label for="usermail" class="form_name">이메일 <span class="identify">*</span></label>
                <div class="form_cont">
                    <input type="email" name="usermail" id="usermail" class="form-control" />
                </div>
            </div>        
    		
            <div class="form-group">
                <div class="text-center">
                    <button type="submit" class="btn btn-success" id="button">아이디 확인하기</button>
                    <button type="reset" class="btn btn-success" id="button">다시작성</button>
                </div>
            </div>
        </form>
    </div>
    <footer></footer>
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!-- validate 플러그인 참조 -->
    <script src="${pageContext.request.contextPath}/assets/plugins/validate/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/validate/additional-methods.min.js"></script>
    <!-- sweetalert 플러그인 참조 -->
    <script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/regex.js"></script>
        <!-- 입력규칙, validate 플러그인 참조 -->
    <script type="text/javascript">
    </script>
</body>
</html>