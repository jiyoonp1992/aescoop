<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
		<title>4조 이숲</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />
		
		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
		
		<!-- 공통 style -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
	
		<!-- style -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/cart.css" />
		
		
		<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
		
		<!-- 웹 폰트 -->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
</head>
<body>
	<form id="cart-form" method="post" action="${pageContext.request.contextPath}/cart_order_ok">
		<div id="cart_container">
			<div class="cart_header clearfix">
				<span class="cart_title">카트</span>
				<a href="#" class="cart-exit-button">
					<span></span>
					<span></span>
				</a>
			</div>
			<div class="cart_prod">
				<c:choose>
					<%-- 장바구니에 담긴 상품이 없을 경우 --%>
					<c:when test="${output==null || fn:length(output)==0}">
						<div class="cart_none">장바구니에 담긴 상품이 없습니다.</div>
					</c:when>

					<c:otherwise>
						<%-- 장바구니에 담긴 상품이 없을 경우 --%>
						<!--------------- 제품 시작 --------------->
						
						<!-- 장바구니 제품 반복문 -->
						<c:forEach var="item" items="${output}" varStatus="status">
							<input type="hidden" name="cartno" value="${item.cartno}" />
							<div class="prod_list">
								<div class="cart_name_number clearfix">
									<span class="cart_name pull-left">${item.pname}</span>
									
									<!-- 수량 체크 -->
									<div class="prod-amount">
										<!-- 마이너스 버튼 -->
										<a class="prod-amount-minus glyphicon glyphicon-minus" href="#"></a>
										
										<!-- 수량 input -->
										<input type="number" class="amount" id="amount" name="amount" value="${item.amount}">
										
										<!-- 플러스 버튼 -->
										<a class="prod-amount-plus glyphicon glyphicon-plus" href="#"></a>
										
										<p>
											₩ <span class="prod-price"><fmt:formatNumber value="${item.price * item.amount}" pattern="#,###" /></span>
										</p>
										<div class="clearfix"></div>
									</div>
								</div>
								<div class="cart_ml_rm_price clearfix">
									<span class="cart_ml pull-left">${item.size} mL</span>
									<a href="#" class="cart_rm pull-left" data-cartno="${item.cartno}">삭제</a>
								</div>
							</div>
						</c:forEach>
						<!--------------- 제품 끝 --------------->
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		
		<div id="cart_footer">
			<div class="cart_pd clearfix">
				<span class="cart_ft_txt">전 제품 무료 배송 혜택을 즐겨보세요.</span>
				<span class="cart_ft_txt2 pull-left">소계(세금포함)</span>
				<span class="cart_ft_price pull-right">₩ <span class="sum-cart-price"><fmt:formatNumber value="${tprice}" pattern="#,###" /></span></span>
				<button type="submit" class="btn btn-buy">결제하기</button>
				<input type="hidden" name="totalprice" class="totalprice" />
			</div>
		</div>
	</form>
	
	
    
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    
    <!--Google CDN 서버로부터 jQuery 참조 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    <!-- User Code -->
    
     <script type="text/javascript">
    	$(document).ready(function() {
    		/* 뒤로가기 버튼 */
            $(".cart-exit-button").click(function(e){
            	e.preventDefault();
                window.history.back();
            });
    	});
    		
   
    </script>
    
    <script type="text/javascript">
        $(function() {
            /* 장바구니 계산 */
            var total = 0;

            // 함수
            function calcTotal (){

                total = 0;

                $(".prod_list").each(function(){
                    var each_price = parseInt($(this).find(".prod-price").text().replace(",",""));
                    // var each_price = parseInt($(this).find("input[name='cart-check']:checked").parents(".cart-list").find(".prod-price").text().replace(",",""));

                    var each_amount = $(this).find(".amount").val();

                    var origin_each_price = each_price / each_amount;

                    total += origin_each_price * each_amount;

                    var real_total = Number(total).toLocaleString("en");

                    $(".sum-cart-price").html(real_total);
                    $(".totalprice").val(real_total);

                });
            }
            // 함수 끝

            // $(".prod-name-wrap input").change(calcTotal);

            if($(".prod_list").length){
                calcTotal();
            }


            /* 상품 수량 +, - */
            /* 마이너스 버튼 */
            $(".prod-amount-minus").click(function(e){

                e.preventDefault();

                var prod_price = $(this).next().next().next().find(".prod-price").text().replace(",","");

                // 클릭한 마이너스 버튼 근처의 input val 가져옴
                var prod_amount = $(this).next().val();

                //수량이 0으로 내려갈 때
                if (prod_amount<2){
                    alert("상품의 수량은 0일 수 없습니다.");
                    return;
                }

                // 가져온 val에 -1
                $(this).next().val(parseInt(prod_amount)-1);

                // 변한 val 담음
                var now_amount = $(this).next().val();

                // 1개의 상품 금액 담기
                var origin_price = prod_price/prod_amount;

                // 상품 금액과 변한 val를 계산하여 출력
                var total_prod_price = parseInt(origin_price)*now_amount;
                var total = Number(total_prod_price).toLocaleString("en");
                $(this).next().next().next().find(".prod-price").html(total);

                // 합계 재계산
                calcTotal();

            });

            /* 플러스 버튼 */
            $(".prod-amount-plus").click(function(e){

                e.preventDefault();

                // 클릭한 플러스 버튼 근처의 상품 금액 가져옴
                var prod_price = $(this).next().find(".prod-price").text().replace(",","");


                // 클릭한 플러스 버튼 근처의 input val 가져옴
                var prod_amount = $(this).prev().val();

                // 가져온 val에 +1
                $(this).prev().val(parseInt(prod_amount)+1);

                // 변한 val 담음
                var now_amount = $(this).prev().val();

                // 1개의 상품 금액 담기
               	var origin_price = prod_price/prod_amount;

                // 상품 금액과 변한 val를 계산하여 출력
                var total_prod_price = parseInt(origin_price)*now_amount;
                var total = Number(total_prod_price).toLocaleString("en");

                $(this).next().find(".prod-price").html(total);

                // 합계 재계산
                calcTotal();

            });



            /* 상품 삭제 */
            //상품 개별 삭제 버튼
            $(".cart_rm").click(function(e){
            	e.preventDefault();
                var result = confirm("상품을 정말 삭제하시겠습니까?");
                let current = $(this);  // 이벤트가 발생한 객체 자신 ==> <a>태그
                let cartno = current.data('cartno');     // data-cartno 값을 가져옴

             	if (result) {
                    // delete 메서드로 Ajax 요청 --> <form> 전송이 아니므로 직접 구현한다.
                    $.delete("${pageContext.request.contextPath}/cart_delete", {
                    	"cartno": cartno
                    }, function(json) {
                    	if (json.rt == "OK") {
                    	alert("삭제되었습니다.");
                    	// 삭제 완료 후 목록 페이지로 이동
                    	window.location = "${pageContext.request.contextPath}/cart";
                        }
                    });
                    
                    $(this).parents().parents().remove(".prod_list");
             	} 
            });

        });
    </script>

</body>
</html>