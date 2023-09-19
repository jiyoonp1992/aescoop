<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>4조 이숲</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />

    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

    <!-- 공통 style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/header_ask.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/footer.css" />

    <!-- style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ask.css" />

    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>

    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
</head>




<body>



    <!-- 헤더 영역 시작 -->
    <header>
    <%@ include file= "../index_header.jsp" %>
    </header>
    <!-- 헤더 영역 끝 -->


    <div class="ask_box">
        <div class="ask_box_pd">
            <h1>이숲의 새로운 소식입니다.</h1>
            <h2>공지사항을 확인해주세요</h2>
        </div>
    </div>


	<div class="content">
		<div class="tab_content">
			<h1 class="notice_title">공지사항</h1>
			<div class="nt_title_box clearfix">
				<div class="ntt01 pull-left">제목</div>
				<div class="ntt02 pull-left">${output.title}</div>
			</div>

			<div class="notice_etc_box clearfix">
				<div class="nte01 pull-left">작성일</div>
				<div class="nte02 pull-left">${output.date}</div>
				<div class="nte01 pull-left">조회수</div>
				<div class="nte02 pull-left">${output.view}</div>
			</div>

			<div class="notice_con_box">
				<c:if test="${output.file != null}">
					<div class="notice_img">
						<img alt="공지사항" src="${output.file}">
					</div>
				</c:if>
				${output.content}
			</div>
		</div>
		<div class="notice_btn">
			<button type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/ask/notice'" id="btn-delete">목록</button> 
		</div>
	</div>
	
	
	<div class="h50"></div>






	<!-- 풋터 영역 시작 -->
  <footer>
  <%@ include file= "../index_footer.jsp" %>
  </footer>
  <!-- 풋터 영역 끝 -->





  <!-- Javascript -->
  <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>


</body>
</html>