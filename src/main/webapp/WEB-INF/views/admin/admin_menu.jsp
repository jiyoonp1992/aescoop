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
    
</head>

<body>
    <div class="menu_logo"><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/img/logo_white.png"></a></div>
		
		<!-- [공통] 아코디언 영역 - 메뉴 (admin_common.css) -->
		<div class="panel-group" id="accordion">
			<!-- 항목(1) - 상품관리 -->
			<div class="panel panel-default">
				<div class="panel-heading admenu01">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
							상품관리
						</a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse admenu_pn01">
					<div class="panel-body">
						<a href="${pageContext.request.contextPath}/admin/product" id="admenu_a0101">상품리스트</a>
					</div>
				</div>
			</div>
			
			<!-- 항목(2) - 주문관리 -->
			<div class="panel panel-default">
				<div class="panel-heading admenu02">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
							주문관리
						</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse admenu_pn02">
					<div class="panel-body">
						<a href="${pageContext.request.contextPath}/admin/order_list" id="admenu_a0201">주문목록</a>
					</div>
				</div>
			</div>
			
			<!-- 항목(3) - 회원관리 -->
			<div class="panel panel-default">
				<div class="panel-heading admenu03">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
							회원관리
						</a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse admenu_pn03">
					<div class="panel-body">
						<a href="${pageContext.request.contextPath}/admin/mem_list" id="admenu_a0301">회원목록</a>
						<a href="${pageContext.request.contextPath}/admin/mem_out" id="admenu_a0302">탈퇴회원</a>
					</div>
				</div>
			</div>
			
			<!-- 항목(4) - 게시판관리 -->
			<div class="panel panel-default">
				<div class="panel-heading admenu04">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
							게시판관리
						</a>
					</h4>
				</div>
				<div id="collapseFour" class="panel-collapse collapse admenu_pn04">
					<div class="panel-body">
						<a href="${pageContext.request.contextPath}/admin/admin_notice_list.do" id="admenu_a0401">게시물관리</a>
					</div>
				</div>
			</div>
		</div>
		
	<div class="portfolio_text">
		이 사이트는 학생들이 취업을 위해 제작한 포트폴리오 사이트입니다.
		<br><br>
		추가 문의는 jiyoonp92@naver.com, songsong8040@gmail.com으로 부탁드립니다.
	</div>
</body>

</html>