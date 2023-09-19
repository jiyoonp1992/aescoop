<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-144-precomposed.png" />
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css" />
<!-- 공통 style -->
<link rel="stylesheet" type="text/css" href="../assets/css/admin_common.css" />

<!-- 개별 style -->
<link rel="stylesheet" type="text/css" href="../assets/css/admin_notice_list.css" />
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="../assets/js/jquery.min.js"></script>
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
			var url = "${pageContext.request.contextPath}/admin/notice_delete_ok.do"; // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
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
										window.location = "${pageContext.request.contextPath}/admin/admin_notice_list.do";
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
			<div class="title">공지사항</div>
			<!-- 조건 검색 및 분류 -->
			<div class="search_box">
				<ul class="nav nav-pills" id="mytab">
					<li><a href="${pageContext.request.contextPath}/admin/admin_notice_list.do" class="active">공지사항</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/admin_qna_list.do">Q&A</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/admin_review_list.do">Review</a></li>
				</ul>
			
				
				<div class="c_search clearfix">

                    <!-- 타이틀 -->
                    
                    <form method="get" action="${pageContext.request.contextPath}/admin/admin_notice_list.do">
                    
                    <div class="sc_title pull-left">조건검색</div>

                    <!-- 폼(1) - 분류 -->
                    <div class="form-group pull-left">
                        <select name="prod_view" id="prod_view" class="form-control pull-left" >
                            <option value="title"<c:if test="${notice_view == 'title'}">selected</c:if>>제목</option>
                            <option value="content"<c:if test="${notice_view == 'content'}">selected</c:if>>내용</option>
                        </select>
                    </div>



                    <!-- 폼(3) - 검색창 -->
                    
                    
                    <div class="form-group pull-left">
                        <input type="search" name="keyword" id="keyword" class="form-control" value="${keyword}">
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
				
					<div class="clearfix btn-pd" style="padding-bottom: 17px;">
                        <button type="submit" class="btn btn-danger pull-left" onclick="deleteValue();">게시물삭제</button>
						<a href="${pageContext.request.contextPath}/admin/admin_notice_write.do" class="btn btn-warning pull-right">글쓰기</a>
                    </div>
                    
					<!-- 제품리스트 테이블 시작 -->
					<table class="prod_table">
						<tr class="tr_header">
							<td width="4%">
								<div class="form-group">
									<input type="checkbox" name="allCheck" id="td_check_all" class="form-control" value="check_all">
								</div>
							</td>
							<td width="8%">게시글번호</td>
							<td>제목</td>
							<td width="12%">기능</td>
						</tr>
						
						<tbody>
							<c:choose>
								<%-- 조회결과가 없는 경우 --%>
								<c:when test="${output == null || fn:length(output) == 0}">
									<tr class="tr_body">
										<td colspan="4" align="center">조회결과가 없습니다.</td>
									</tr>
								</c:when>
								<%-- 조회결과가 있는  경우 --%>
								<c:otherwise>
									<%-- 조회 결과에 따른 반복 처리 --%>
									<c:forEach var="item" items="${output}" varStatus="status">
										<%-- 출력을 위해 준비한 교수이름 변수 --%>
										<c:set var="title" value="${item.title}" />

										<%-- 검색어가 있다면? --%>
										<c:if test="${keyword != ''}">
											<%-- 검색어에 <mark> 태그를 적용하여 형광팬 효과 준비 --%>
											<c:set var="mark" value="<mark>${keyword}</mark>" />
											<%-- 출력을 위해 준비한 교수이름에서 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
											<c:set var="title"
												value="${fn:replace(title, keyword, mark)}" />
										</c:if>

										<%-- 상세페이지로 이동하기 위한 URL --%>
										<c:url value="/admin/admin_notice_view.do" var="viewUrl">
											<c:param name="notino" value="${item.notino}" />
										</c:url>

										<tr class="tr_body">
											<td>
				                                <div class="form-group">
				                                    <input type="checkbox" name="RowCheck" id="RowCheck" class="form-control" value="${item.notino}">
				                                </div>
				                            </td>
											<td align="center">${item.notino}</td>
											<td align="center"><a href="${pageContext.request.contextPath}/admin/admin_notice_edit.do?notino=${item.notino}"><div>${title}</div></a></td>
											<td align="center">
												<button type="submit" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/admin/admin_notice_edit.do?notino=${item.notino}'">수정</button>&nbsp;
												<button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/admin/admin_notice_delete_ok.do?notino=${item.notino}'" id="btn-delete">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>

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
									<c:url value="/admin/admin_notice_list.do" var="prevPageUrl">
										<c:param name="page" value="${pageData.prevPage}" />
										<c:param name="keyword" value="${keyword}" />
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
								<c:url value="/admin/admin_notice_list.do" var="pageUrl">
									<c:param name="page" value="${i}" />
									<c:param name="keyword" value="${keyword}" />
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
									<c:url value="/admin/admin_notice_list.do" var="nextPageUrl">
										<c:param name="page" value="${pageData.nextPage}" />
										<c:param name="keyword" value="${keyword}" />
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

					
					<!-- 상단 버튼 -->
						<div class="clearfix btn-pd" style="padding-bottom: 17px;">
                        <button type="submit" class="btn btn-danger pull-left" onclick="deleteValue();">게시물삭제</button>
                        <div class="pull-right">
							<a
							href="${pageContext.request.contextPath}/admin/admin_notice_write.do"
							class="btn btn-warning pull-right">글쓰기</a>
						</div>
                    </div>
						
				
				<!-- tab-pane 끝 -->
			</div>
			<!-- tab-content 끝 -->
		</div>
		<!-- content_pd 끝 -->
	</div>
	<!-- content 끝 -->
	<!-- Javascript -->
	<script src="../assets/js/bootstrap.min.js"></script>

	
</body>

</html>