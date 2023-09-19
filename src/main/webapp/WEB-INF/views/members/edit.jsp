<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>회원정보 수정</title>
</head>

<body>
    <h1>회원정보수정</h1>
    <form id="editForm" method="post" action="${pageContext.request.contextPath}/user/edit_ok.do">
    	<% /* action 페이지에서 사용할 WHERE 조건값을 hidden 필드로 숨겨서 전송한다 .*/ %>
    	<input type="hidden" name="userno" value="${output.userno}" />
    	
    	<div>
    		<label for="userpw">비밀번호: </label>
    		<input type="password" name="userpw" id="userpw" />
    	</div>
    	
    	<div>
    		<label for="username">이름: </label>
    		<input type="text" name="username" id="username" value="${output.username}" />
    	</div>
    	
    	<div>
    		<label for="usermail">이메일: </label>
    		<input type="email" name="usermail" id="usermail" value="${output.usermail}" />
    	</div>
    	
    	<div>
    		<label for="usertel">연락처: </label>
    		<input type="tel" name="usertel" id="usertel" value="${output.usertel}" />
    	</div>
    	
    	<div>
    		<label for="birthdate">생년월일: </label>
    		<input type="text" name="birthdate" id="birthdate" value="${output.birthdate}" />
    	</div>
    	
    	<div>
    		<label for="postno">우편번호: </label>
    		<input type="text" name="postno" id="postno" value="${output.postno}" />
    	</div>
    	
    	<div>
    		<label for="address1">주소: </label>
    		<input type="text" name="address1" id="address1" value="${output.address1}" />
    	</div>
    	
    	<div>
    		<label for="address2">상세주소: </label>
    		<input type="text" name="address2" id="address2" value="${output.address2}" />
    	</div>
    	
    	<div>
    		<label for="address2">상세주소: </label>
    		<input type="text" name="address2" id="address2" value="${output.address2}" />
    	</div>
    	
    	<div>
    		<label for="address3">(구)주소: </label>
    		<input type="text" name="address3" id="address3" value="${output.address3}" />
    	</div>
    	
    	
    	
    	<hr />
    	
    	<button type="submit">저장하기</button>
    	<button type="reset">다시작성</button>
    </form>
</body>

</html>