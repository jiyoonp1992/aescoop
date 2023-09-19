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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/read_design.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/FlexSlider/flexslider.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/ImageSlider/slider2.css" />


	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>

	<!-- 웹 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	
	<style type="text/css">
		.carousel-inner > .carousel-item > img {
		width: 100%;
		} 
	</style>

</head>

<body>



	<header>
	<%@ include file="../index_header.jsp" %>
	</header>

	<div id="p-container">
		<div class="title-wrapper">
			<h1 class="title">기능과 환경에 대한 배려 깊은 소통</h1>
		</div>
		
		<div class="image-story"><img src="${pageContext.request.contextPath}/assets/img/design_phil_1.jpg"></div>

		<div class="bodycopy-wrapper">
		
			<div class="bodycopy">
				<div class="leftcopy-wrapper">
					<h2 class="leftcopy-title">이숲은 사려깊은 디자인이 우리 삶의 질을 높인다는 확고한 믿음이 있습니다.</h2>
				</div>
				<p class="bodycopy-copy">
					이숲은 지적이고 지속 가능한 디자인에 대하여 진정성 있는 관심을 가지고 있으며, 이는 이숲의 모든 분야로 이어집니다. 
					모든 제품 성분에 세심한 연구가 기본이 되듯, 제품 용기를 선택할 때 또한 쉽게 사용할 수 있고 우리 눈에도 아름다우면서도 
					실용성을 중시한 용기들을 선택하고 있습니다.
				</p>
				
				<p class="bodycopy-copy">
					이숲은 새로운 스토어오픈을 준비할 때 이미 그 장소에 있는 것을 어떻게 활용하고 협력할 것인지 가장 먼저 염두에 둡니다. 
					지역과 어울리지 않는 공간이 되기보다는, 그 지역의 거리 속 한 구성원으로 조화롭게 가치를 더하는 것이 우리의 진정한 
					의의입니다. 따라서 지역과 연관성 있는 디자인 요소를 활용하기 위해 심혈을 기울입니다.									
				</p>
				<a href="${pageContext.request.contextPath}/search/store_search" class="link_button">이숲 매장 찾기</a>
			</div>
			
		</div>
		

		<div class="quote-wrapper">
			<div class="quote-paragraph">
				<p>'It is your duty in life to<br/>
				 save your dream.'</p>
			</div>
			<div class="quote-author">
				Amedeo Modigliani
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