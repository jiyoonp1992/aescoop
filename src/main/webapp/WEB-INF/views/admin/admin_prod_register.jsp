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

	<!-- 개별 style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_prod_write.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />
	
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
	
	<!-- 웹 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
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
				<a href="admin_login.html" class="btn btn-info">LOGOUT</a>&nbsp;&nbsp;
				<a href="../index.html" class="btn btn-info">HOME</a>
			</div>
			
			<!-- [공통] 타이틀 (admin_common.css) -->
			<div class="title">상품등록</div>
			
			<!-- 조건 검색 및 분류 -->
			<div class="write_box"><!-- [공통] (admin_common.css) -->
				<form method="post" action="${pageContext.request.contextPath}/admin/admin_prod_register_ok.do" class="form_box" name="prod_add_form" id="prod_add_form" enctype="multipart/form-data">
					
					<!-- 카테고리 시작 ----------------------------------------------------------------->
					<div class="clearfix form-pd">
					
						<!-- 타이틀 -->
						<label for='category' class="col-md-1 form_title pull-left">카테고리 <span class='identify'>*</span></label>

						<!-- 1차 카테고리 -->
			<div class="form-group pull-left">
            	<select name="category" id="category" class="form-control" onchange="set_cat(this.value);" >
                	<%-- 조회 결과에 따른 반복 처리 --%>
                	<c:forEach var="item" items="${output2}" varStatus="status">
                    	<option value="${item.cateno}">${item.category}</option>
                	</c:forEach>
           		 </select>
       		 </div>
							
       		<div class="form-foutp pull-left">
       			<select id="sub_category" name="sub_category" class="form-control">
       			</select>
       		</div>

					</div>
					<!-- 카테고리 끝 ----------------------------------------------------------------->
					
					<div class="h10"><!-- height10 --></div>
					
					<!-- 상품명 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='prod_name' class="col-md-1 form_title">제품명 <span class='identify'>*</span></label>
			            <div class="col-md-11">
			                <input type="text" name="pname" id="pname" class="form-control" />
			            </div>
			        </div>
			        <!-- 상품명 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 판매가 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='prod_price' class="col-md-1 form_title">판매가 <span class='identify'>*</span></label>
			            <div class="col-md-11">
			                <input type="text" name="price" id="price" class="form-control" />
			            </div>
			        </div>
			        <!-- 판매가 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 용량 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='size' class="col-md-1 form_title">용량 <span class='identify'>*</span></label>
			            <div class="col-md-11">
			                <input type="text" name="size" id="size" class="form-control" />
			            </div>
			        </div>
			        <!-- 용량 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 피부타입 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='skintype' class="col-md-1 form_title">타입 </label>
			            <div class="col-md-11">
			                <input type="text" name="skintype" id="skintype" class="form-control" />
			            </div>
			        </div>
			        <!-- 피부타입 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 사용감 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='feels' class="col-md-1 form_title">사용감 </label>
			            <div class="col-md-11">
			                <input type="text" name="feels" id="feels" class="form-control" />
			            </div>
			        </div>
			        <!-- 사용감 끝 ----------------------------------------------------------------->
  
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 재고 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='stock' class="col-md-1 form_title">재고 <span class='identify'>*</span></label>
			            <div class="col-md-11">
			                <input type="text" name="stock" id="stock" class="form-control" />
			            </div>
			        </div>
			        <!-- 재고 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 사용횟수 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='amount' class="col-md-1 form_title">사용횟수</label>
			            <div class="col-md-11">
			                <input type="text" name="amount" id="amount" class="form-control" />
			            </div>
			        </div>
			        <!-- 재고 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 질감 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='질감' class="col-md-1 form_title">질감 </label>
			            <div class="col-md-11">
			                <input type="text" name="texture" id="texture" class="form-control" />
			            </div>
			        </div>
			        <!-- 질감 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 주요성분 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='ingredient' class="col-md-1 form_title">주요성분 </label>
			            <div class="col-md-11">
			                <input type="text" name="ingredient" id="ingredient" class="form-control" />
			            </div>
			        </div>
			        <!-- 주요성분 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 향 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='scent' class="col-md-1 form_title">향</label>
			            <div class="col-md-11">
			                <input type="text" name="scent" id="scent" class="form-control" />
			            </div>
			        </div>
			        <!-- 향 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 향 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='directions' class="col-md-1 form_title">용법 </label>
			            <div class="col-md-11">
			                <textarea name="directions" id="text_form" style="resize:none;"></textarea>
			            </div>
			        </div>
			        <!-- 향 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 노출여부 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='is_view' class="col-md-1 form_title">노출 여부 <span class='identify'>*</span></label>
			            <div class="col-md-11 radio-pd">
			                <label>
			                    <input type='radio' name='is_view' id='is_view' value='Y'> Y</label>&nbsp;&nbsp;
			                <label>
			                    <input type='radio' name='is_view' id='is_view' value='N'> N</label>
			            </div>
			        </div>
			        <!-- 노출여부 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>

					<!-- 파일첨부 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='list_img' class="col-md-1 form_title">목록이미지 <span class='identify'>*</span></label>
			            <div class="col-md-11">
			                <input type="file" name="photo" id="list_img" multiple/>
			            </div>
			        </div>
			        <!-- 파일첨부 끝 ----------------------------------------------------------------->
			        
			        <div class="h10"><!-- height10 --></div>
			        
			        <!-- 파일첨부 시작 ------------------------------------------------------------------->
			        <div class="clearfix form-group">
			            <label for='list_img' class="col-md-1 form_title">상세이미지 <span class='identify'>*</span></label>
			            <div class="col-md-11">
			                <input type="file" name="photo" id="list_img" multiple/>
			            </div>
			        </div>
			        <!-- 파일첨부 끝 ----------------------------------------------------------------->
			        
			        <div class="h20"><!-- height20 --></div>
			        
			        <!-- 설명 시작 ------------------------------------------------------------------->
			        
			        <div class="clearfix form-group">
			            <label for='list_img' class="col-md-1 form_title">내용 <span class='identify'>*</span></label>
			            <div class="col-md-11">
			            	<textarea name="content" id="text_form" style="resize:none;"></textarea>
			            </div>
			        </div>
			        <!-- 설명 끝 ----------------------------------------------------------------->
					
					<div class="h30"><!-- height10 --></div>
			        
			        <!-- 버튼 시작 ------------------------------------------------------------------->
			        <div class="form-group">
			            <div class="btn_right">
							<button type="submit" class="btn btn-danger">확인</button>&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath}/admin/product" class="btn btn-warning">취소</a>
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
      
    
    <!-- Ajax로 읽어온 내용을 출력하는데 사용될 HTML 템플릿 -->
    <script id="category_item_tmpl" type="text/x-handlebars-template">
		{{#each item}}
			<option value="{{value}}">{{text}}</option>
		{{/each}}
	</script>

	<!-- 멀티 드롭다운 구현 Javascript -->
	<script type="text/javascript">
	set_cat(5);
		$(function() {
			/** 드롭다운의 선택 변경 이벤트 */
			$("#parent").change(function() {
				// 결과가 표시될 #child에 내용 지우기
				$("#child").empty();
				// 사용자 선택값 가져오기
				var choice = $(this).find("option:selected").val();
				// 선택값이 없다면 처리 중단
				if(!choice) {
					return false;
				}
				
				$.get('../api/category.do', { type: choice }, function(req) {
					// 미리 준비한 HTML틀을 읽어온다.
					var template = Handlebars.compile($("#category_item_tmpl").html());
					// Ajax를 통해서 읽어온 JSON을 템플릿에 병합한다.
					var html = template(req);
					// #child 읽어온 내용을 추가한다.
					$("#child").append(html);
				});	// end $.get
			});	// end change
		});
		
		function set_cat(aa){
			
		
			var hh = "";
			hh+="<option value=''>선택해주세요</option>";
			if(aa == 1){
				hh+="<option value='11'>클렌저</option>";
				hh+="<option value='12'>트리트먼트 & 마스크</option>";
				hh+="<option value='13'>토너</option>";
				hh+="<option value='14'>립 & 아이</option>";
				hh+="<option value='15'>선케어 / SPF</option>";
			} else if(aa == 2){
				hh+="<option value='21'>샴푸</option>";
				hh+="<option value='22'>컨디셔너</option>";
				hh+="<option value='23'>트리트먼트</option>";
			} else if(aa == 3) {
				hh+="<option value='31'>핸드</option>";
				hh+="<option value='32'>바디</option>";
				hh+="<option value='33'>퍼스널</option>";
			} else if(aa == 4) {
				hh+="<option value='41'>향수</option>";
			} else if(aa == 5 || aa == "") {
				hh+="<option value='51'>홈 케어</option>";
				hh+="<option value='52'>문학</option>";
			}
			
			$("#sub_category").html(hh);
			
		}
	</script>
</body>
</html>