<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_mem_edit.css" />
	
	<!-- AjaxHelper style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
	
	
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
	
	<!-- 웹 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/address.js"></script>
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
			<div class="title">회원 정보 수정</div>
				
				<!-- [공통] (admin_common.css) -->
				<div class="write_box">
					<form method="post" name="mem_edit_form" id="mem_edit_form"
					action="${pageContext.request.contextPath}/admin/mem_edit_ok?userno=${output.userno}">
					
					
					<input type="hidden" name="is_out" value="${output.is_out}">
					
					<!-- --------------- 시작: 첫 form 그룹  ---------------- -->

					<!-- 회원번호 시작 -->
					<div class="form-group col-md-6 no_left_padding">
						<label for="mem_no" class="form_title">회원 번호</label> <input
								type="text" class="form-control" name="userno" id="userno" value="${output.userno}" readonly>
					</div>
					<!-- 회원번호 끝 -->
					
					<!-- 회원 아이디 시작 -->
					<div class="form-group col-md-6 no_left_padding">
							<label for="mem_id" class="form_title">아이디</label> <input
								type="text" class="form-control" name="userid" id="userid" value="${output.userid}" readonly>
						</div>
					<!-- 회원 아이디 끝 -->
					
					<!-- 회원명 시작 -->
					<div class="form-group col-md-6 no_left_padding">
							<label for="mem_name" class="form_title">회원명</label> <input
								type="text" class="form-control" name="username" id="username" value="${output.username}">
						</div>
					<!-- 회원명 끝 -->
					
					<!-- 회원 연락처 시작 -->
					<div class="form-group col-md-6 no_left_padding">
							<label for="mem_tel" class="form_title">연락처</label> <input
								type="tel" class="form-control" name="usertel" id="usertel" value="${output.usertel}" placeholder="-제외, 숫자만 입력해주세요.">
								</div>
					<!-- 회원 연락처 끝 -->
					
					<!-- 회원 이메일 시작 -->
					<div class="form-group col-md-6 no_left_padding">
					<label for="mem_email" class="form_title">이메일</label>
					<input type="email" class="form-control" name="usermail" id="usermail" value="${output.usermail}">
					</div>
					<!-- 회원 이메일 끝 -->
					
					<!-- 회원 생년월일 시작 -->
					<div class="form-group col-md-6 no_left_padding">
						<label for="birthdate" class="form_title">생년월일</label>
						<input type="date" class="form-control" name="birthdate" id="birthdate" value="${output.birthdate}">
					</div>
					<!-- 회원 생년월일 끝 -->
					
					<!-- 회원 가입일 시작 -->
					<div class="form-group col-md-6 no_left_padding">
						<label for="ragdate" class="form_title">가입일</label>
						<input type="text" class="form-control" name="regdate" id="regdate" placeholder="${output.regdate}" readonly>
					</div>
					<!-- 회원 가입일 끝 -->
			        
			        <!-- 관리자 권한 부여 -->
			        <div class="form-group col-md-6 no_left_padding">
			            <label for="mem_admin_edit" class="form_title">관리자</label>
			            <div class="radio-pd">
			                <label>
			                    <input type='radio' name="is_admin" id="is_admin" value="N"checked> 일반 회원</label>&nbsp;&nbsp;
			                <label>
			                    <input type='radio' name="is_admin" id="is_admin" value="Y"> 관리자</label>
			            </div>
			        </div>
			        <!-- 관리자 권한 부여 끝 -->
			        
					<!-- 우편번호, 주소 ----------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='prod_price' class="pull-left form_title">
			            	주소 <span class='identify'>*</span>&nbsp;&nbsp;&nbsp;<input type="button" onclick="sample6_execDaumPostcode()" class="btn-success post_bt" value="우편번호 찾기">
			            </label>
			        </div>
			        
			        <div class="clearfix">
			        <div class="clearfix form-group col-md-6 no_left_padding">
							<input type="text" id="postno" name="postno" class="form-control pull-left" value="${output.postno}">
							<input type="text" id="address1" name="address1" class="form-control pull-left" value="${output.address1}">	
			        </div>
			        <div class="clearfix form-group col-md-6 no_left_padding">
							<input type="text" id="address2" name="address2" class="form-control pull-left width49" value="${output.address2}">
							<input type="text" id="address3" name="address3" class="form-control pull-left width49" placeholder="상세주소" value="${output.address3}">
			        </div>
			        
			        </div>
					<!-- 우편번호, 주소 끝 ----------------------------------------------------------------->
					
					
					<div class="h30"></div>

					<br>
					
					<!-- 하단버튼 -->
					<div class="form-group clearfix">
			            <div class="btn_right">
							<button type="submit" class="btn btn-danger">확인</button>&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath}/admin/mem_list" class="btn btn-warning">
										이전</a>
						</div>
			        </div>
				</form>
				</div>
		</div><!-- content_pd 끝 -->
	</div><!-- content 끝 -->



	<!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    
	
	<!-- validate 플러그인 참조 -->
    <script src="${pageContext.request.contextPath}/assets/plugins/validate/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/validate/additional-methods.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/validate_admin_mem_register.js"></script>
	
</body>

</html>