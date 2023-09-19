<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>4조 이숲</title>
    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <!-- 공통 style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/footer.css" />
    <!-- style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/product/product.css" />
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>

    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/javascript">
    </script>
</head>

<body>
    <header>
		<%@ include file="../index_header.jsp" %>
    </header>
    <div id="container">
		<input type="hidden" name="prodno" value="${output.prodno}" />
        <!-- 이전 페이지 링크 -->
        <div class="pre_page">
            <a href="${pageContext.request.contextPath}/product?cateno=${output.cateno}" class="pre_page_link">${output.category}</a>
            <span class="division"></span><a href="${pageContext.request.contextPath}/product?cateno=${output.cateno}&subcateno=${output.subcateno}" class="pre_page_link">${output.sub_category}</a>
        </div>
        <!-- 제품 사진과 정보 -->
        <div class="clearfix">
        <div class="prod_photo col-sm-6 col-xs-12 clearfix">
            <img alt="제품사진" src="${output.file}" class="img">
            <c:if test="${output.size != ''}">
            	<div class="size">${output.size} mL</div>
            </c:if>
        </div>
        <div class="prod_info col-sm-6 col-xs-12">
            <h2>${output.pname}</h2>
            ${output.content}
            <form id="addCartForm" action="${pageContext.request.contextPath}/add_cart">
            	<input type="hidden" name="prodno" value="${output.prodno}"/ >
            	<button type="submit" class="prod_info_cart btn btn-success">카트에 추가 - ￦<fmt:formatNumber pattern="###,###,###" value="${output.price}" /></button>
            </form>
            <div class="prod_info_char_box">
            	<c:if test="${output.skintype != ''}">
	            	<div class="prod_info_char">
	                    <span class="prod_info_char_title">타입</span>
	                    <br>
	                    <span class="prod_info_char_content">${output.skintype}</span>
	                </div>
	                <hr>
	            </c:if>


				<c:if test="${output.feels != ''}">
	            	<div class="prod_info_char">
	                    <span class="prod_info_char_title">사용감</span>
	                    <br>
	                    <span class="prod_info_char_content">${output.feels}</span>
	                </div>
	                <hr>
	            </c:if>
	            
	            <c:if test="${output.ingredient != ''}">
	            	<div class="prod_info_char">
	                    <span class="prod_info_char_title">주요 성분</span>
	                    <br>
	                    <span class="prod_info_char_content">${output.ingredient}</span>
	                    <!-- 상품정보 더보기 버튼 -->
	                    <a href="#" class="glyphicon glyphicon-plus"></a>
	                    <!-- 상품정보 더보기 오버레이 -->
	                    <div class="prod_info_char_more_overlay">
	                        <a href="#" class="x_icon"> <img class="x_icon_img" src="${pageContext.request.contextPath}/assets/img/prod_skin/free-icon-x-symbol-75519.png">
	                        </a>
	                        <div class="prod_info_char_more_overlay_text">
	                        <h3>성분</h3>
	                        <br>
	                        <p>${output.ingredient}</p>
	                        <br>
	                        <blockquote>성분 목록은 변경될 수 있습니다. 구매하신 제품에 대한 정확한 성분 목록은, 사용 전 제품 라벨을 참조하시기 바랍니다.</blockquote>
	                        </div>
	                    </div>
	                    <!-- 상품정보 더보기 오버레이 끝 -->
	                </div>
	            </c:if>

                
            </div>
        </div>
        </div>
        <!-- 선물 포장 안내 문구 -->
        <div class="gift">
            <h2>무료 선물 포장 서비스</h2>
            <p>주문하신 모든 제품에 대해 선물 포장 서비스를 제공해 드립니다.</p>
        </div>
        <!-- 샘플 이미지 -->
        <div class="row">
        <img src="${output.file2}" class="sample_img col-sm-6 col-xs-12">
        <!-- 사용법 소개 -->
        <div class="how_to_use col-sm-6 col-xs-12">
        	<c:if test="${output.directions != ''}">
	        	<h2>사용법</h2>
            	<p class="how_to_use_main">${output.directions}</p>
	        </c:if>          	
            
            <ul>
            	<c:if test="${output.amount != ''}">
	            	<li>
	                    <h3>사용량</h3>
	                    <p>${output.amount}</p>
	                </li>
	            </c:if>   
	            
	            <c:if test="${output.texture != ''}">
	            	<li>
	                    <h3>텍스처</h3>
                    	<p>${output.texture}</p>
	                </li>
	            </c:if>   
	            
	            <c:if test="${output.scent != ''}">
	            	<li>
	                    <h3>향</h3>
                    	<p>${output.scent}</p>
	                </li>
	            </c:if>       
            </ul>
        </div>
        </div>
        <!-- 사용법 소개 끝 -->
        
        <!-- 후기 -->
        <div class="review row">
        <!-- 후기 입력창 -->
        <div class="review_input col-sm-6 col-xs-12">
        <h2>이용자 후기</h2>
        <form id="addReivewForm" action="${pageContext.request.contextPath}/add_review">
        	<textarea placeholder="여기에 작성하세요." name="content"></textarea>
        	<input type="hidden" id="prodno" name="prodno" value="${output.prodno}">
				<div class="review_rating">
					<fieldset class="rating">
						<input type="radio" id="rating_1_star5" name="rate" value="5"><label for="rating_1_star5"></label>
						<input type="radio" id="rating_1_star4" name="rate" value="4"><label for="rating_1_star4"></label>
						<input type="radio" id="rating_1_star3" name="rate" value="3"><label for="rating_1_star3"></label>
						<input type="radio" id="rating_1_star2" name="rate" value="2"><label for="rating_1_star2"></label>
						<input type="radio" id="rating_1_star1" name="rate" value="1"><label for="rating_1_star1"></label>
					</fieldset>
				</div>
			<button type="submit" class="pull-right">제출</button>
        </form>
        
        
        </div>
        <!-- 후기 입력창 끝 -->
        <!-- 후기들 -->
        <div class="review_output col-sm-6 col-xs-12">
				<c:choose>
					<c:when test="${output2 ==null || fn:length(output2) == 0}">
						<div class="review_none">후기가 없습니다.</div>
					</c:when>
					<c:otherwise>
						<ul class="review_output_ul">
							<c:forEach var="item" items="${output2}" varStatus="vs">
								<li class="review_output_li">
							        <span class="review_userid">${item.userid}</span>
							        <div class="review_rating">
										<fieldset class="rating">
											<c:if test="${item.rate == 5}">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
											</c:if>
											<c:if test="${item.rate == 4}">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
											</c:if>
											<c:if test="${item.rate == 3}">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
											</c:if>
											<c:if test="${item.rate == 2}">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
											</c:if>
											<c:if test="${item.rate == 1}">
												<img src="${pageContext.request.contextPath}/assets/img/star-on.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
												<img src="${pageContext.request.contextPath}/assets/img/star.png">
											</c:if>
										</fieldset>
									</div>
							        <br>
							        <span class="review_text">${item.content}</span>
						        </li>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>
				<!-- 페이지 번호 표시(페이지네이션) 시작 -->
					<div class="pagination_center">
						<ul class="pagination">

							<%-- 페이지 번호 구현 --%>
							<%-- 이전 그룹에 대한 링크 --%>
							<c:choose>
								<%--    이전 그룹으로 이동 가능하다면? --%>
								<c:when test="${pageData.prevPage > 0}">
									<%--  이동할 URL 생성 --%>
									<c:url value="/product_view?prodno=${output.prodno}"
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
								<c:url value="/product_view?prodno=${output.prodno}" var="pageUrl">
									<c:param name="page" value="${i}" />
									<c:param name="keyword" value="${keyword}" />
									<c:param name="prod_view2" value="${prod_view2}" />
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
									<c:url value="/product_view?prodno=${output.prodno}"
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
        <!-- 후기들 끝 -->
        </div>
        <!-- 후기 끝 -->
        
        
    <footer>
		<%@ include file="../index_footer.jsp" %>
    </footer>
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/js/product/product.js"></script>
    
    <!--Google CDN 서버로부터 jQuery 참조 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    <!-- User Code -->
    <script type="text/javascript">
        $(function() {
            // #addForm에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
            $("#addCartForm").ajaxForm({
                // 전송 메서드 지정
                method: "GET",
                // 서버에서 200 응답을 전달한 경우 실행됨
                success: function(json) {
                    console.log(json);
                    
                    // json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
                    if (json.rt == "OK") {
                    	alert("카트 추가 완료되었습니다.");
                    }
                }
            });
		});
	</script>
    
    
</body>

</html>