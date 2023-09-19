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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/my_order_view.css" />
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
</head>

<body>
	<header>
	<%@ include file="../index_header.jsp" %>
	</header>
	
	<!-- 주소록 상단 -->
    <div id="mypage_box">
        <div id="mypage_header" class="clearfix">
            <h1>환영합니다. ${user.username}님</h1>
            <input type="hidden" name="userno" value="${user.userno}" />
            <!-- 드롭다운 -->
            <div class="dropdown clearfix">
                <a id="dropdownMenu1" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">주문내역 <b class="glyphicon glyphicon-menu-down pull-right"></b></a>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/mypage/main">계정정보</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/mypage/address">주소록</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/mypage/order?userno=${user.userno}">주문내역</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/mypage/review?userno=${user.userno}">후기</a></li>
                    <li role="presentation" class="divider"></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/mypage/withdrawal">회원탈퇴</a></li>
                </ul>
            </div>
            <!-- 드롭다운 끝 -->
        </div>
    </div>
    <!-- 주소록 상단 끝 -->
	<div id="mypage_body">
		<div id="order_hd">
			<div class="h10"><!-- height10 --></div>
			<h1>주문내역</h1>
			<span>주문한 상품의 배송상태를 확인할 수 있습니다. 언제나 빠른 발송, 배송이 가능하도록 최선을 다하겠습니다.</span>
		</div>
		<br />
		<div class="table-responsive">
			<table class="prod_table">
				<tr class="tr_header">
					<td>상품코드</td>
					<td>상품명</td>
					<td>상품가격</td>
					<td>옵션</td>
					<td>수량</td>
				</tr>

				<tr class="tr_body">
					<c:forEach var="item" items="${output_prod}" varStatus="status">
						<tr height="70">
							<td>${item.prodno}</td>
							<td>${item.pname}</td>
							<td><fmt:formatNumber pattern="###,###,###" value="${item.price}" />원</td>
							<td>${item.size}</td>
							<td>${item.amount}</td>
						</tr>
					</c:forEach>
				</tr>
			</table>
		</div>
		
		<div class="h10"><!-- height10 --></div>

		<table class="tprice_table">
			<tr>
				<td class="td_title">총 결제금액</td>
				<td class="td_con"><fmt:formatNumber pattern="###,###,###" value="${output.tprice}" />원</td>
			</tr>
		</table>
		
		<div class="h30"><!-- height30 --></div>

		
		<table class="order_view_detail">
			<tr>
				<td>주문번호</td>
				<td>${output.orderno}</td>
			</tr>
			<tr>
				<td>주문일자</td>
				<td>${output.paid}</td>
			</tr>
			<tr>
				<td>주문처리상태</td>
				<td>${output.orderstatus}</td>
			</tr>
		</table>
		
		<div class="h30"><!-- height30 --></div>

		<!--처리시간시작-->
		<table class="status_date table_lg_view">
			<tr>
				<td class="td_title"><span>주문상태</span></td>
				<td><span>결제완료</span><br>${output.paid}</td>
				<td><span>발송완료</span><br>${output.shipped}</td>
				<td><span>주문취소</span><br>${output.cancel}</td>
			</tr>
		</table>
		
		<table class="status_date table_sm_view">
			<tr>
				<td class="td_title"><span>주문상태</span></td>
			</tr>
			<tr>
				<td><span>결제완료</span><br>${output.paid}</td>
			</tr>
			<tr>
				<td><span>발송완료</span><br>${output.shipped}</td>
			</tr>
			<tr>
				<td><span>주문취소</span><br>${output.cancel}</td>
			</tr>
		</table>

		<div class="h30"><!-- height30 --></div>

		<!-- 배송정보 ----------------------------------------------------------------->
		<table class="order_view_detail">
			<tr>
				<td>배송받는 분</td>
				<td>${output.username}</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${output.usertel}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${output.postno}&nbsp;${output.address1}&nbsp;${output.address2}&nbsp;${output.address3}</td>
			</tr>
			<tr>
				<td>요청사항</td>
				<td>${output.requirement}</td>
			</tr>
		</table>
		
		<div class="h30"><!-- height30 --></div>
		
		<!-- 주문취소 ----------------------------------------------------------------->
		<c:if test="${output.orderstatus == '결제완료' || output.orderstatus == '배송준비중'}">
			<div class="list_cancel">
				<form method="post" action="${pageContext.request.contextPath}/admin/order_list_cancel">
					<input type="hidden" name="orderno" value="${output.orderno}" />
					<input type="submit" value="주문취소" class="btn btn-warning cancel_bt" />
				</form>
			</div>
		</c:if>

	</div>

	<footer>
	<%@ include file="../index_footer.jsp" %>
	</footer>
	
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>

</html>