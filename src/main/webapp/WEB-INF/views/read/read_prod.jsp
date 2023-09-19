<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>4조 이숲</title>

	<!-- 모바일 웹 페이지 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />

	<!-- bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

	<!-- 공통 style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/header.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/footer.css" />

	<!-- style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/read_prod.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/FlexSlider/flexslider.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/ImageSlider/slider2.css" />


	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>

	<!-- 웹 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>


</head>

<body>
	<header>
	<%@ include file="../index_header.jsp" %>
	</header>	
	
	
	<div id="p-container">
		<div class="title-wrapper">
			<h1 class="title">세심한 열정</h1>
		</div>
		
		<div class="image-story"><img src="${pageContext.request.contextPath}/assets/img/prod_phil_1.jpg"></div>
		
		<div class="bodycopy-wrapper">
		
			<div class="bodycopy">
				<p class="bodycopy-copy">
					이숲은 초기부터 제품 연구개발에 매우 독특한 접근 방식을 적용해왔습니다. 이숲의 숙련
					화학자들은 본사에 위치한 실용적이고 맞춤화 되어 있는 연구소에서 제품 아이디어를 내고,<br class="mobile_none"> 
					배합에 대해 연구하고 견본을 만듭니다. 이숲은 세계 최고의 공급 업체로부터 조달 받은
					원료에 최첨단 기술을 적용하고 오랜 과학적 경험과 원칙에 따라 최고 품질의 제품으로 탄생시킵니다.
				</p>
				
				<p class="bodycopy-copy">
					이숲은 고객이 표현한 니즈에 그대로부합하는 제품만을 출시하고 심도 깊은 조사 후에 가장 높은 
					품질과 효능이 담긴 제품을 제공합니다.									
				</p>
			</div>
		</div>
		
		<!-- 이미지2, 내용 -->
		<div class="bodycopy-wrapper-2">	
			<div class="bodycopy-2">
				<div class="leftcopy-wrapper">
					<h2 class="leftcopy-title">매장 찾기</h2>
				</div>
				
				<p class="bodycopy-copy">
						이숲은 고객들에게 이숲 제품을 모방한 제품들이 시장에 존재하고 있음을 알려드리고자 합니다.
						그들은 이숲만의 고유 디자인에 가깝게 디자인한 패키지에 제품을 담아 판매하고 있습니다.
				</p>
				<p class="bodycopy-copy">	
						이숲의 제품은 오직 이숲 시그니처 스토어, 백화점 카운터, 엄선된 스타키스트 및 이숲 공식 
						홈페이지에서만 구매하실 수 있습니다.
				</p>
				<a href="${pageContext.request.contextPath}/search/store_search" class="link_button">매장 찾기</a>
			</div>	
		</div>
		
		<div class="image-wrapper-2">
			<div class="image-story-2"></div>
		</div>
		
		<div class="clearfix"></div>
		

		<div class="quote-wrapper">
			<div class="quote-paragraph">
				<p class="eng_text">'The merit of originality is not novelty; it is sincerity.'</p>
			</div>
			<div class="quote-author">
				Thomas Carlyle
			</div>
		</div>
	</div>
	



	<footer>
		<%@ include file="../index_footer.jsp" %>
	</footer>



	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

	<!-- 하단 스토어 슬라이드 -->
    <script src="${pageContext.request.contextPath}/plugins/ImageSlider/slider2.js"></script>
    <script defer src="${pageContext.request.contextPath}/plugins/FlexSlider/jquery.flexslider.js"></script>
    <script defer src="${pageContext.request.contextPath}/plugins/FlexSlider/slide.js"></script>

</body>

</html>