<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>이숲 회원가입</title>
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
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/address.js"></script>
</head>
<body>
	<header></header>
    <div id="container">
    <div id="form-horizontal_hd">이숲에 회원가입을 축하드립니다.</div>
    
        <form method="post" class="form-horizontal" name="join_form" id="join_form" action="${pageContext.request.contextPath}/register_ok">
            <div class="form-group">
                <label for="userid" class="form_name">아이디 <span class="identify">*</span></label>
                <div class="form_cont">
                    <input type="text" name="userid" id="userid" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label for="userpw" class="form_name">비밀번호 <span class="identify">*</span></label>
                <div class="form_cont">
                    <input type="password" name="userpw" id="userpw" class="form-control" placeholder="8글자 이상 입력하세요."/>
                </div>
            </div>
            <div class="form-group">
                <label for="userpwconfirm" class="form_name">비밀번호확인 <span class="identify">*</span></label>
                <div class="form_cont">
                    <input type="password" name="userpwconfirm" id="userpwconfirm" class="form-control" />
                </div>
            </div>
          
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
                <label for="usertel" class="form_name">연락처 <span class="identify">*</span></label>
                <div class="form_cont">
                    <input type="tel" name="usertel" id="usertel" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label for="birthdate" class="form_name">생년월일 <span class="identify">*</span></label>
                <div class="form_cont">
                    <input type="date" name="birthdate" id="birthdate" class="form-control" />
                </div>
            </div>
            
            <div class="form-group">
                <label for="postno" class="form_name">우편번호 <span class="identify">*</span></label>
                <div class="form_cont">
                    <input type="text" name="postno" id="postno" class="form-control-add1" />
                </div>
                <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-success" value="우편번호 찾기"><br>
            </div>
            
            <div class="form-group">
                <label for="address1" class="form_name">주소 <span class="identify">*</span></label>
                <div class="form_cont">
                    <input type="text" name="address1" id="address1" class="form-control-add3" />
                </div>
            </div>
            
            <div class="form-group">
                <label for="address2" class="form_name">상세주소</label>
                <div class="form_cont">
                    <input type="text" name="address2" id="address2" class="form-control-add4" />
                </div>
            </div>
            
            <div class="form-group">
                <label for="address3" class="form_name">구주소</label>
                <div class="form_cont">
                    <input type="text" name="address3" id="address3" class="form-control-add5" />
                </div>
            </div>
                           
            <div class="form-group">
                <div class="text-center">
                    <button type="submit" class="btn btn-success">가입하기</button>
                    <button type="reset" class="btn btn-success">다시작성</button>
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