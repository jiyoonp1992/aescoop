<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8" />
	<title>4조 이숲 관리자</title>
	
	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon"
		href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
	<link rel="apple-touch-icon-precomposed"
		href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />
	
	<!-- bootstrap -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
	
	<!-- 공통 style -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/assets/css/admin_common.css" />
	
	<!-- sweetalert style -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />
	
	<!-- 개별 style -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/assets/css/admin_prod_list.css" />
	
	
	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	
	<!-- 웹 폰트 -->
	<link
		href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
		rel="stylesheet">
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	
	<!-- 체크박스 다중 삭제 -->
	<script type="text/javascript">
		$(function() {
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
	
			$("input[name='allCheck']").click(function() {
				var chk_listArr = $("input[name='RowCheck']");
				for (var i = 0; i < chk_listArr.length; i++) {
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function() {
				if ($("input[name='RowCheck']:checked").length == rowCnt) {
					$("input[name='allCheck']")[0].checked = true;
				} else {
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue() {
			var url = "${pageContext.request.contextPath}/admin/product_delete_ok.do"; // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
					valueArr.push(list[i].value);
				}
			}
			if (valueArr.length == 0) {
				alert("선택된 글이 없습니다.");
			} else {
				var chk = confirm("정말 삭제하시겠습니까?");
				if (chk == true) {
					$
							.ajax({
								url : url, // 전송 URL
								type : 'POST', // GET or POST 방식
								traditional : true,
								data : {
									valueArr : valueArr
								// 보내고자 하는 data 변수 설정
								},
								success : function(json) {
									if (json = 1) {
										alert("삭제가 완료되었습니다.");
										window.location = "${pageContext.request.contextPath}/admin/product";
									} else {
										alert("삭제를 실패하였습니다.");
									}
								}
							});
				} else {
					alert("삭제를 취소하였습니다.");
				}
			}
		}
	</script>
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
			<div class="title">상품리스트</div>

			<!-- 조건 검색 및 분류 -->
			<div class="search_box">
				<!-- [공통] (admin_common.css) -->
				<!-- [공통] 탭 버튼 구성 (admin_common.css) -->
				<form action="${pageContext.request.contextPath}/admin/product">
			    		<div class="sc_title pull-left">진행상태</div>
			    	<div class="status_bt">
				    	<input type="submit" name="category" value="전체보기" <c:if test="${category == '전체보기' || category == ''}"> class="status_active"</c:if> />
				    	<input type="submit" name="category" value="스킨" <c:if test="${category == '스킨'}"> class="status_active"</c:if> />
				    	<input type="submit" name="category" value="헤어" <c:if test="${category == '헤어'}"> class="status_active"</c:if> />
				    	<input type="submit" name="category" value="바디&핸드" <c:if test="${category == '바디&핸드'}"> class="status_active"</c:if> />
				    	<input type="submit" name="category" value="향수" <c:if test="${category == '향수'}"> class="status_active"</c:if> />
				    	<input type="submit" name="category" value="홈" <c:if test="${category == '홈'}"> class="status_active"</c:if> />
			    	</div>
                </form>


				<!-- 조건 검색 -->
				<div class="c_search clearfix">
				
				
					<!-- 타이틀 -->
					
					<form method="get" action="${pageContext.request.contextPath}/admin/product">
					
						<div class="sc_title pull-left">조건검색</div>
	
						<!-- 폼(1) - 분류 -->
						<div class="form-group pull-left">
							<select name="prod_view2" id="prod_view" class="form-control pull-left">
								<option value="">전체</option>
								<option value="Y" <c:if test="${prod_view2 == 'Y'}">selected</c:if>>노출</option>
								<option value="N" <c:if test="${prod_view2 == 'N'}">selected</c:if>>숨김</option>
							</select>
						</div>
	
						<!-- 폼(2) - 상품명/상품코드 -->
						<div class="form-group pull-left">
							<select name="prod_view" id="prod_view" class="form-control pull-left">
								<option value="pname" <c:if test="${prod_view == 'pname'}">selected</c:if>>상품명</option>
	                     		<option value="prodno" <c:if test="${prod_view == 'prodno'}">selected</c:if>>상품코드</option>
							</select>
						</div>
	
						<!-- 폼(3) - 검색창 -->
							<div class="form-group pull-left">
								<input type="search" name="keyword" id="keyword" class="form-control"
									value="${keyword}">
							</div>
						
	
						<!-- 버튼 -->
						<div class="pull-left">
							<button type="submit" class="btn btn-success">검색</button>
						</div>
					</form>
				</div>
				
			</div>
			
			<div class="h30"></div>

			<!-- 탭 페이지 구성(단일페이지) -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane fade in active" id="dept">
					<!-- 상단 버튼 -->
					<div class="clearfix btn-pd">
						<!-- <button type="submit" class="btn btn-danger pull-left">상품삭제</button> -->
						<button type="submit" class="btn btn-danger pull-left" onclick="deleteValue();">상품삭제</button>
						<a href="${pageContext.request.contextPath}/admin/admin_prod_register.do"
							class="btn btn-warning pull-right">상품등록</a>
					</div>

					<!-- 제품리스트 테이블 시작 -->
					<table class="prod_table" border="0" cellspacing="0" cellpadding="0">
						<tr class="tr_header">
							<td width="4%">
								<div class="form-group">
									<input type="checkbox" name="allCheck" id="td_check_all" class="form-control" value="check_all">
								</div>
							</td>
							<td width="20%">상품코드</td>
							<td width="13%">이미지</td>
							<td>상품명</td>
							<td width="15%">금액</td>
							<td width="10%">상태</td>
							<td width="12%">기능</td>
						</tr>


						<c:choose>
							<%-- 조회결과가 없는 경우 --%>
							<c:when test="${output == null || fn:length(output) == 0}">
								<tr class="tr_body">
									<td  colspan="9" align="center">조회결과가 없습니다.</td>
								</tr>
							</c:when>
							<%-- 조회결과가 있는  경우 --%>
							<c:otherwise>
								<%-- 조회 결과에 따른 반복 처리 --%>
								<c:forEach var="item" items="${output}" varStatus="status">
									<%-- 출력을 위해 준비한 제품이름 변수 --%>
									<c:set var="pname" value="${item.pname}" />

									<tr class="tr_body">
										<td>
				                                <div class="form-group">
				                                    <input type="checkbox" name="RowCheck" id="RowCheck" class="form-control" value="${item.prodno}">
				                                </div>
				                            </td>
										<td><a href="${pageContext.request.contextPath}/admin/admin_prod_view?prodno=${item.prodno}">${item.prodno}</a></td>
										<td><a href="${pageContext.request.contextPath}/admin/admin_prod_view?prodno=${item.prodno}"><img
												src="${item.file}"></a></td>
										<td><a href="${pageContext.request.contextPath}/admin/admin_prod_view?prodno=${item.prodno}">${item.pname}</a></td>
										<td><fmt:formatNumber pattern="###,###,###" value="${item.price}" /></td>
										<td>
											<c:if test="${item.is_view == 'Y'}">노출</c:if>
											<c:if test="${item.is_view == 'N'}">숨김</c:if>
										</td>
										<td>
				                                <a href="${pageContext.request.contextPath}/admin/admin_prod_view?prodno=${item.prodno}" class="btn btn-warning">상세보기</a>&nbsp;

										</td>
									</tr>

								</c:forEach>
							</c:otherwise>
						</c:choose>



					</table>
					<!-- 제품리스트 테이블 끝 -->



					<!-- 페이지 번호 표시(페이지네이션) 시작 -->
					<div class="pagination_center">
						<ul class="pagination">

							<%-- 페이지 번호 구현 --%>
							<%-- 이전 그룹에 대한 링크 --%>
							<c:choose>
								<%--    이전 그룹으로 이동 가능하다면? --%>
								<c:when test="${pageData.prevPage > 0}">
									<%--  이동할 URL 생성 --%>
									<c:url value="/admin/product?category=${category}"
										var="prevPageUrl">
										<c:param name="page" value="${pageData.prevPage}" />
										<c:param name="keyword" value="${keyword}" />
										<c:param name="prod_view2" value="${prod_view2}" />
									</c:url>
									<li><a href="${prevPageUrl}">&laquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a>&laquo;</a></li>
								</c:otherwise>
							</c:choose>

							<%--  페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
							<c:forEach var="i" begin="${pageData.startPage}"
								end="${pageData.endPage}" varStatus="status">
								<%-- 이동할 URL 생성 --%>
								<c:url value="/admin/product?category=${category}" var="pageUrl">
									<c:param name="page" value="${i}" />
									<c:param name="keyword" value="${keyword}" />
									<c:param name="prod_view2" value="${prod_view2}" />
								</c:url>

								<%-- 페이지 번호 출력 --%>
								<c:choose>
									<%--  현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
									<c:when test="${pageData.nowPage == i}">
										<li class="active"><a><strong>${i}</strong></a></li>
									</c:when>
									<%-- 나머지 페이지의 경우 링크 적용함 --%>
									<c:otherwise>
										<li><a href="${pageUrl}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<%-- 다음 그룹에 대한 링크 --%>
							<c:choose>
								<%-- 다음 그룹으로 이동 가능하다면? --%>
								<c:when test="${pageData.nextPage > 0}">
									<%-- 이동할 URL 생성 --%>
									<c:url value="/admin/product?category=${category}"
										var="nextPageUrl">
										<c:param name="page" value="${pageData.nextPage}" />
										<c:param name="keyword" value="${keyword}" />
										<c:param name="prod_view2" value="${prod_view2}" />
									</c:url>
									<li><a href="${nextPageUrl}">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a>&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- 페이지 번호 표시(페이지네이션) 끝 -->



				</div>
				<!-- tab-pane 끝 -->
			</div>
			<!-- tab-content 끝 -->
		</div>
		<!-- content_pd 끝 -->
	</div>
	<!-- content 끝 -->



	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>


</body>
</html>