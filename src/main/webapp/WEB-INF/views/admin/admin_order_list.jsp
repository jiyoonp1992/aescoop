<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

%>
<html>

<head>
    <meta charset="UTF-8" />
    <title>4조 이숲 관리자</title>

    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />

    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

    <!-- 공통 style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_common.css" />

    <!-- sweetalert style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />

    <!-- 개별 style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_order_list.css" />


    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>

    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	
	<!-- 체크박스 다중 삭제 -->
	<script type="text/javascript">
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			var url = "${pageContext.request.contextPath}/admin/order_delete_ok";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");				 
				if(chk == true) {
					$.ajax({
					    url : url,                    // 전송 URL
					    type : 'POST',                // GET or POST 방식
					    traditional : true,
					    data : {
					    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
					    },
		                success: function(json){
		                    if(json = 1) {
		                        alert("삭제가 완료되었습니다.");
		                        window.location = "${pageContext.request.contextPath}/admin/order_list";
		                    }
		                    else{
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
            <div class="title">주문목록</div>

            <!-- 조건 검색 및 분류 -->
            <div class="search_box">
                <form action="${pageContext.request.contextPath}/admin/order_list">
			    		<div class="sc_title pull-left">진행상태</div>
			    	<div class="status_bt">
				    	<input type="submit" name="orderstatus" id="orderstatus1" value="전체" <c:if test="${orderstatus == '전체' || orderstatus == ''}"> class="status_active"</c:if> />
				    	<input type="submit" name="orderstatus" id="orderstatus1" value="결제완료" <c:if test="${orderstatus == '결제완료'}"> class="status_active"</c:if> />
				    	<input type="submit" name="orderstatus" id="orderstatus1" value="배송준비중" <c:if test="${orderstatus == '배송준비중'}"> class="status_active"</c:if> />
				    	<input type="submit" name="orderstatus" id="orderstatus1" value="배송완료" <c:if test="${orderstatus == '배송완료'}"> class="status_active"</c:if> />
				    	<input type="submit" name="orderstatus" id="orderstatus1" value="발송완료" <c:if test="${orderstatus == '발송완료'}"> class="status_active"</c:if> />
				    	<input type="submit" name="orderstatus" id="orderstatus1" value="취소요청중" <c:if test="${orderstatus == '취소요청중'}"> class="status_active"</c:if> />
				    	<input type="submit" name="orderstatus" id="orderstatus1" value="취소완료" <c:if test="${orderstatus == '취소완료'}"> class="status_active"</c:if> />
			    	</div>
                </form>

                <!-- 조건 검색 -->

                
                <div class="c_search clearfix">

                    <!-- 타이틀 -->
                    
                    <form method="get" action="${pageContext.request.contextPath}/admin/order_list">
                    
                    <div class="sc_title pull-left">조건검색</div>

                    <!-- 폼(1) - 분류 -->
                    <div class="form-group pull-left">
                        <select name="prod_view" id="prod_view" class="form-control pull-left" >
                            <option value="username"<c:if test="${prod_view == 'username'}">selected</c:if>>이름</option>
                            <option value="userid"<c:if test="${prod_view == 'userid'}">selected</c:if>>아이디</option>
                            <option value="orderno"<c:if test="${prod_view == 'orderno'}">selected</c:if>>주문번호</option>
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

                <div role="tabpanel" class="tab-pane fade in active" id="admin_order_list">

                    <div class="clearfix btn-pd" style="padding-bottom: 17px;">
                        <button type="submit" class="btn btn-danger pull-left" onclick="deleteValue();">주문삭제</button>
                        <br />
                    </div>

                    <!-- 제품리스트 테이블 시작 -->
                    <table class="prod_table" border="0" cellspacing="0" cellpadding="0">
                        <tr class="tr_header">
                            <td width="4%">
                                <div class="form-group">
                                    <input type="checkbox" name="allCheck" id="allCheck" class="form-control">
                                </div>
                            </td>
                            <td width="20%">주문일</td>
                            <td>주문번호</td>
                            <td width="14%">주문자명</td>
                            <td width="15%">주문금액</td>
                            <td width="15%">주문상태</td>
                            <td width="12%">기능</td>
                        </tr>

                        <!-- 제품(1) -->

                        <c:choose>
                            <c:when test="${output ==null || fn:length(output) == 0}">
                                <tr class="tr_body">
                                    <td align="center" colspan="7">조회결과가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="item" items="${output}" varStatus="status">
                                    <c:set var="username" value="${item.username}"/>
                                        <tr class="tr_body">
				                            <td>
				                                <div class="form-group">
				                                    <input type="checkbox" name="RowCheck" id="RowCheck" class="form-control" value="${item.orderno}">
				                                </div>
				                            </td>
				                            <td><a href="${pageContext.request.contextPath}/admin/order_view?orderno=${item.orderno}">${item.paid}</a></td>
				                            <td><a href="${pageContext.request.contextPath}/admin/order_view?orderno=${item.orderno}">${item.orderno}</a></td>
				                            <td><a href="${pageContext.request.contextPath}/admin/order_view?orderno=${item.orderno}">${item.username} [${item.userid}]</a></td>
				                            <td>₩ <fmt:formatNumber pattern="###,###,###" value="${item.tprice}" /></td>
				                            <td>
				                                <form method="post" action="${pageContext.request.contextPath}/admin/order_status_edit_ok">
				                                	<input type="hidden" name="orderno" id="orderno" class="form-control" value="${item.orderno}">
				                                	<div class="form-group pull-left">
					                                    <select name="orderstatus" id="orderstatus" class="form-control pull-left">
						                                	<option value="결제완료" <c:if test="${item.orderstatus == '결제완료'}">selected</c:if>>결제완료</option>
															<option value="배송준비중" <c:if test="${item.orderstatus == '배송준비중'}">selected</c:if>>배송준비중</option>
															<option value="발송완료" <c:if test="${item.orderstatus == '발송완료'}">selected</c:if>>발송완료</option>
															<option value="배송완료" <c:if test="${item.orderstatus == '배송완료'}">selected</c:if>>배송완료</option>
															<option value="취소요청중" <c:if test="${item.orderstatus == '취소요청중'}">selected</c:if>>취소요청중</option>
															<option value="취소완료" <c:if test="${item.orderstatus == '취소완료'}">selected</c:if>>취소완료</option>
						                                </select>
					                                </div>
					                                <button type="submit" class="btn btn-danger pull-left">적용</button>
					                                <div class="clearfix"></div>
				                                </form>
				                                
				                            </td>
				                            <td>
				                                <a href="${pageContext.request.contextPath}/admin/order_view?orderno=${item.orderno}" class="btn btn-warning">상세보기</a>
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
									<c:url value="/admin/order_list?orderstatus=${orderstatus}"
										var="prevPageUrl">
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
								<c:url value="/admin/order_list?orderstatus=${orderstatus}" var="pageUrl">
									<c:param name="page" value="${i}" />
									<c:param name="keyword" value="${keyword}" />
								</c:url>

								<%-- 페이지 번호 출력 --%>
								<c:choose>
									<%--  현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
									<c:when test="${pageData.nowPage == i}">
										<li class="active"><a>${i}</a></li>
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
									<c:url value="/admin/order_list?orderstatus=${orderstatus}"
										var="nextPageUrl">
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
					

                    <div class="clearfix btn-pd" style="padding-bottom: 17px;">
                        <button type="submit" class="btn btn-danger pull-left" onclick="deleteValue();">주문삭제</button>
                        <br />
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
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

    <!-- sweetalert 플러그인 참조 -->
    <script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.js"></script>

    <script>
        $(function() {
            $("#mytab li:first-child").tab('show');

            $("button#btn-delete").click(function() {
                    // 확인, 취소버튼에 따른 후속 처리 구현
                    swal({
                        title: '확인',                // 제목
                        text: "정말 선택하신 항목을 삭제하시겠습니까?",  // 내용
                        type: 'warning',              // 종류
                        confirmButtonText: 'Yes',     // 확인버튼 표시 문구
                        showCancelButton: true,       // 취소버튼 표시 여부
                        cancelButtonText: 'No',       // 취소버튼 표시 문구
                    }).then(function(result) {        // 버튼이 눌러졌을 경우의 콜백 연결
                        if (result.value) {           // 확인 버튼이 눌러진 경우
                            swal('삭제', '성공적으로 삭제되었습니다.', 'success');
                        } else if (result.dismiss === 'cancel') {   // 취소버튼이 눌러진 경우
                            swal('취소', '삭제가 취소되었습니다.', 'error');
                        }
                    });
                });
        });
    </script>
</body>

</html>