<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>4조 이숲 관리자</title>
    
    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />

    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

    <!-- 공통 style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_common.css" />

    <!-- sweetalert style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.css" />

    <!-- 개별 style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_order_view.css" />


    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>

    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
    <!-- 다음 주소 API -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/address.js"></script>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
	<!-------------------------------------------- 메뉴 -------------------------------------------->
	<div id="menu" class="pull-left">
		<!-- [공통] 로고 (admin_common.css) -->
		<%@ include file="admin_menu.jsp" %>
		<!--// 아코디언 영역 -->
	</div>
	
	<!-------------------------------------------- 내용 -------------------------------------------->
	<div id="content" class="pull-left">
		<div id="content_pd">
		
			<!-- 우측 상단 버튼 (admin_common.css) -->
			<div class="btn_right">
				<a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-info">LOGOUT</a>&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}" class="btn btn-info">HOME</a>
			</div>
			
			<!-- [공통] 타이틀 (admin_common.css) -->
			<div class="title">상품등록</div>
			
			<!-- 조건 검색 및 분류 -->
			<div class="write_box"><!-- [공통] (admin_common.css) -->
				<form class="form_box" name="prod_add_form" id="prod_add_form" method="post" action="${pageContext.request.contextPath}/admin/order_edit_ok">
					
					<table style="margin-bottom: 15px;">
						<thead style="background-color: #A48973; border-top: 1.5px solid #444;">
							<tr height="28" style="border-top: 1.5px solid #444;">
								<th style="color: #fff;">상품코드</th>
								<th style="color: #fff;" width="50%">상품명</th>
								<th style="color: #fff;">상품가격</th>
								<th style="color: #fff;">옵션</th>
								<th style="color: #fff;">수량</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${output_prod}" varStatus="status">
								<tr height="70">
									<td>${item.prodno}</td>
									<td>${item.pname}</td>
									<td><fmt:formatNumber pattern="###,###,###" value="${item.price}" /></td>
									<td>${item.size}</td>
									<td>${item.amount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<table class="tprice_table">
						<tr>
							<td class="td_title">총 결제금액</td>
							<td class="td_con"><fmt:formatNumber pattern="###,###,###" value="${output.tprice}" />원</td>
						</tr>
					</table>
					
					<!-- 주문번호, 주문일자 ----------------------------------------------------------------->
					<div class="clearfix form-pd">
					
						<div class="form-group pull-left width49">
							<label for="orderno" class="form_title">주문번호 <span class='identify'>*</span></label>
							<input type="text" class="form-control" name="orderno" id="orderno" value="${output.orderno}" readonly>
						</div>
						
						<div class="pull-left width2"></div>

						<div class="form-group pull-left width49"">
							<label for="paid" class="form_title">주문일자 <span class='identify'>*</span></label>
							<input type="text" class="form-control" name="paid" id="paid" value="${output.paid}" readonly>
						</div>

					</div>
					
					<div class="h10"><!-- height10 --></div>
					
					<!-- 처리상태, 요청사항 ----------------------------------------------------------------->
					<div class="clearfix form-pd">
						<div class="form-group pull-left width49">
									<label for="orderstatus" class="form_title">처리상태 <span class='identify'>*</span></label>
                                    <select name="orderstatus" id="orderstatus" class="form-control">
	                                	<option value="결제완료" <c:if test="${output.orderstatus == '결제완료'}">selected</c:if>>결제완료</option>
										<option value="배송준비중" <c:if test="${output.orderstatus == '배송준비중'}">selected</c:if>>배송준비중</option>
										<option value="발송완료" <c:if test="${output.orderstatus == '발송완료'}">selected</c:if>>발송완료</option>
										<option value="배송완료" <c:if test="${output.orderstatus == '배송완료'}">selected</c:if>>배송완료</option>
										<option value="취소요청중" <c:if test="${output.orderstatus == '취소요청중'}">selected</c:if>>취소요청중</option>
										<option value="취소완료" <c:if test="${output.orderstatus == '취소완료'}">selected</c:if>>취소완료</option>
	                                </select>
                                </div>
						
						<div class="pull-left width2"></div>

						<div class="form-group pull-left width49"">
							<label for="requirement" class="form_title">요청사항 <span class='identify'>*</span></label>
							<input type="text" class="form-control" name="requirement" id="requirement" value="${output.requirement}">
						</div>

					</div>
					
					<div class="h30"><!-- height10 --></div>
					
					<!--처리시간시작-->

					<table class="tbpd">
						<tr>
							<td width="19%" style="background-color: #A48973; color: #fff;"><b>처리시간 <span class="identify2">*</span></b></td>
							<td width="27%"><b>결제완료</b><br>${output.paid}</td>
							<td width="27%"><b>발송완료</b><br>${output.shipped}</td>
							<td width="27%"><b>주문취소</b><br>${output.cancel}</td>
						</tr>
					</table>
					
					<div class="h10"><!-- height10 --></div>
					
					<!-- 이름, 연락처 ----------------------------------------------------------------->
					<div class="clearfix form-pd">
					
						<div class="form-group pull-left width49">
							<label for="username" class="form_title">이름 <span class='identify'>*</span></label>
							<input type="text" class="form-control" name="username" id="username" value="${output.username}">
						</div>
						
						<div class="pull-left width2"></div>

						<div class="form-group pull-left width49"">
							<label for="usertel" class="form_title">연락처 <span class='identify'>*</span></label>
							<input type="text" class="form-control" name="usertel" id="usertel" value="${output.usertel}">
						</div>

					</div>
					
					<div class="h10"><!-- height10 --></div>
					
					<!-- 우편번호, 주소 ----------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='prod_price' class="pull-left form_title">
			            	주소 <span class='identify'>*</span>&nbsp;&nbsp;&nbsp;<input type="button" onclick="sample6_execDaumPostcode()" class="btn-success post_bt" value="우편번호 찾기">
			            </label>
			        </div>
			        
			        <div class="clearfix form-group">
			            <div class="form-group pull-left width49">
							<input type="text" id="postno" name="postno" class="form-control pull-left mg_3_5" placeholder="우편번호" value="${output.postno}"><br>
							<input type="text" id="address1" name="address1" class="form-control" placeholder="주소" value="${output.address1}">							
						</div>
						
						<div class="pull-left width2"></div>

						<div class="form-group pull-left width49"">
							<input type="text" id="address2" name="address2" class="form-control mg_3_5" placeholder="상세주소1" value="${output.address2}">
							<input type="text" id="address3" name="address3" class="form-control" placeholder="상세주소1" value="${output.address3}">
						</div>
			        </div>

					
					<div class="h30"><!-- height10 --></div>
			        
			        <!-- 버튼 시작 ------------------------------------------------------------------->
			        <div class="form-group">
			            <div class="btn_right">
							<button type="submit" class="btn btn-danger">수정</button>&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath}/admin/order_list" class="btn btn-warning">목록</a>
						</div>
			        </div>
			        <!-- 버튼 끝 ------------------------------------------------------------------->
			    </form>
			</div>
			
		</div><!-- content_pd 끝 -->
	</div><!-- content 끝 -->



	<!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    
    <!-- AjaxHelper -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    
    <!-- handlebar plugin -->
    <script src="${pageContext.request.contextPath}/assets/plugins/handlebars/handlebars-v4.0.11.js"></script>
    
    <!-- sweetalert 플러그인 참조 -->
    <script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/js/validate_admin_prod_write.js"></script>
    
    
</body>
</html>