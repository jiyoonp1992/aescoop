<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_prod_write.css" />


    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>

    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
    <!-- 다음 주소 API -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/address.js"></script>

	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
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
			<div class="title">상품수정</div>
			
			<!-- 조건 검색 및 분류 -->
			<div class="write_box"><!-- [공통] (admin_common.css) -->
			
				<form class="form_box" name="prod_add_form" id="prod_add_form" method="post" action="${pageContext.request.contextPath}/admin/admin_prod_edit" enctype="multipart/form-data">
					
					<!-- 카테고리 시작 ----------------------------------------------------------------->
					<div class="clearfix form-pd">

						<!-- 타이틀 -->
						<label for='category' class="col-md-1 form_title pull-left">카테고리
							<span class='identify'>*</span>
						</label>

						<!-- 2차 카테고리 -->
						<div class="form-group pull-left pd_right">
							<select id="subcateno" class="form-control" name="subcateno">
								<option value="" <c:if test="${output.subcateno == ''}">selected</c:if>>:: 분류 ::</option>
								<option value="11" <c:if test="${output.subcateno == '11'}">selected</c:if>>클렌저</option>
								<option value="12" <c:if test="${output.subcateno == '12'}">selected</c:if>>트리트먼트 & 마스크</option>
								<option value="13" <c:if test="${output.subcateno == '13'}">selected</c:if>>토너</option>
								<option value="14" <c:if test="${output.subcateno == '14'}">selected</c:if>>립 & 아이</option>
								<option value="15" <c:if test="${output.subcateno == '15'}">selected</c:if>>선케어 / SPF</option>
								<option value="21" <c:if test="${output.subcateno == '21'}">selected</c:if>>샴푸</option>
								<option value="22" <c:if test="${output.subcateno == '22'}">selected</c:if>>컨디셔너</option>
								<option value="23" <c:if test="${output.subcateno == '23'}">selected</c:if>>트리트먼트</option>
								<option value="31" <c:if test="${output.subcateno == '31'}">selected</c:if>>핸드</option>
								<option value="32" <c:if test="${output.subcateno == '32'}">selected</c:if>>바디</option>
								<option value="33" <c:if test="${output.subcateno == '33'}">selected</c:if>>퍼스널</option>
								<option value="41" <c:if test="${output.subcateno == '41'}">selected</c:if>>향수</option>
								<option value="51" <c:if test="${output.subcateno == '51'}">selected</c:if>>홈 케어</option>
								<option value="52" <c:if test="${output.subcateno == '52'}">selected</c:if>>문학</option>
							</select>
						</div>

					</div>
					<!-- 카테고리 끝 ----------------------------------------------------------------->
			        <div class="h10"><!-- height10 --></div>
			        
			        
			        
					<!-- 제품코드 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='prodno' class="col-md-1 form_title">제품코드 <span class='identify'>*</span></label>
			            <div class="col-md-11">
			                <input type="text" name="prodno" id="prodno" class="form-control" value="${output.prodno}" readonly/>
			            </div>
			        </div>
			        <!-- 제품코드 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
					<!-- 제품명 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='pname' class="col-md-1 form_title">제품명 <span class='identify'>*</span></label>
			            <div class="col-md-11">
			                <input type="text" name="pname" id="pname" class="form-control" value="${output.pname}"/>
			            </div>
			        </div>
			        <!-- 제품명 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 가격 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='price' class="col-md-1 form_title">가격 <span class='identify'>*</span></label>
			            <div class="col-md-11">
			                <input type="text" name="price" id="price" class="form-control" value="${output.price}"/>
			            </div>
			        </div>
			        <!-- 가격 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 사이즈 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='size' class="col-md-1 form_title">사이즈 <span class='identify'>*</span></label>
			            <div class="col-md-11">
			                <input type="text" name="size" id="size" class="form-control" value="${output.size}"/>
			            </div>
			        </div>
			        <!--  사이즈 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 재고 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='stock' class="col-md-1 form_title">재고 <span class='identify'>*</span></label>
			            <div class="col-md-11">
			                <input type="text" name="stock" id="stock" class="form-control" value="${output.stock}"/>
			            </div>
			        </div>
			        <!-- 재고 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 피부타입 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='skintype' class="col-md-1 form_title">타입 </label>
			            <div class="col-md-11">
			                <input type="text" name="skintype" id="skintype" class="form-control" value="${output.skintype}"/>
			            </div>
			        </div>
			        <!-- 피부타입 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        
			        <!-- 상품특징 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='feels' class="col-md-1 form_title">사용감 </label>
			            <div class="col-md-11">
			                <input type="text" name="feels" id="feels" class="form-control" value="${output.feels}"/>
			            </div>
			        </div>
			        <!-- 상품특징 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 사용횟수 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='amount' class="col-md-1 form_title">사용횟수</label>
			            <div class="col-md-11">
			                <input type="text" name="amount" id="amount" class="form-control" value="${output.amount}"/>
			            </div>
			        </div>
			        <!-- 사용횟수 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 텍스쳐 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='texture' class="col-md-1 form_title">질감 </label>
			            <div class="col-md-11">
			                <input type="text" name="texture" id="texture" class="form-control" value="${output.texture}"/>
			            </div>
			        </div>
			        <!-- 텍스쳐 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 주요성분 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='ingredient' class="col-md-1 form_title">주요성분 </label>
			            <div class="col-md-11">
			                <input type="text" name="ingredient" id="ingredient" class="form-control" value="${output.ingredient}"/>
			            </div>
			        </div>
			        <!-- 주요성분 끝 ----------------------------------------------------------------->
			        
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 향 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='scent' class="col-md-1 form_title">향 </label>
			            <div class="col-md-11">
			                <input type="text" name="scent" id="scent" class="form-control" value="${output.scent}"/>
			            </div>
			        </div>
			        <!-- 향 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			         <!-- 용법 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='directions' class="col-md-1 form_title">용법 </label>
			            <div class="col-md-11 radio-pd">
							<textarea name="directions" id="text_form" style="resize:none;">${output.directions}</textarea>
			            </div>
			        </div>
			        <!-- 용법 끝 ----------------------------------------------------------------->
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 파일첨부 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='photo' class="col-md-1 form_title">목록이미지 <span class='identify'>*</span></label>
			            <img src="${output.file}" width="30%" />
			        </div>
			        <!-- 파일첨부 끝 ----------------------------------------------------------------->
			        
			        <!-- 파일첨부 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='photo' class="col-md-1 form_title">상세이미지 <span class='identify'>*</span></label>
			            <img src="${output.file2}" width="30%" />
			        </div>
			        <!-- 파일첨부 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
					 <!-- 노출여부 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='is_view' class="col-md-1 form_title">노출 여부 <span class='identify'>*</span></label>
			            <div class="col-md-11 radio-pd">
			                <label>
			                    <input type='radio' name='is_view' id='is_view' value='Y'<c:if test="${output.is_view == 'Y'}">checked</c:if>> Y</label>&nbsp;&nbsp;
			                <label>
			                    <input type='radio' name='is_view' id='is_view' value='N'<c:if test="${output.is_view == 'N'}">checked</c:if>> N</label>
			            </div>
			        </div>
			        <!-- 노출여부 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			         <!-- 내용 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='prod_show' class="col-md-1 form_title">내용 <span class='identify'>*</span></label>
			            <div class="col-md-11 radio-pd">
							<textarea name="content" id="text_form" style="resize:none;">${output.content}</textarea>
			            </div>
			        </div>
			        <!-- 내용 끝 ----------------------------------------------------------------->
			        
			        <div class="h30"><!-- height30 --></div>
					
			        <!-- 버튼 시작 ------------------------------------------------------------------->
			        <div class="form-group">
			            <div class="btn_right">
							<button type="submit" class="btn btn-danger">수정</button>&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath}/admin/product" class="btn btn-warning">목록</a>
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
