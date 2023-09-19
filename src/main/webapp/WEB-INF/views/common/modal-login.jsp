<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<body>

	<form id="login-form" method="post" action="${pageContext.request.contextPath}/login_ok">
	<!-- 제목 -->
	<div class="modal-header">
		<!-- 닫기버튼 -->
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h1 class="modal-title" id="myModalLabel">안녕하세요.</h1>
	</div>
	<!-- 내용 -->
	<div class="modal-body">
		<span>이숲에 오신 것을 환영합니다.</span>
		
		<div class="form-group">
			<input type="text" class="form-control" id="userid" placeholder="아이디" name="userid">
		</div>
		<div class="form-group" style="margin-bottom: 0">
			<input type="password" class="form-control" id="userpw" placeholder="패스워드" name="userpw">
		</div>
		<div class="clearfix">
			<a href="${pageContext.request.contextPath}/id_find" class="pull-left">아이디찾기</a>
			<span class="clearfix pull-left">/</span>
			<a href="${pageContext.request.contextPath}/pw_find" class="pull-left">비밀번호찾기</a>
			<a href="${pageContext.request.contextPath}/register" class="pull-right">회원가입</a>
		</div>
	</div>
	
	
    
	<!-- 하단 -->
	<div class="modal-footer">
		<button type="submit" class="btn btn-success">로그인</button>
	</div>

</form>
</body>
</html>