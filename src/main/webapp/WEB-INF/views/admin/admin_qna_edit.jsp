<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
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
<link rel="apple-touch-icon-precomposed"
	href="../assets/ico/apple-touch-icon-144-precomposed.png" />
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/bootstrap.min.css" />
<!-- 공통 style -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/admin_common.css" />
<!-- 개별 style -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/admin_notice_write.css" />
<link rel="stylesheet"
	href="../assets/plugins/sweetalert/sweetalert2.min.css" />
<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<!-- 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script src="../assets/js/jquery.min.js"></script>
<style type="text/css">
#content {
	height: 500px !important;
}
</style>
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
			<div class="title">게시물 수정</div>
			<!-- 조건 검색 및 분류 -->
			<div class="write_box">
				<!-- [공통] (admin_common.css) -->
				<h1>QnA 수정</h1>
				<form id="editForm" method="post"
					action="${pageContext.request.contextPath}/admin/admin_qna_edit_ok.do">
					<%
					/* action 페이지에서 사용할 WHERE 조건값을 hidden 필드로 숨겨서 전송한다. */
					%>
					<input type="hidden" name="qnano" value="${output.qnano}" />

       
					<!-- 제목 끝 ----------------------------------------------------------------->
					<div class="h10">
					<!-- height10 -->
					</div>
					<!-- 제목 시작 ------------------------------------------------------------------->
					<div class="clearfix form-group">
						<label for='title' class="col-md-1 form_title">제목<span
							class='identify'>*</span></label>
						<div class="col-md-11">
							<input type="text" name="title" id="notice_title"
								class="form-control" value="${output.title}"
								placeholder="${content}" />
						</div>
					</div>
					<!-- 제목 끝 ----------------------------------------------------------------->
					<div class="h10">
						<!-- height10 -->
					</div>
					<!-- 작성자명 시작 ------------------------------------------------------------------->
					<div class="clearfix form-group">
						<label for='content' class="col-md-1 form_title">작성자명<span
							class='identify'>*</span></label>
						<div class="col-md-11">
							<input type="text" name="username" id="notice_title" class="form-control" value="${output.username}" disabled />
						</div>
					</div>
					<!-- 제목 끝 ----------------------------------------------------------------->
					<div class="h10">
						<!-- height10 -->
					</div>
					<!-- 작성자명 시작 ------------------------------------------------------------------->
					<div class="clearfix form-group">
						<label for='content' class="col-md-1 form_title">이메일<span
							class='identify'>*</span></label>
						<div class="col-md-11">
							<input type="text" name="mail" id="notice_title" class="form-control" value="${output.email}" disabled />
						</div>
					</div>
					<div class="h10">
						<!-- height10 -->
					</div>
					<!-- 본문작성 시작 ------------------------------------------------------------------->
					<div class="clearfix form-group">
						<label for='content' class="col-md-1 form_title">내용<span
							class='identify'>*</span></label>
						<div class="col-md-11">
							<textarea name="content" id="text_form3" style="resize:none;">${output.content}</textarea>
						</div>
					</div>

					<hr />
					<div class="clearfix form-group">
						<label for='momo' class="col-md-1 form_title">메모 (관리자)</label>
						<div class="col-md-11">
							<textarea name="memo" id="text_form3" style="resize:none;">${output.memo}</textarea>
						</div>
					</div>
					<!-- 버튼 시작 ------------------------------------------------------------------->
					<div class="form-group">
						<div class="btn_right">
							<button type="submit" class="btn btn-danger">수정</button>
							&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath}/admin/admin_qna_list.do" class="btn btn-warning">목록</a>
						</div>
					</div>
					<!-- 버튼 끝 ------------------------------------------------------------------->
				</form>
			</div>
		</div>
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
	<!-- sweetalert 플러그인 참조 -->
	<script src="../assets/plugins/sweetalert/sweetalert2.min.js"></script>
	<script src="../assets/js/validate_admin_notice_write.js"></script>
</body>

</html>