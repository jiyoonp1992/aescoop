<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

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
    <!-- style -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/my_address.css" />
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/address.js"></script>
</head>

<body>
<header>
	<%@ include file="../index_header.jsp" %>
	</header>
    <!-- 주소록 상단 -->
    <div id="mypage_box">
        <div id="mypage_header" class="clearfix">
            <h1>환영합니다. ${user.username}님</h1>
            <!-- 드롭다운 -->
            <div class="dropdown clearfix">
                <a id="dropdownMenu1" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">주소록 <b class="glyphicon glyphicon-menu-down pull-right"></b></a>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath}/mypage/main">계정정보</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath}/mypage/address?userno=${user.userno}">주소록</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath}/mypage/order?userno=${user.userno}">주문내역</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath}/mypage/review?userno=${user.userno}">후기</a></li>
					<li role="presentation" class="divider"></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="${pageContext.request.contextPath}/mypage/withdrawal">회원탈퇴</a></li>
                </ul>
            </div>
            <!-- 드롭다운 끝 -->
        </div>
    </div>
    <!-- 주소록 상단 끝 -->
    <!-- 주소록 하단 -->
    <div id="addressInfo">
        <!-- 배송지 주소-->
        <div id="address" class="clearfix">
            <!-- 배송지 편집 아코디언 -->
            <div id="address_hd" class="clearfix">
                <div class="panel-group" id="accordion">
                    <!-- 배송주소 -->
                    <div class="panel panel-default">
                        <a class="accordion-toggle clearfix" data-toggle="collapse" data-parent="#accordion" href="#collapse_ad_One">
                            <span class="pull-left">배송 주소</span>
                            <span class="pull-right">편집</span>
                        </a>
                        <div id="collapse_ad_One" class="panel-collapse collapse">
                            <form class="add_address" name="address_form" id="address_form" method="POST" 
                            action="${pageContext.request.contextPath}/mypage/addr_edit_ok">
                            <input type="hidden" name="userno" value="${user.userno}" />
                                <div class="form-group">
                                    <input type="text" id="postno" name="postno" class="form-control-add1" placeholder="우편번호" value="${output.postno}">
                                    <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-success" value="우편번호 찾기"><br>
                                    <input type="text" id="address1" name="address1" class="form-control-add3" placeholder="주소"value="${output.address1}"><br>
                                    <input type="text" id="address2" name="address2" class="form-control-add4" placeholder="상세주소">
                                    <br class="visible-xs">
                                    <br class="visible-sm">
                                    <input type="text" id="address3" name="address3" class="form-control-add5" placeholder="지번">
                                </div>
                                <button type="submit" class="btn btn-success">저장</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 배송지 편집 아코디언 끝 -->
            <!-- 배송지 저장된 내용 -->
            <div id="address_body" class="pull-left">
            <c:choose>
				<c:when test="${output.postno == null}">
					<h1>현재 저장된 배송 주소가 없습니다.</h1>
					<span>
					 향후 구매를 위해 아래에 세부 정보를 입력하십시오.</span>
				</c:when>
			
				<c:when test="${output.postno != null}">
				<span class="name_GN">${output.username}</span>
                <div class="address_one">${output.address1}</div>
                <div class="address_Two">${output.address2}</div>
                <div class="address_PC">${output.postno}</div>
                <div class="address_PH">${output.usertel}</div>
				</c:when>
			</c:choose>

            </div>
            <!-- 배송지 저장된 내용 끝-->
        </div>
        <!-- 배송지 끝-->

    </div>
    <!-- 주소록 하단 끝-->
    <footer>
	<%@ include file="../index_footer.jsp" %>
	</footer>
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>

</html>